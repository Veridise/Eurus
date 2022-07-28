
/// @use-src 0:"ex/ex.sol"
object "exlib_16" {
    code {
        /// @src 0:58:167  "library exlib {..."
        mstore(64, memoryguard(128))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        let _1 := allocate_unbounded()
        codecopy(_1, dataoffset("exlib_16_deployed"), datasize("exlib_16_deployed"))

        setimmutable(_1, "library_deploy_address", address())

        return(_1, datasize("exlib_16_deployed"))

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
            revert(0, 0)
        }

        /// @src 0:58:167  "library exlib {..."
        function constructor_exlib_16() {

            /// @src 0:58:167  "library exlib {..."

        }
        /// @src 0:58:167  "library exlib {..."

    }
    /// @use-src 0:"ex/ex.sol"
    object "exlib_16_deployed" {
        code {
            /// @src 0:58:167  "library exlib {..."
            mstore(64, memoryguard(128))

            let called_via_delegatecall := iszero(eq(loadimmutable("library_deploy_address"), address()))

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0xb67d77c5
                {
                    // sub(uint256,uint256)
                    if iszero(called_via_delegatecall) { revert_error_fb00381150b0555b0bf83aa2d95ae5599abd614bfe490c66e084fe1f454f48e2() }
                    external_fun_sub_15()
                }

                default {}
            }

            revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74()

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

            function allocate_unbounded() -> memPtr {
                memPtr := mload(64)
            }

            function revert_error_fb00381150b0555b0bf83aa2d95ae5599abd614bfe490c66e084fe1f454f48e2() {
                revert(0, 0)
            }

            function revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() {
                revert(0, 0)
            }

            function revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() {
                revert(0, 0)
            }

            function cleanup_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function validator_revert_t_uint256(value) {
                if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
            }

            function abi_decode_t_uint256(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_uint256(value)
            }

            function abi_decode_tuple_t_uint256t_uint256(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 32

                    value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_t_uint256_to_t_uint256_fromStack_library(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple_t_uint256__to_t_uint256__fromStack_library(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_uint256_to_t_uint256_fromStack_library(value0,  add(headStart, 0))

            }

            function external_fun_sub_15() {

                let param_0, param_1 :=  abi_decode_tuple_t_uint256t_uint256(4, calldatasize())
                let ret_0 :=  fun_sub_15(param_0, param_1)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack_library(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74() {
                revert(0, 0)
            }

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

            function panic_error_0x11() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x11)
                revert(0, 0x24)
            }

            function checked_sub_t_uint256(x, y) -> diff {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                if lt(x, y) { panic_error_0x11() }

                diff := sub(x, y)
            }

            /// @ast-id 15
            /// @src 0:78:165  "function sub(uint256 a, uint256 b) public returns (uint256) {..."
            function fun_sub_15(var_a_3, var_b_5) -> var__8 {
                /// @src 0:129:136  "uint256"
                let zero_t_uint256_1 := zero_value_for_split_t_uint256()
                var__8 := zero_t_uint256_1

                /// @src 0:155:156  "a"
                let _2 := var_a_3
                let expr_10 := _2
                /// @src 0:157:158  "b"
                let _3 := var_b_5
                let expr_11 := _3
                /// @src 0:155:158  "a-b"
                let expr_12 := checked_sub_t_uint256(expr_10, expr_11)

                /// @src 0:148:158  "return a-b"
                var__8 := expr_12
                leave

            }
            /// @src 0:58:167  "library exlib {..."

        }

        data ".metadata" hex"a2646970667358221220858fa1192dc6b86fafe4ab5210b01af5a1b71dc164056c8b26d764d6a10562fe64736f6c634300080e0033"
    }

}

