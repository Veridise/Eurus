/*=====================================================*
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *=====================================================*/


/// @use-src 0:"tests/YulCompilerTest1.sol"
object "SafeMath_226" {
    code {
        /// @src 0:887:5475  "library SafeMath {..."
        mstore(64, memoryguard(128))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        let _1 := allocate_unbounded()
        codecopy(_1, dataoffset("SafeMath_226_deployed"), datasize("SafeMath_226_deployed"))

        setimmutable(_1, "library_deploy_address", address())

        return(_1, datasize("SafeMath_226_deployed"))

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
            revert(0, 0)
        }

        /// @src 0:887:5475  "library SafeMath {..."
        function constructor_SafeMath_226() {

            /// @src 0:887:5475  "library SafeMath {..."

        }
        /// @src 0:887:5475  "library SafeMath {..."

    }
    /// @use-src 0:"tests/YulCompilerTest1.sol"
    object "SafeMath_226_deployed" {
        code {
            /// @src 0:887:5475  "library SafeMath {..."
            mstore(64, memoryguard(128))

            let called_via_delegatecall := iszero(eq(loadimmutable("library_deploy_address"), address()))

            revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74()

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

            function allocate_unbounded() -> memPtr {
                memPtr := mload(64)
            }

            function revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74() {
                revert(0, 0)
            }

        }

        data ".metadata" hex"a36469706673582212205fba4bc9001eadb7f40931558f59f1fcae88bb993458ec4a5b6e9e6bd7deb7f66c6578706572696d656e74616cf564736f6c634300080b0041"
    }

}

