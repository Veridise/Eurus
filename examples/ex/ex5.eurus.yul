
/// @use-src 0:"ex/ex.sol"
object "ex5_214" {
    code {
        /// @src 0:2333:2511  "contract ex5 {..."
        mstore(64, memoryguard(128))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        constructor_ex5_214()

        // adapted by Eurus: remove_post_constructor_datacall
        // let _1 := allocate_unbounded()
        // codecopy(_1, dataoffset("ex5_214_deployed"), datasize("ex5_214_deployed"))
        // return(_1, datasize("ex5_214_deployed"))

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
            revert(0, 0)
        }

        /// @ast-id 197
        /// @src 0:2353:2369  "constructor() {}"
        function constructor_ex5_214() {

            /// @src 0:2353:2369  "constructor() {}"

        }
        /// @src 0:2333:2511  "contract ex5 {..."

    }
    /// @use-src 0:"ex/ex.sol"
    object "ex5_214_deployed" {
        code {
            /// @src 0:2333:2511  "contract ex5 {..."
            mstore(64, memoryguard(128))

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0xb67d77c5
                {
                    // sub(uint256,uint256)

                    external_fun_sub_213()
                }

                default {
                    // adapted by Eurus: hijack_dispatcher_miss
                    eurus_dispatcher_miss(selector)
                }
            }

            revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74()

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

            function allocate_unbounded() -> memPtr {
                memPtr := mload(64)
            }

            function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
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

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple_t_uint256__to_t_uint256__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

            }

            function external_fun_sub_213() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1 :=  abi_decode_tuple_t_uint256t_uint256(4, calldatasize())
                let ret_0 :=  fun_sub_213(param_0, param_1)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74() {
                // adapted by Eurus: hijack_dispatcher_revert
                eurus_dispatcher_revert()
            }

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

            function convert_t_type$_t_contract$_exlib_$16_$_to_t_address(value) -> converted {
                converted := value
            }

            function revert_error_0cc013b6b3b6beabea4e3a74a6d380f0df81852ca99887912475e1f66b2a2c20() {
                revert(0, 0)
            }

            function round_up_to_mul_of_32(value) -> result {
                result := and(add(value, 31), not(31))
            }

            function panic_error_0x41() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x41)
                revert(0, 0x24)
            }

            function finalize_allocation(memPtr, size) {
                let newFreePtr := add(memPtr, round_up_to_mul_of_32(size))
                // protect against overflow
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error_0x41() }
                mstore(64, newFreePtr)
            }

            function shift_left_224(value) -> newValue {
                newValue :=

                shl(224, value)

            }

            function abi_decode_t_uint256_fromMemory(offset, end) -> value {
                value := mload(offset)
                validator_revert_t_uint256(value)
            }

            function abi_decode_tuple_t_uint256_fromMemory(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_uint256_fromMemory(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_t_uint256_to_t_uint256_fromStack_library(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple_t_uint256_t_uint256__to_t_uint256_t_uint256__fromStack_library(headStart , value0, value1) -> tail {
                tail := add(headStart, 64)

                abi_encode_t_uint256_to_t_uint256_fromStack_library(value0,  add(headStart, 0))

                abi_encode_t_uint256_to_t_uint256_fromStack_library(value1,  add(headStart, 32))

            }

            function revert_forward_1() {
                let pos := allocate_unbounded()
                returndatacopy(pos, 0, returndatasize())
                revert(pos, returndatasize())
            }

            /// @ast-id 213
            /// @src 0:2409:2507  "function sub(uint256 a, uint256 b) public returns (uint256) {..."
            function fun_sub_213(var_a_199, var_b_201) -> var__204 {
                /// @src 0:2460:2467  "uint256"
                let zero_t_uint256_1 := zero_value_for_split_t_uint256()
                var__204 := zero_t_uint256_1

                /// @src 0:2486:2491  "exlib"
                let expr_206_address := linkersymbol("ex/ex.sol:exlib")
                /// @src 0:2486:2495  "exlib.sub"
                let expr_207_address := convert_t_type$_t_contract$_exlib_$16_$_to_t_address(expr_206_address)
                let expr_207_functionSelector := 0xb67d77c5
                /// @src 0:2496:2497  "a"
                let _2 := var_a_199
                let expr_208 := _2
                /// @src 0:2498:2499  "b"
                let _3 := var_b_201
                let expr_209 := _3
                /// @src 0:2486:2500  "exlib.sub(a,b)"

                // storage for arguments and returned data
                let _4 := allocate_unbounded()
                mstore(_4, shift_left_224(expr_207_functionSelector))
                let _5 := abi_encode_tuple_t_uint256_t_uint256__to_t_uint256_t_uint256__fromStack_library(add(_4, 4) , expr_208, expr_209)

                let _6 := delegatecall(gas(), expr_207_address,  _4, sub(_5, _4), _4, 32)

                if iszero(_6) { revert_forward_1() }

                let expr_210
                if _6 {

                    let _7 := 32

                    if gt(_7, returndatasize()) {
                        _7 := returndatasize()
                    }

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_4, _7)

                    // decode return parameters from external try-call into retVars
                    expr_210 :=  abi_decode_tuple_t_uint256_fromMemory(_4, add(_4, _7))
                }
                /// @src 0:2479:2500  "return exlib.sub(a,b)"
                var__204 := expr_210
                leave

            }
            /// @src 0:2333:2511  "contract ex5 {..."

        }

        
    }

}

