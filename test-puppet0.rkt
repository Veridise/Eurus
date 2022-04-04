#lang rosette
(require "./eurus/yul-helper.rkt")
(require "./eurus/yul-manager.rkt")
(require "./eurus/yul-components.rkt")
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
; uniswap-vm - swapDVT4ETH(uint256)
(define (create-component-swapDVT4ETH)
  (define-symbolic* arg-swapDVT4ETH-0 integer?)
  (assert (>= arg-swapDVT4ETH-0 0))
  (define c (create-call0 attacker-account-addr uniswap-vm "swapDVT4ETH(uint256)" (list
    (cons "uint256" arg-swapDVT4ETH-0))))
  c
)
; (debug) eth-vm - eurus_set_balances
(define (create-component-eth-set-balances)
  (define eth-set-balances-0 uniswap-contract-addr)
  (define-symbolic* eth-set-balances-1 integer?)
  (assert (>= eth-set-balances-1 0))
  (define c (create-call0 attacker-account-addr eth-vm "eurus_set_balances(address,uint256)" (list
    (cons "address" eth-set-balances-0) (cons "uint256" eth-set-balances-1))))
  c
)

; collect
(define components-step0 (list (create-component-swapDVT4ETH)))
; (define components-step0 (list (create-component-eth-set-balances)))
(define-symbolic attack-ptr0 integer?)
(define attack-step0 (list-ref components-step0 attack-ptr0))

(printf "# [synthesis] executing symbolic components...\n")
(attack-step0)

; ===========================================================
; verification procedure after candidate exploit is performed
; ===========================================================
(printf "# [verification] constructing verification conditions...\n")
(printf "# [verification] calling eurus_oracle_price...\n")
(define v0 (make-call0 admin-account-addr puppet-vm "eurus_oracle_price(uint256)" (list
  (cons "uint256" 0)))) ; (fixme) this "uint256" parameter is a dumb placeholder
(define vs0 (read-value v0))

; ===================
; issue solve command
; ===================
(printf "# [solving] solving...\n")
;(solve (assert (bvzero? vs0)))

; ==========
; debug zone
; ==========
;
;(printf "# [debug] using uniswap: provide 10 DVT, get some ETH...\n")
;(define dbg0 (make-call0 attacker-account-addr uniswap-vm "swapDVT4ETH(uint256)" (list
;  (cons "uint256" 10))))
;(printf "          calling getETHBalance...\n")
;(define dbg1 (make-call0 admin-account-addr uniswap-vm "getETHBalance(uint256)" (list
;  (cons "uint256" 0)))) ; (fixme) this "uint256" parameter is a dumb placeholder
;(define dbg1s (read-value dbg1)) ; assemble readable result
;(printf "          ~a\n" dbg1s)

;(printf "# [debug] calling eurus_oracle_price...\n")
;(define dbg2 (make-call0 admin-account-addr puppet-vm "eurus_oracle_price(uint256)" (list
;  (cons "uint256" 0)))) ; (fixme) this "uint256" parameter is a dumb placeholder
;(define dbg2s (read-value dbg2)) ; assemble readable result
;(printf "          ~a\n" dbg2s)