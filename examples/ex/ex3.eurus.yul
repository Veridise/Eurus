
/// @use-src 0:"ex/ex.sol"
object "ex3_153" {
    code {
        /// @src 0:1156:1576  "contract ex3 {..."
        mstore(64, memoryguard(128))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        constructor_ex3_153()

        // adapted by Eurus: remove_post_constructor_datacall
        // let _1 := allocate_unbounded()
        // codecopy(_1, dataoffset("ex3_153_deployed"), datasize("ex3_153_deployed"))
        // return(_1, datasize("ex3_153_deployed"))

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
            revert(0, 0)
        }

        function panic_error_0x00() {
            mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
            mstore(4, 0x00)
            revert(0, 0x24)
        }

        function panic_error_0x22() {
            mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
            mstore(4, 0x22)
            revert(0, 0x24)
        }

        function extract_byte_array_length(data) -> length {
            length := div(data, 2)
            let outOfPlaceEncoding := and(data, 1)
            if iszero(outOfPlaceEncoding) {
                length := and(length, 0x7f)
            }

            if eq(outOfPlaceEncoding, lt(length, 32)) {
                panic_error_0x22()
            }
        }

        function array_dataslot_t_bytes_storage_ptr(ptr) -> data {
            data := ptr

            mstore(0, ptr)
            data := keccak256(0, 0x20)

        }

        function divide_by_32_ceil(value) -> result {
            result := div(add(value, 31), 32)
        }

        function shift_left_dynamic(bits, value) -> newValue {
            newValue :=

            shl(bits, value)

        }

        function update_byte_slice_dynamic32(value, shiftBytes, toInsert) -> result {
            let shiftBits := mul(shiftBytes, 8)
            let mask := shift_left_dynamic(shiftBits, 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff)
            toInsert := shift_left_dynamic(shiftBits, toInsert)
            value := and(value, not(mask))
            result := or(value, and(toInsert, mask))
        }

        function cleanup_t_uint256(value) -> cleaned {
            cleaned := value
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

        function update_storage_value_t_uint256_to_t_uint256(slot, offset, value_0) {
            let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
            sstore(slot, update_byte_slice_dynamic32(sload(slot), offset, prepare_store_t_uint256(convertedValue_0)))
        }

        function zero_value_for_split_t_uint256() -> ret {
            ret := 0
        }

        function storage_set_to_zero_t_uint256(slot, offset) {
            let zero_0 := zero_value_for_split_t_uint256()
            update_storage_value_t_uint256_to_t_uint256(slot, offset, zero_0)
        }

        function clear_storage_range_t_bytes1(start, end) {
            for {} lt(start, end) { start := add(start, 1) }
            {
                storage_set_to_zero_t_uint256(start, 0)
            }
        }

        function clean_up_bytearray_end_slots_t_bytes_storage_ptr(array, len, startIndex) {

            if gt(len, 31) {
                let dataArea := array_dataslot_t_bytes_storage_ptr(array)
                let deleteStart := add(dataArea, divide_by_32_ceil(startIndex))
                // If we are clearing array to be short byte array, we want to clear only data starting from array data area.
                if lt(startIndex, 32) { deleteStart := dataArea }
                clear_storage_range_t_bytes1(deleteStart, add(dataArea, divide_by_32_ceil(len)))
            }

        }

        function copy_literal_to_storage_00cd3d46df44f2cbb950cf84eb2e92aa2ddd23195b1a009173ea59a063357ed3(slot) {

            let oldLen := extract_byte_array_length(sload(slot))
            clean_up_bytearray_end_slots_t_bytes_storage_ptr(slot, oldLen, 13)
            sstore(slot, add("Wrapped Ether", 26))

        }

        function update_storage_value_offset_0t_stringliteral_00cd3d46df44f2cbb950cf84eb2e92aa2ddd23195b1a009173ea59a063357ed3_to_t_string_storage(slot) {

            copy_literal_to_storage_00cd3d46df44f2cbb950cf84eb2e92aa2ddd23195b1a009173ea59a063357ed3(slot)
        }

        function copy_literal_to_storage_0f8a193ff464434486c0daf7db2a895884365d2bc84ba47a68fcf89c1b14b5b8(slot) {

            let oldLen := extract_byte_array_length(sload(slot))
            clean_up_bytearray_end_slots_t_bytes_storage_ptr(slot, oldLen, 4)
            sstore(slot, add("WETH", 8))

        }

        function update_storage_value_offset_0t_stringliteral_0f8a193ff464434486c0daf7db2a895884365d2bc84ba47a68fcf89c1b14b5b8_to_t_string_storage(slot) {

            copy_literal_to_storage_0f8a193ff464434486c0daf7db2a895884365d2bc84ba47a68fcf89c1b14b5b8(slot)
        }

        function shift_left_0(value) -> newValue {
            newValue :=

            shl(0, value)

        }

        function update_byte_slice_1_shift_0(value, toInsert) -> result {
            let mask := 255
            toInsert := shift_left_0(toInsert)
            value := and(value, not(mask))
            result := or(value, and(toInsert, mask))
        }

        function cleanup_t_rational_18_by_1(value) -> cleaned {
            cleaned := value
        }

        function cleanup_t_uint8(value) -> cleaned {
            cleaned := and(value, 0xff)
        }

        function convert_t_rational_18_by_1_to_t_uint8(value) -> converted {
            converted := cleanup_t_uint8(identity(cleanup_t_rational_18_by_1(value)))
        }

        function prepare_store_t_uint8(value) -> ret {
            ret := value
        }

        function update_storage_value_offset_0t_rational_18_by_1_to_t_uint8(slot, value_0) {
            let convertedValue_0 := convert_t_rational_18_by_1_to_t_uint8(value_0)
            sstore(slot, update_byte_slice_1_shift_0(sload(slot), prepare_store_t_uint8(convertedValue_0)))
        }

        /// @ast-id 122
        /// @src 0:1284:1299  "constructor(){}"
        function constructor_ex3_153() {

            /// @src 0:1284:1299  "constructor(){}"

            /// @src 0:1196:1211  "'Wrapped Ether'"
            update_storage_value_offset_0t_stringliteral_00cd3d46df44f2cbb950cf84eb2e92aa2ddd23195b1a009173ea59a063357ed3_to_t_string_storage(0x00)
            /// @src 0:1240:1246  "'WETH'"
            update_storage_value_offset_0t_stringliteral_0f8a193ff464434486c0daf7db2a895884365d2bc84ba47a68fcf89c1b14b5b8_to_t_string_storage(0x01)
            /// @src 0:1276:1278  "18"
            let expr_117 := 0x12
            update_storage_value_offset_0t_rational_18_by_1_to_t_uint8(0x02, expr_117)

        }
        /// @src 0:1156:1576  "contract ex3 {..."

    }
    /// @use-src 0:"ex/ex.sol"
    object "ex3_153_deployed" {
        code {
            /// @src 0:1156:1576  "contract ex3 {..."
            mstore(64, memoryguard(128))

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x06fdde03
                {
                    // name()

                    external_fun_name_112()
                }

                case 0x17d7de7c
                {
                    // getName()

                    external_fun_getName_130()
                }

                case 0x313ce567
                {
                    // decimals()

                    external_fun_decimals_118()
                }

                case 0x95d89b41
                {
                    // symbol()

                    external_fun_symbol_115()
                }

                case 0xdcc721d2
                {
                    // doAdd(uint256,uint256)

                    external_fun_doAdd_152()
                }

                case 0xf0141d84
                {
                    // getDecimals()

                    external_fun_getDecimals_138()
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

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

            }

            function panic_error_0x00() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x00)
                revert(0, 0x24)
            }

            function panic_error_0x22() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x22)
                revert(0, 0x24)
            }

            function extract_byte_array_length(data) -> length {
                length := div(data, 2)
                let outOfPlaceEncoding := and(data, 1)
                if iszero(outOfPlaceEncoding) {
                    length := and(length, 0x7f)
                }

                if eq(outOfPlaceEncoding, lt(length, 32)) {
                    panic_error_0x22()
                }
            }

            function array_storeLengthForEncoding_t_string_memory_ptr(pos, length) -> updated_pos {
                mstore(pos, length)
                updated_pos := add(pos, 0x20)
            }

            function array_dataslot_t_string_storage(ptr) -> data {
                data := ptr

                mstore(0, ptr)
                data := keccak256(0, 0x20)

            }

            // string -> string
            function abi_encode_t_string_storage_to_t_string_memory_ptr(value, pos) -> ret {
                let slotValue := sload(value)
                let length := extract_byte_array_length(slotValue)
                pos := array_storeLengthForEncoding_t_string_memory_ptr(pos, length)
                switch and(slotValue, 1)
                case 0 {
                    // short byte array
                    mstore(pos, and(slotValue, not(0xff)))
                    ret := add(pos, 0x20)
                }
                case 1 {
                    // long byte array
                    let dataPos := array_dataslot_t_string_storage(value)
                    let i := 0
                    for { } lt(i, length) { i := add(i, 0x20) } {
                        mstore(add(pos, i), sload(dataPos))
                        dataPos := add(dataPos, 1)
                    }
                    ret := add(pos, i)
                }
            }

            function abi_encodeUpdatedPos_t_string_storage_to_t_string_memory_ptr(value0, pos) -> updatedPos {
                updatedPos := abi_encode_t_string_storage_to_t_string_memory_ptr(value0, pos)
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

            function copy_array_from_storage_to_memory_t_string_storage(slot) -> memPtr {
                memPtr := allocate_unbounded()
                let end := abi_encodeUpdatedPos_t_string_storage_to_t_string_memory_ptr(slot, memPtr)
                finalize_allocation(memPtr, sub(end, memPtr))
            }

            function read_from_storage__dynamic_split_t_string_memory_ptr(slot, offset) -> value {
                if gt(offset, 0) { panic_error_0x00() }
                value := copy_array_from_storage_to_memory_t_string_storage(slot)
            }

            /// @ast-id 112
            /// @src 0:1175:1211  "string public name = 'Wrapped Ether'"
            function getter_fun_name_112() -> ret_mpos {

                let slot := 0
                let offset := 0

                ret_mpos := read_from_storage__dynamic_split_t_string_memory_ptr(slot, offset)

            }
            /// @src 0:1156:1576  "contract ex3 {..."

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

            function external_fun_name_112() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                let ret_0 :=  getter_fun_name_112()
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_getName_130() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                let ret_0 :=  fun_getName_130()
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function shift_right_unsigned_dynamic(bits, value) -> newValue {
                newValue :=

                shr(bits, value)

            }

            function cleanup_from_storage_t_uint8(value) -> cleaned {
                cleaned := and(value, 0xff)
            }

            function extract_from_storage_value_dynamict_uint8(slot_value, offset) -> value {
                value := cleanup_from_storage_t_uint8(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function read_from_storage_split_dynamic_t_uint8(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_uint8(sload(slot), offset)

            }

            /// @ast-id 118
            /// @src 0:1252:1278  "uint8 public decimals = 18"
            function getter_fun_decimals_118() -> ret {

                let slot := 2
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint8(slot, offset)

            }
            /// @src 0:1156:1576  "contract ex3 {..."

            function cleanup_t_uint8(value) -> cleaned {
                cleaned := and(value, 0xff)
            }

            function abi_encode_t_uint8_to_t_uint8_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint8(value))
            }

            function abi_encode_tuple_t_uint8__to_t_uint8__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_uint8_to_t_uint8_fromStack(value0,  add(headStart, 0))

            }

            function external_fun_decimals_118() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                let ret_0 :=  getter_fun_decimals_118()
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint8__to_t_uint8__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            /// @ast-id 115
            /// @src 0:1217:1246  "string public symbol = 'WETH'"
            function getter_fun_symbol_115() -> ret_mpos {

                let slot := 1
                let offset := 0

                ret_mpos := read_from_storage__dynamic_split_t_string_memory_ptr(slot, offset)

            }
            /// @src 0:1156:1576  "contract ex3 {..."

            function external_fun_symbol_115() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                let ret_0 :=  getter_fun_symbol_115()
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

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

            function external_fun_doAdd_152() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1 :=  abi_decode_tuple_t_uint256t_uint256(4, calldatasize())
                let ret_0 :=  fun_doAdd_152(param_0, param_1)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_getDecimals_138() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                let ret_0 :=  fun_getDecimals_138()
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint8__to_t_uint8__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74() {
                // adapted by Eurus: hijack_dispatcher_revert
                eurus_dispatcher_revert()
            }

            function zero_value_for_split_t_string_memory_ptr() -> ret {
                ret := 96
            }

            function convert_array_t_string_storage_to_t_string_memory_ptr(value) -> converted  {

                // Copy the array to a free position in memory
                converted :=

                copy_array_from_storage_to_memory_t_string_storage(value)

            }

            /// @ast-id 130
            /// @src 0:1304:1387  "function getName() public view returns (string memory) {..."
            function fun_getName_130() -> var__125_mpos {
                /// @src 0:1344:1357  "string memory"
                let zero_t_string_memory_ptr_1_mpos := zero_value_for_split_t_string_memory_ptr()
                var__125_mpos := zero_t_string_memory_ptr_1_mpos

                /// @src 0:1376:1380  "name"
                let _2_slot := 0x00
                let expr_127_slot := _2_slot
                /// @src 0:1369:1380  "return name"
                var__125_mpos := convert_array_t_string_storage_to_t_string_memory_ptr(expr_127_slot)
                leave

            }
            /// @src 0:1156:1576  "contract ex3 {..."

            function zero_value_for_split_t_uint8() -> ret {
                ret := 0
            }

            function shift_right_0_unsigned(value) -> newValue {
                newValue :=

                shr(0, value)

            }

            function extract_from_storage_value_offset_0t_uint8(slot_value) -> value {
                value := cleanup_from_storage_t_uint8(shift_right_0_unsigned(slot_value))
            }

            function read_from_storage_split_offset_0_t_uint8(slot) -> value {
                value := extract_from_storage_value_offset_0t_uint8(sload(slot))

            }

            /// @ast-id 138
            /// @src 0:1392:1475  "function getDecimals() public view returns (uint8) {..."
            function fun_getDecimals_138() -> var__133 {
                /// @src 0:1436:1441  "uint8"
                let zero_t_uint8_3 := zero_value_for_split_t_uint8()
                var__133 := zero_t_uint8_3

                /// @src 0:1460:1468  "decimals"
                let _4 := read_from_storage_split_offset_0_t_uint8(0x02)
                let expr_135 := _4
                /// @src 0:1453:1468  "return decimals"
                var__133 := expr_135
                leave

            }
            /// @src 0:1156:1576  "contract ex3 {..."

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

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

            /// @ast-id 152
            /// @src 0:1480:1574  "function doAdd(uint256 a, uint256 b) public pure returns (uint256) {..."
            function fun_doAdd_152(var_a_140, var_b_142) -> var__145 {
                /// @src 0:1538:1545  "uint256"
                let zero_t_uint256_5 := zero_value_for_split_t_uint256()
                var__145 := zero_t_uint256_5

                /// @src 0:1564:1565  "a"
                let _6 := var_a_140
                let expr_147 := _6
                /// @src 0:1566:1567  "b"
                let _7 := var_b_142
                let expr_148 := _7
                /// @src 0:1564:1567  "a+b"
                let expr_149 := checked_add_t_uint256(expr_147, expr_148)

                /// @src 0:1557:1567  "return a+b"
                var__145 := expr_149
                leave

            }
            /// @src 0:1156:1576  "contract ex3 {..."

        }

        
    }

}

