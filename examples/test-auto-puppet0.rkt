#lang rosette
(require rosette/solver/smt/cvc4)
(current-solver (cvc4 ))
(require json
    (prefix-in env: "../eurus/rosette/env.rkt")
    (prefix-in synth: "../eurus/rosette/synthesis.rkt")
)
(error-print-width 1000000) ; option to print more for a symbolic value (rather than truncate it)
(output-smt #t)
; turn on verbose
(env:verbose #t)
; shortcuts for list and pair construction
(define (: x y) (cons x y))
(define ($ . l) (apply list l))
; =========================================== ;
; ======== vm configuration (shared) ======== ;
; =========================================== ;
(define shared-config (make-hash ($
    (: "linker-symbol" (make-hash ($
        ; no linker symbol to add
    )))
)))
(env:account "deployer" "0000000000000000000000000000000000000006" 100)
(env:account "harness" "0000000000000000000000000000000000000007" 100)
(env:account "zero" (env:zero-account) 0)
(env:account "tgtToken" "0000000000000000000000000000000000000001" 100)
(env:account "ethToken" "0000000000000000000000000000000000000002" 100)
(env:account "uniswap" "0000000000000000000000000000000000000003" 100)
(env:account "pool" "0000000000000000000000000000000000000004" 100)
(env:account "owner" "0000000000000000000000000000000000000005" 100)
; =========================== ;
; ======== shortcuts ======== ;
; =========================== ;
(define base "./puppet/")
(define root "./puppet/output/")
(define deployer (env:@account "deployer"))
(define harness (env:@account "harness"))
(env:var "goal" "tgtToken.balanceOf(address(pool))==0")
; ============================================== ;
; ======== synthesis preparation (demo) ======== ;
; ============================================== ;
; (assumption) account/vm names are the same as variable names in harness contract
; (note) this is a tentative procedure for demo, and the procedure could be further optimized
; 1. call eurus-prepare-folder.sh to get all necessary files (including abi jsons)
; 2. collect all accounts/vm names, and ask Eurus to prepare for sketches and synthesize?() methods
; 3. call eurus-prepare-folder.sh again to finish the preparation
; (env:eurus-prepare-folder base)
(define synth-info (env:collect-synth))
(synth:prepare-synth base synth-info)
(env:eurus-prepare-folder base)
; ===================================== ;
; ======== contract deployment ======== ;
; ===================================== ;
(env:setup root "Synthesis" shared-config #:vm-name "harness" #:address (env:@account "harness"))
(env:setup root "ERC20" shared-config #:vm-name "tgtToken" #:address (env:@account "tgtToken"))
(env:setup root "ERC20" shared-config #:vm-name "ethToken" #:address (env:@account "ethToken"))
(env:setup root "UniswapModel" shared-config #:vm-name "uniswap" #:address (env:@account "uniswap"))
(env:setup root "PuppetPool" shared-config #:vm-name "pool" #:address (env:@account "pool"))

; ======================= ;
; ======== start ======== ;
; ======================= ;
(env:call deployer (env:@vm "harness") "constructor" ($ ))
(env:call harness (env:@vm "tgtToken") "constructor" ($ ))
(env:call harness (env:@vm "ethToken") "constructor" ($ ))
(env:call harness (env:@vm "uniswap") "constructor" ($ ))
(env:call harness (env:@vm "pool") "constructor" ($ ))
(define sol (env:call harness (env:@vm "harness") "attack" ($ )))

(printf "\n# Synthesized Attack:\n\n")
(printf "~a\n" (synth:complete-sol sol))