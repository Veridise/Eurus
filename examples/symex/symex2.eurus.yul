
/// @use-src 0:".//Eurus.sol", 1:"symex/symex.sol"
object "symex2_316" {
    code {
        /// @src 1:2846:3347  "contract symex2 is Eurus {..."
        mstore(64, memoryguard(128))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        constructor_symex2_316()

        // adapted by Eurus: remove_post_constructor_datacall
        // let _1 := allocate_unbounded()
        // codecopy(_1, dataoffset("symex2_316_deployed"), datasize("symex2_316_deployed"))
        // return(_1, datasize("symex2_316_deployed"))

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
            revert(0, 0)
        }

        /// @ast-id 273
        /// @src 1:2921:2937  "constructor() {}"
        function constructor_symex2_316() {

            /// @src 1:2921:2937  "constructor() {}"
            constructor_Eurus_1291()

        }
        /// @src 1:2846:3347  "contract symex2 is Eurus {..."

        /// @ast-id 382
        /// @src 0:80:96  "constructor() {}"
        function constructor_Eurus_1291() {

            /// @src 0:80:96  "constructor() {}"

        }
        /// @src 1:2846:3347  "contract symex2 is Eurus {..."

    }
    /// @use-src 0:".//Eurus.sol", 1:"symex/symex.sol"
    object "symex2_316_deployed" {
        code {
            /// @src 1:2846:3347  "contract symex2 is Eurus {..."
            mstore(64, memoryguard(128))

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x0ff4c916
                {
                    // getValue(uint256)

                    external_fun_getValue_299()
                }

                case 0x77ff24f4
                {
                    // test0()

                    external_fun_test0_315()
                }

                case 0x7b8d56e3
                {
                    // setValue(uint256,uint256)

                    external_fun_setValue_287()
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

            function abi_decode_tuple_t_uint256(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple_t_uint256__to_t_uint256__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

            }

            function external_fun_getValue_299() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                let ret_0 :=  fun_getValue_299(param_0)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

            }

            function external_fun_test0_315() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                let ret_0 :=  fun_test0_315()
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

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

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function external_fun_setValue_287() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1 :=  abi_decode_tuple_t_uint256t_uint256(4, calldatasize())
                fun_setValue_287(param_0, param_1)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74() {
                // adapted by Eurus: hijack_dispatcher_revert
                eurus_dispatcher_revert()
            }

            function identity(value) -> ret {
                ret := value
            }

            function convert_t_uint256_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_uint256(value)))
            }

            function mapping_index_access_t_mapping$_t_uint256_$_t_uint256_$_of_t_uint256(slot , key) -> dataSlot {
                mstore(0, convert_t_uint256_to_t_uint256(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
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

            function prepare_store_t_uint256(value) -> ret {
                ret := value
            }

            function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
                let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
                sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
            }

            /// @ast-id 287
            /// @src 1:2943:3029  "function setValue(uint256 ind, uint256 val) public {..."
            function fun_setValue_287(var_ind_275, var_val_277) {

                /// @src 1:3019:3022  "val"
                let _1 := var_val_277
                let expr_283 := _1
                /// @src 1:3004:3011  "_values"
                let _2 := 0x00
                let expr_280 := _2
                /// @src 1:3012:3015  "ind"
                let _3 := var_ind_275
                let expr_281 := _3
                /// @src 1:3004:3016  "_values[ind]"
                let _4 := mapping_index_access_t_mapping$_t_uint256_$_t_uint256_$_of_t_uint256(expr_280,expr_281)
                /// @src 1:3004:3022  "_values[ind] = val"
                update_storage_value_offset_0t_uint256_to_t_uint256(_4, expr_283)
                let expr_284 := expr_283

            }
            /// @src 1:2846:3347  "contract symex2 is Eurus {..."

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

            function shift_right_0_unsigned(value) -> newValue {
                newValue :=

                shr(0, value)

            }

            function cleanup_from_storage_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function read_from_storage_split_offset_0_t_uint256(slot) -> value {
                value := extract_from_storage_value_offset_0t_uint256(sload(slot))

            }

            /// @ast-id 299
            /// @src 1:3111:3203  "function getValue(uint256 ind) public returns (uint256) {..."
            function fun_getValue_299(var_ind_289) -> var__292 {
                /// @src 1:3158:3165  "uint256"
                let zero_t_uint256_5 := zero_value_for_split_t_uint256()
                var__292 := zero_t_uint256_5

                /// @src 1:3184:3191  "_values"
                let _6 := 0x00
                let expr_294 := _6
                /// @src 1:3192:3195  "ind"
                let _7 := var_ind_289
                let expr_295 := _7
                /// @src 1:3184:3196  "_values[ind]"
                let _8 := mapping_index_access_t_mapping$_t_uint256_$_t_uint256_$_of_t_uint256(expr_294,expr_295)
                let _9 := read_from_storage_split_offset_0_t_uint256(_8)
                let expr_296 := _9
                /// @src 1:3177:3196  "return _values[ind]"
                var__292 := expr_296
                leave

            }
            /// @src 1:2846:3347  "contract symex2 is Eurus {..."

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

            function array_allocation_size_t_string_memory_ptr(length) -> size {
                // Make sure we can allocate memory without overflow
                if gt(length, 0xffffffffffffffff) { panic_error_0x41() }

                size := round_up_to_mul_of_32(length)

                // add length slot
                size := add(size, 0x20)

            }

            function allocate_memory_array_t_string_memory_ptr(length) -> memPtr {
                let allocSize := array_allocation_size_t_string_memory_ptr(length)
                memPtr := allocate_memory(allocSize)

                mstore(memPtr, length)

            }

            function store_literal_in_memory_fda3a92554e84fea8dc568bb5df0c00f3ec63fd891725bdc84348b2c7b6486d4(memPtr) {

                mstore(add(memPtr, 0), "sym0")

            }

            function copy_literal_to_memory_fda3a92554e84fea8dc568bb5df0c00f3ec63fd891725bdc84348b2c7b6486d4() -> memPtr {
                memPtr := allocate_memory_array_t_string_memory_ptr(4)
                store_literal_in_memory_fda3a92554e84fea8dc568bb5df0c00f3ec63fd891725bdc84348b2c7b6486d4(add(memPtr, 32))
            }

            function convert_t_stringliteral_fda3a92554e84fea8dc568bb5df0c00f3ec63fd891725bdc84348b2c7b6486d4_to_t_string_memory_ptr() -> converted {
                converted := copy_literal_to_memory_fda3a92554e84fea8dc568bb5df0c00f3ec63fd891725bdc84348b2c7b6486d4()
            }

            /// @ast-id 315
            /// @src 1:3209:3344  "function test0() public returns (uint256) {..."
            function fun_test0_315() -> var__302 {
                /// @src 1:3242:3249  "uint256"
                let zero_t_uint256_10 := zero_value_for_split_t_uint256()
                var__302 := zero_t_uint256_10

                /// @src 1:3276:3306  "eurus_symbolic_uint256(\"sym0\")"
                let _11_mpos := convert_t_stringliteral_fda3a92554e84fea8dc568bb5df0c00f3ec63fd891725bdc84348b2c7b6486d4_to_t_string_memory_ptr()
                let expr_308 := fun_eurus_symbolic_uint256_428(_11_mpos)
                /// @src 1:3261:3306  "uint256 sym0 = eurus_symbolic_uint256(\"sym0\")"
                let var_sym0_305 := expr_308
                /// @src 1:3332:3336  "sym0"
                let _12 := var_sym0_305
                let expr_311 := _12
                /// @src 1:3323:3337  "getValue(sym0)"
                let expr_312 := fun_getValue_299(expr_311)
                /// @src 1:3316:3337  "return getValue(sym0)"
                var__302 := expr_312
                leave

            }
            /// @src 1:2846:3347  "contract symex2 is Eurus {..."

            function array_length_t_string_memory_ptr(value) -> length {

                length := mload(value)

            }

            function array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length) -> updated_pos {
                mstore(pos, length)
                updated_pos := add(pos, 0x20)
            }

            function copy_memory_to_memory(src, dst, length) {
                let i := 0
                for { } lt(i, length) { i := add(i, 32) }
                {
                    mstore(add(dst, i), mload(add(src, i)))
                }
                if gt(i, length)
                {
                    // clear end
                    mstore(add(dst, length), 0)
                }
            }

            function abi_encode_t_string_memory_ptr_to_t_string_memory_ptr_fromStack(value, pos) -> end {
                let length := array_length_t_string_memory_ptr(value)
                pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length)
                copy_memory_to_memory(add(value, 0x20), pos, length)
                end := add(pos, round_up_to_mul_of_32(length))
            }

            function abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                mstore(add(headStart, 0), sub(tail, headStart))
                tail := abi_encode_t_string_memory_ptr_to_t_string_memory_ptr_fromStack(value0,  tail)

            }

            /// @ast-id 428
            /// @src 0:601:700  "function eurus_symbolic_uint256(string memory tag) internal pure returns (uint256) { revert(tag); }"
            function fun_eurus_symbolic_uint256_428(var_tag_418_mpos) -> var__421 {
                /// @src 0:675:682  "uint256"
                let zero_t_uint256_13 := zero_value_for_split_t_uint256()
                var__421 := zero_t_uint256_13

                /// @src 0:693:696  "tag"
                let _14_mpos := var_tag_418_mpos
                let expr_424_mpos := _14_mpos
                /// @src 0:686:697  "revert(tag)"
                {
                    let _15 := allocate_unbounded()
                    mstore(_15, 3963877391197344453575983046348115674221700746820753546331534351508065746944)
                    let _16 := abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack(add(_15, 4) , expr_424_mpos)
                    // adapted by Eurus: hijack_eurus_symbolic_uintX
                    var__421 := eurus_symbolic_uint256(_15, sub(_16, _15))
                }
            }
            /// @src 1:2846:3347  "contract symex2 is Eurus {..."

        }

        
    }

}

