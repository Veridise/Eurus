
/// @use-src 0:".//Eurus.sol"
object "Eurus_1291" {
    code {
        /// @src 0:58:8402  "contract Eurus {..."
        mstore(64, memoryguard(128))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        constructor_Eurus_1291()

        let _1 := allocate_unbounded()
        codecopy(_1, dataoffset("Eurus_1291_deployed"), datasize("Eurus_1291_deployed"))

        return(_1, datasize("Eurus_1291_deployed"))

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
            revert(0, 0)
        }

        /// @ast-id 382
        /// @src 0:80:96  "constructor() {}"
        function constructor_Eurus_1291() {

            /// @src 0:80:96  "constructor() {}"

        }
        /// @src 0:58:8402  "contract Eurus {..."

    }
    /// @use-src 0:".//Eurus.sol"
    object "Eurus_1291_deployed" {
        code {
            /// @src 0:58:8402  "contract Eurus {..."
            mstore(64, memoryguard(128))

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

        data ".metadata" hex"a2646970667358221220615c4817aceea4880354c4223a7029718dfea9e88d322ab708ba96f88a5c176564736f6c634300080e0033"
    }

}

