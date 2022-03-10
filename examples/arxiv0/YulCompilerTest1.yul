/*=====================================================*
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *=====================================================*/


/// @use-src 0:"tests/YulCompilerTest1.sol"
object "YulCompilerTest1_32" {
    code {
        /// @src 0:58:321  "contract YulCompilerTest1 {..."
        mstore(64, memoryguard(128))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        let _1 := copy_arguments_for_constructor_16_object_YulCompilerTest1_32()
        constructor_YulCompilerTest1_32(_1)

        let _2 := allocate_unbounded()
        codecopy(_2, dataoffset("YulCompilerTest1_32_deployed"), datasize("YulCompilerTest1_32_deployed"))

        return(_2, datasize("YulCompilerTest1_32_deployed"))

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
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

        function allocate_memory(size) -> memPtr {
            memPtr := allocate_unbounded()
            finalize_allocation(memPtr, size)
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

        function copy_arguments_for_constructor_16_object_YulCompilerTest1_32() -> ret_param_0 {
            let programSize := datasize("YulCompilerTest1_32")
            let argSize := sub(codesize(), programSize)

            let memoryDataOffset := allocate_memory(argSize)
            codecopy(memoryDataOffset, programSize, argSize)

            ret_param_0 := abi_decode_tuple_t_uint256_fromMemory(memoryDataOffset, add(memoryDataOffset, argSize))
        }

        function shift_left_0(value) -> newValue {
            newValue :=

            shl(0, value)

        }

        function update_byte_slice_32_shift_0(value, toInsert) -> result {
            let mask := 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
            toInsert := shift_left_0(toInsert)
            value := and(value, not(mask))
            result := or(value, and(toInsert, mask))
        }

        function identity(value) -> ret {
            ret := value
        }

        function convert_t_uint256_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint256(identity(cleanup_t_uint256(value)))
        }

        function prepare_store_t_uint256(value) -> ret {
            ret := value
        }

        function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
            let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
            sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
        }

        /// @ast-id 16
        /// @src 0:150:206  "constructor(uint256 para0) {..."
        function constructor_YulCompilerTest1_32(var_para0_8) {

            /// @src 0:150:206  "constructor(uint256 para0) {..."

            /// @src 0:194:199  "para0"
            let _3 := var_para0_8
            let expr_12 := _3
            /// @src 0:187:199  "var0 = para0"
            update_storage_value_offset_0t_uint256_to_t_uint256(0x00, expr_12)
            let expr_13 := expr_12

        }
        /// @src 0:58:321  "contract YulCompilerTest1 {..."

    }
    /// @use-src 0:"tests/YulCompilerTest1.sol"
    object "YulCompilerTest1_32_deployed" {
        code {
            /// @src 0:58:321  "contract YulCompilerTest1 {..."
            mstore(64, memoryguard(128))

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x54f363a3
                {
                    // addition(uint256,uint256)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0, param_1 :=  abi_decode_tuple_t_uint256t_uint256(4, calldatasize())
                    let ret_0 :=  fun_addition_31(param_0, param_1)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xb8e983f8
                {
                    // var0()

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_var0_6()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
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

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

            }

            function shift_right_unsigned_dynamic(bits, value) -> newValue {
                newValue :=

                shr(bits, value)

            }

            function cleanup_from_storage_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function extract_from_storage_value_dynamict_uint256(slot_value, offset) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function read_from_storage_split_dynamic_t_uint256(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_uint256(sload(slot), offset)

            }

            /// @ast-id 6
            /// @src 0:124:143  "uint256 public var0"
            function getter_fun_var0_6() -> ret {

                let slot := 0
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }
            /// @src 0:58:321  "contract YulCompilerTest1 {..."

            function revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74() {
                revert(0, 0)
            }

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

            /// @ast-id 31
            /// @src 0:216:318  "function addition(uint256 a, uint256 b) public pure returns (uint256) {..."
            function fun_addition_31(var_a_18, var_b_20) -> var__23 {
                /// @src 0:277:284  "uint256"
                let zero_t_uint256_1 := zero_value_for_split_t_uint256()
                var__23 := zero_t_uint256_1

                /// @src 0:303:304  "a"
                let _2 := var_a_18
                let expr_25 := _2
                /// @src 0:303:308  "a.add"
                let expr_26_self := expr_25
                /// @src 0:309:310  "b"
                let _3 := var_b_20
                let expr_27 := _3
                /// @src 0:303:311  "a.add(b)"
                let expr_28 := fun_add_59(expr_26_self, expr_27)
                /// @src 0:296:311  "return a.add(b)"
                var__23 := expr_28
                leave

            }
            /// @src 0:58:321  "contract YulCompilerTest1 {..."

            function panic_error_0x11() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x11)
                revert(0, 0x24)
            }

            function checked_add_t_uint256(x, y) -> sum {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                // overflow, if x > (maxValue - y)
                if gt(x, sub(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, y)) { panic_error_0x11() }

                sum := add(x, y)
            }

            function array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length) -> updated_pos {
                mstore(pos, length)
                updated_pos := add(pos, 0x20)
            }

            function store_literal_in_memory_30cc447bcc13b3e22b45cef0dd9b0b514842d836dd9b6eb384e20dedfb47723a(memPtr) {

                mstore(add(memPtr, 0), "SafeMath: addition overflow")

            }

            function abi_encode_t_stringliteral_30cc447bcc13b3e22b45cef0dd9b0b514842d836dd9b6eb384e20dedfb47723a_to_t_string_memory_ptr_fromStack(pos) -> end {
                pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 27)
                store_literal_in_memory_30cc447bcc13b3e22b45cef0dd9b0b514842d836dd9b6eb384e20dedfb47723a(pos)
                end := add(pos, 32)
            }

            function abi_encode_tuple_t_stringliteral_30cc447bcc13b3e22b45cef0dd9b0b514842d836dd9b6eb384e20dedfb47723a__to_t_string_memory_ptr__fromStack(headStart ) -> tail {
                tail := add(headStart, 32)

                mstore(add(headStart, 0), sub(tail, headStart))
                tail := abi_encode_t_stringliteral_30cc447bcc13b3e22b45cef0dd9b0b514842d836dd9b6eb384e20dedfb47723a_to_t_string_memory_ptr_fromStack( tail)

            }

            function require_helper_t_stringliteral_30cc447bcc13b3e22b45cef0dd9b0b514842d836dd9b6eb384e20dedfb47723a(condition ) {
                if iszero(condition) {
                    let memPtr := allocate_unbounded()
                    mstore(memPtr, 0x08c379a000000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple_t_stringliteral_30cc447bcc13b3e22b45cef0dd9b0b514842d836dd9b6eb384e20dedfb47723a__to_t_string_memory_ptr__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            /// @ast-id 59
            /// @src 0:1132:1308  "function add(uint256 a, uint256 b) internal pure returns (uint256) {..."
            function fun_add_59(var_a_36, var_b_38) -> var__41 {
                /// @src 0:1190:1197  "uint256"
                let zero_t_uint256_4 := zero_value_for_split_t_uint256()
                var__41 := zero_t_uint256_4

                /// @src 0:1221:1222  "a"
                let _5 := var_a_36
                let expr_45 := _5
                /// @src 0:1225:1226  "b"
                let _6 := var_b_38
                let expr_46 := _6
                /// @src 0:1221:1226  "a + b"
                let expr_47 := checked_add_t_uint256(expr_45, expr_46)

                /// @src 0:1209:1226  "uint256 c = a + b"
                let var_c_44 := expr_47
                /// @src 0:1244:1245  "c"
                let _7 := var_c_44
                let expr_50 := _7
                /// @src 0:1249:1250  "a"
                let _8 := var_a_36
                let expr_51 := _8
                /// @src 0:1244:1250  "c >= a"
                let expr_52 := iszero(lt(cleanup_t_uint256(expr_50), cleanup_t_uint256(expr_51)))
                /// @src 0:1236:1282  "require(c >= a, \"SafeMath: addition overflow\")"
                require_helper_t_stringliteral_30cc447bcc13b3e22b45cef0dd9b0b514842d836dd9b6eb384e20dedfb47723a(expr_52)
                /// @src 0:1300:1301  "c"
                let _9 := var_c_44
                let expr_56 := _9
                /// @src 0:1293:1301  "return c"
                var__41 := expr_56
                leave

            }
            /// @src 0:58:321  "contract YulCompilerTest1 {..."

        }

        data ".metadata" hex"a3646970667358221220d9c66c3812daad24fa74b4eb51283c460dd48fa714dd69b2b16bdfc3223390596c6578706572696d656e74616cf564736f6c634300080b0041"
    }

}

