
/// @use-src 1:"Harness.sol", 3:"Synthesis.sol"
object "Synthesis_81" {
    code {
        /// @src 3:228:790  "contract Synthesis is Harness {..."
        mstore(64, memoryguard(128))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        constructor_Synthesis_81()

        // adapted by Eurus: remove_post_constructor_datacall
        // let _1 := allocate_unbounded()
        // codecopy(_1, dataoffset("Synthesis_81_deployed"), datasize("Synthesis_81_deployed"))
        // return(_1, datasize("Synthesis_81_deployed"))

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
            revert(0, 0)
        }

        /// @src 3:228:790  "contract Synthesis is Harness {..."
        function constructor_Synthesis_81() {

            /// @src 3:228:790  "contract Synthesis is Harness {..."
            constructor_Harness_759()

        }
        /// @src 3:228:790  "contract Synthesis is Harness {..."

        function cleanup_t_rational_1_by_1(value) -> cleaned {
            cleaned := value
        }

        function cleanup_t_uint160(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function identity(value) -> ret {
            ret := value
        }

        function convert_t_rational_1_by_1_to_t_uint160(value) -> converted {
            converted := cleanup_t_uint160(identity(cleanup_t_rational_1_by_1(value)))
        }

        function convert_t_rational_1_by_1_to_t_address(value) -> converted {
            converted := convert_t_rational_1_by_1_to_t_uint160(value)
        }

        function convert_t_uint160_to_t_uint160(value) -> converted {
            converted := cleanup_t_uint160(identity(cleanup_t_uint160(value)))
        }

        function convert_t_uint160_to_t_contract$_ERC20_$236(value) -> converted {
            converted := convert_t_uint160_to_t_uint160(value)
        }

        function convert_t_address_to_t_contract$_ERC20_$236(value) -> converted {
            converted := convert_t_uint160_to_t_contract$_ERC20_$236(value)
        }

        function shift_left_0(value) -> newValue {
            newValue :=

            shl(0, value)

        }

        function update_byte_slice_20_shift_0(value, toInsert) -> result {
            let mask := 0xffffffffffffffffffffffffffffffffffffffff
            toInsert := shift_left_0(toInsert)
            value := and(value, not(mask))
            result := or(value, and(toInsert, mask))
        }

        function convert_t_contract$_ERC20_$236_to_t_contract$_ERC20_$236(value) -> converted {
            converted := convert_t_uint160_to_t_contract$_ERC20_$236(value)
        }

        function prepare_store_t_contract$_ERC20_$236(value) -> ret {
            ret := value
        }

        function update_storage_value_offset_0t_contract$_ERC20_$236_to_t_contract$_ERC20_$236(slot, value_0) {
            let convertedValue_0 := convert_t_contract$_ERC20_$236_to_t_contract$_ERC20_$236(value_0)
            sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_contract$_ERC20_$236(convertedValue_0)))
        }

        function cleanup_t_rational_2_by_1(value) -> cleaned {
            cleaned := value
        }

        function convert_t_rational_2_by_1_to_t_uint160(value) -> converted {
            converted := cleanup_t_uint160(identity(cleanup_t_rational_2_by_1(value)))
        }

        function convert_t_rational_2_by_1_to_t_address(value) -> converted {
            converted := convert_t_rational_2_by_1_to_t_uint160(value)
        }

        function cleanup_t_rational_3_by_1(value) -> cleaned {
            cleaned := value
        }

        function convert_t_rational_3_by_1_to_t_uint160(value) -> converted {
            converted := cleanup_t_uint160(identity(cleanup_t_rational_3_by_1(value)))
        }

        function convert_t_rational_3_by_1_to_t_address(value) -> converted {
            converted := convert_t_rational_3_by_1_to_t_uint160(value)
        }

        function convert_t_uint160_to_t_contract$_UniswapModel_$1143(value) -> converted {
            converted := convert_t_uint160_to_t_uint160(value)
        }

        function convert_t_address_to_t_contract$_UniswapModel_$1143(value) -> converted {
            converted := convert_t_uint160_to_t_contract$_UniswapModel_$1143(value)
        }

        function convert_t_contract$_UniswapModel_$1143_to_t_contract$_UniswapModel_$1143(value) -> converted {
            converted := convert_t_uint160_to_t_contract$_UniswapModel_$1143(value)
        }

        function prepare_store_t_contract$_UniswapModel_$1143(value) -> ret {
            ret := value
        }

        function update_storage_value_offset_0t_contract$_UniswapModel_$1143_to_t_contract$_UniswapModel_$1143(slot, value_0) {
            let convertedValue_0 := convert_t_contract$_UniswapModel_$1143_to_t_contract$_UniswapModel_$1143(value_0)
            sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_contract$_UniswapModel_$1143(convertedValue_0)))
        }

        function cleanup_t_rational_4_by_1(value) -> cleaned {
            cleaned := value
        }

        function convert_t_rational_4_by_1_to_t_uint160(value) -> converted {
            converted := cleanup_t_uint160(identity(cleanup_t_rational_4_by_1(value)))
        }

        function convert_t_rational_4_by_1_to_t_address(value) -> converted {
            converted := convert_t_rational_4_by_1_to_t_uint160(value)
        }

        function convert_t_uint160_to_t_contract$_PuppetPool_$979(value) -> converted {
            converted := convert_t_uint160_to_t_uint160(value)
        }

        function convert_t_address_to_t_contract$_PuppetPool_$979(value) -> converted {
            converted := convert_t_uint160_to_t_contract$_PuppetPool_$979(value)
        }

        function convert_t_contract$_PuppetPool_$979_to_t_contract$_PuppetPool_$979(value) -> converted {
            converted := convert_t_uint160_to_t_contract$_PuppetPool_$979(value)
        }

        function prepare_store_t_contract$_PuppetPool_$979(value) -> ret {
            ret := value
        }

        function update_storage_value_offset_0t_contract$_PuppetPool_$979_to_t_contract$_PuppetPool_$979(slot, value_0) {
            let convertedValue_0 := convert_t_contract$_PuppetPool_$979_to_t_contract$_PuppetPool_$979(value_0)
            sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_contract$_PuppetPool_$979(convertedValue_0)))
        }

        function cleanup_t_rational_5_by_1(value) -> cleaned {
            cleaned := value
        }

        function convert_t_rational_5_by_1_to_t_uint160(value) -> converted {
            converted := cleanup_t_uint160(identity(cleanup_t_rational_5_by_1(value)))
        }

        function convert_t_rational_5_by_1_to_t_address(value) -> converted {
            converted := convert_t_rational_5_by_1_to_t_uint160(value)
        }

        function convert_t_uint160_to_t_address(value) -> converted {
            converted := convert_t_uint160_to_t_uint160(value)
        }

        function convert_t_address_to_t_address(value) -> converted {
            converted := convert_t_uint160_to_t_address(value)
        }

        function prepare_store_t_address(value) -> ret {
            ret := value
        }

        function update_storage_value_offset_0t_address_to_t_address(slot, value_0) {
            let convertedValue_0 := convert_t_address_to_t_address(value_0)
            sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address(convertedValue_0)))
        }

        function cleanup_t_rational_0_by_1(value) -> cleaned {
            cleaned := value
        }

        function cleanup_t_uint256(value) -> cleaned {
            cleaned := value
        }

        function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint256(identity(cleanup_t_rational_0_by_1(value)))
        }

        function convert_t_contract$_Harness_$759_to_t_address(value) -> converted {
            converted := convert_t_uint160_to_t_address(value)
        }

        function shift_right_0_unsigned(value) -> newValue {
            newValue :=

            shr(0, value)

        }

        function cleanup_from_storage_t_contract$_UniswapModel_$1143(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function extract_from_storage_value_offset_0t_contract$_UniswapModel_$1143(slot_value) -> value {
            value := cleanup_from_storage_t_contract$_UniswapModel_$1143(shift_right_0_unsigned(slot_value))
        }

        function read_from_storage_split_offset_0_t_contract$_UniswapModel_$1143(slot) -> value {
            value := extract_from_storage_value_offset_0t_contract$_UniswapModel_$1143(sload(slot))

        }

        function convert_t_contract$_UniswapModel_$1143_to_t_address(value) -> converted {
            converted := convert_t_uint160_to_t_address(value)
        }

        function cleanup_from_storage_t_contract$_ERC20_$236(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function extract_from_storage_value_offset_0t_contract$_ERC20_$236(slot_value) -> value {
            value := cleanup_from_storage_t_contract$_ERC20_$236(shift_right_0_unsigned(slot_value))
        }

        function read_from_storage_split_offset_0_t_contract$_ERC20_$236(slot) -> value {
            value := extract_from_storage_value_offset_0t_contract$_ERC20_$236(sload(slot))

        }

        function convert_t_contract$_ERC20_$236_to_t_address(value) -> converted {
            converted := convert_t_uint160_to_t_address(value)
        }

        function convert_t_stringliteral_03a8a2a8f6aa8ae43ce8815ce3b819163fc1f4ed4af2268d87a55652fd314de2_to_t_bytes4() -> converted {
            converted := 0xa7be794800000000000000000000000000000000000000000000000000000000
        }

        function cleanup_t_address(value) -> cleaned {
            cleaned := cleanup_t_uint160(value)
        }

        function abi_encode_t_address_to_t_address_fromStack(value, pos) {
            mstore(pos, cleanup_t_address(value))
        }

        function abi_encode_tuple_t_address_t_address__to_t_address_t_address__fromStack(headStart , value0, value1) -> tail {
            tail := add(headStart, 64)

            abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

            abi_encode_t_address_to_t_address_fromStack(value1,  add(headStart, 32))

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

        function array_allocation_size_t_bytes_memory_ptr(length) -> size {
            // Make sure we can allocate memory without overflow
            if gt(length, 0xffffffffffffffff) { panic_error_0x41() }

            size := round_up_to_mul_of_32(length)

            // add length slot
            size := add(size, 0x20)

        }

        function allocate_memory_array_t_bytes_memory_ptr(length) -> memPtr {
            let allocSize := array_allocation_size_t_bytes_memory_ptr(length)
            memPtr := allocate_memory(allocSize)

            mstore(memPtr, length)

        }

        function zero_value_for_split_t_bytes_memory_ptr() -> ret {
            ret := 96
        }

        function extract_returndata() -> data {

            switch returndatasize()
            case 0 {
                data := zero_value_for_split_t_bytes_memory_ptr()
            }
            default {
                data := allocate_memory_array_t_bytes_memory_ptr(returndatasize())
                returndatacopy(add(data, 0x20), 0, returndatasize())
            }

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

        function store_literal_in_memory_203bacc78a2eb7f519576692bc60aaafc70a1bd0d0ec0fae0da790d832406d35(memPtr) {

            mstore(add(memPtr, 0), "msg365")

        }

        function copy_literal_to_memory_203bacc78a2eb7f519576692bc60aaafc70a1bd0d0ec0fae0da790d832406d35() -> memPtr {
            memPtr := allocate_memory_array_t_string_memory_ptr(6)
            store_literal_in_memory_203bacc78a2eb7f519576692bc60aaafc70a1bd0d0ec0fae0da790d832406d35(add(memPtr, 32))
        }

        function convert_t_stringliteral_203bacc78a2eb7f519576692bc60aaafc70a1bd0d0ec0fae0da790d832406d35_to_t_string_memory_ptr() -> converted {
            converted := copy_literal_to_memory_203bacc78a2eb7f519576692bc60aaafc70a1bd0d0ec0fae0da790d832406d35()
        }

        function cleanup_from_storage_t_contract$_PuppetPool_$979(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function extract_from_storage_value_offset_0t_contract$_PuppetPool_$979(slot_value) -> value {
            value := cleanup_from_storage_t_contract$_PuppetPool_$979(shift_right_0_unsigned(slot_value))
        }

        function read_from_storage_split_offset_0_t_contract$_PuppetPool_$979(slot) -> value {
            value := extract_from_storage_value_offset_0t_contract$_PuppetPool_$979(sload(slot))

        }

        function convert_t_contract$_PuppetPool_$979_to_t_address(value) -> converted {
            converted := convert_t_uint160_to_t_address(value)
        }

        function convert_t_stringliteral_50f05b09664371a5ffabeeb22871cddbfbc34f409488a95c0262348f5f5234ea_to_t_bytes4() -> converted {
            converted := 0x8597600f00000000000000000000000000000000000000000000000000000000
        }

        function abi_encode_tuple_t_address_t_address_t_address__to_t_address_t_address_t_address__fromStack(headStart , value0, value1, value2) -> tail {
            tail := add(headStart, 96)

            abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

            abi_encode_t_address_to_t_address_fromStack(value1,  add(headStart, 32))

            abi_encode_t_address_to_t_address_fromStack(value2,  add(headStart, 64))

        }

        function store_literal_in_memory_4441e641e0a1af5162bb8d02bf7cb80de2980952e90686dd4d78bc71bbc6f33d(memPtr) {

            mstore(add(memPtr, 0), "msg361")

        }

        function copy_literal_to_memory_4441e641e0a1af5162bb8d02bf7cb80de2980952e90686dd4d78bc71bbc6f33d() -> memPtr {
            memPtr := allocate_memory_array_t_string_memory_ptr(6)
            store_literal_in_memory_4441e641e0a1af5162bb8d02bf7cb80de2980952e90686dd4d78bc71bbc6f33d(add(memPtr, 32))
        }

        function convert_t_stringliteral_4441e641e0a1af5162bb8d02bf7cb80de2980952e90686dd4d78bc71bbc6f33d_to_t_string_memory_ptr() -> converted {
            converted := copy_literal_to_memory_4441e641e0a1af5162bb8d02bf7cb80de2980952e90686dd4d78bc71bbc6f33d()
        }

        function cleanup_from_storage_t_address(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function extract_from_storage_value_offset_0t_address(slot_value) -> value {
            value := cleanup_from_storage_t_address(shift_right_0_unsigned(slot_value))
        }

        function read_from_storage_split_offset_0_t_address(slot) -> value {
            value := extract_from_storage_value_offset_0t_address(sload(slot))

        }

        function convert_t_stringliteral_ca3af10847493457e4ae06eb52beb20192cd8bb0f2f2c13aa43273621def20ad_to_t_bytes4() -> converted {
            converted := 0xdac3bd8500000000000000000000000000000000000000000000000000000000
        }

        function cleanup_t_rational_1000000_by_1(value) -> cleaned {
            cleaned := value
        }

        function cleanup_t_uint24(value) -> cleaned {
            cleaned := and(value, 0xffffff)
        }

        function convert_t_rational_1000000_by_1_to_t_uint24(value) -> converted {
            converted := cleanup_t_uint24(identity(cleanup_t_rational_1000000_by_1(value)))
        }

        function abi_encode_t_rational_1000000_by_1_to_t_uint24_fromStack(value, pos) {
            mstore(pos, convert_t_rational_1000000_by_1_to_t_uint24(value))
        }

        function abi_encode_tuple_t_address_t_rational_1000000_by_1__to_t_address_t_uint24__fromStack(headStart , value0, value1) -> tail {
            tail := add(headStart, 64)

            abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

            abi_encode_t_rational_1000000_by_1_to_t_uint24_fromStack(value1,  add(headStart, 32))

        }

        function store_literal_in_memory_94f1eedc245f9b90c68c4e31098b2de5d4ebcc27daf1e752f0398a38568e1a44(memPtr) {

            mstore(add(memPtr, 0), "msg357")

        }

        function copy_literal_to_memory_94f1eedc245f9b90c68c4e31098b2de5d4ebcc27daf1e752f0398a38568e1a44() -> memPtr {
            memPtr := allocate_memory_array_t_string_memory_ptr(6)
            store_literal_in_memory_94f1eedc245f9b90c68c4e31098b2de5d4ebcc27daf1e752f0398a38568e1a44(add(memPtr, 32))
        }

        function convert_t_stringliteral_94f1eedc245f9b90c68c4e31098b2de5d4ebcc27daf1e752f0398a38568e1a44_to_t_string_memory_ptr() -> converted {
            converted := copy_literal_to_memory_94f1eedc245f9b90c68c4e31098b2de5d4ebcc27daf1e752f0398a38568e1a44()
        }

        function store_literal_in_memory_5a2b1fa336d9f0091b5dc3f9cae4f8b9c297202ff82060e05516cef51604d07b(memPtr) {

            mstore(add(memPtr, 0), "msg353")

        }

        function copy_literal_to_memory_5a2b1fa336d9f0091b5dc3f9cae4f8b9c297202ff82060e05516cef51604d07b() -> memPtr {
            memPtr := allocate_memory_array_t_string_memory_ptr(6)
            store_literal_in_memory_5a2b1fa336d9f0091b5dc3f9cae4f8b9c297202ff82060e05516cef51604d07b(add(memPtr, 32))
        }

        function convert_t_stringliteral_5a2b1fa336d9f0091b5dc3f9cae4f8b9c297202ff82060e05516cef51604d07b_to_t_string_memory_ptr() -> converted {
            converted := copy_literal_to_memory_5a2b1fa336d9f0091b5dc3f9cae4f8b9c297202ff82060e05516cef51604d07b()
        }

        function convert_t_stringliteral_abce0605a16ff5e998983a0af570b8ad942bb11e305eb20ae3ada0a3be24eb97_to_t_bytes4() -> converted {
            converted := 0xa9059cbb00000000000000000000000000000000000000000000000000000000
        }

        function cleanup_t_rational_100000_by_1(value) -> cleaned {
            cleaned := value
        }

        function convert_t_rational_100000_by_1_to_t_uint24(value) -> converted {
            converted := cleanup_t_uint24(identity(cleanup_t_rational_100000_by_1(value)))
        }

        function abi_encode_t_rational_100000_by_1_to_t_uint24_fromStack(value, pos) {
            mstore(pos, convert_t_rational_100000_by_1_to_t_uint24(value))
        }

        function abi_encode_tuple_t_address_t_rational_100000_by_1__to_t_address_t_uint24__fromStack(headStart , value0, value1) -> tail {
            tail := add(headStart, 64)

            abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

            abi_encode_t_rational_100000_by_1_to_t_uint24_fromStack(value1,  add(headStart, 32))

        }

        function store_literal_in_memory_83229ee0bf384381a6a024c33beb74efbb518716a5b51adfcef8bbb412aee07d(memPtr) {

            mstore(add(memPtr, 0), "msg349")

        }

        function copy_literal_to_memory_83229ee0bf384381a6a024c33beb74efbb518716a5b51adfcef8bbb412aee07d() -> memPtr {
            memPtr := allocate_memory_array_t_string_memory_ptr(6)
            store_literal_in_memory_83229ee0bf384381a6a024c33beb74efbb518716a5b51adfcef8bbb412aee07d(add(memPtr, 32))
        }

        function convert_t_stringliteral_83229ee0bf384381a6a024c33beb74efbb518716a5b51adfcef8bbb412aee07d_to_t_string_memory_ptr() -> converted {
            converted := copy_literal_to_memory_83229ee0bf384381a6a024c33beb74efbb518716a5b51adfcef8bbb412aee07d()
        }

        function cleanup_t_rational_10_by_1(value) -> cleaned {
            cleaned := value
        }

        function cleanup_t_uint8(value) -> cleaned {
            cleaned := and(value, 0xff)
        }

        function convert_t_rational_10_by_1_to_t_uint8(value) -> converted {
            converted := cleanup_t_uint8(identity(cleanup_t_rational_10_by_1(value)))
        }

        function abi_encode_t_rational_10_by_1_to_t_uint8_fromStack(value, pos) {
            mstore(pos, convert_t_rational_10_by_1_to_t_uint8(value))
        }

        function abi_encode_tuple_t_address_t_rational_10_by_1__to_t_address_t_uint8__fromStack(headStart , value0, value1) -> tail {
            tail := add(headStart, 64)

            abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

            abi_encode_t_rational_10_by_1_to_t_uint8_fromStack(value1,  add(headStart, 32))

        }

        function store_literal_in_memory_b5e74df209956697782a966c6e7d5bbc5eaef7076f1639883cb1866abf741dbf(memPtr) {

            mstore(add(memPtr, 0), "msg345")

        }

        function copy_literal_to_memory_b5e74df209956697782a966c6e7d5bbc5eaef7076f1639883cb1866abf741dbf() -> memPtr {
            memPtr := allocate_memory_array_t_string_memory_ptr(6)
            store_literal_in_memory_b5e74df209956697782a966c6e7d5bbc5eaef7076f1639883cb1866abf741dbf(add(memPtr, 32))
        }

        function convert_t_stringliteral_b5e74df209956697782a966c6e7d5bbc5eaef7076f1639883cb1866abf741dbf_to_t_string_memory_ptr() -> converted {
            converted := copy_literal_to_memory_b5e74df209956697782a966c6e7d5bbc5eaef7076f1639883cb1866abf741dbf()
        }

        function store_literal_in_memory_9472547d2fdad7d085cdfd9b64240cbf4a0f743cf79e14615ddfaf0bed54d85f(memPtr) {

            mstore(add(memPtr, 0), "msg341")

        }

        function copy_literal_to_memory_9472547d2fdad7d085cdfd9b64240cbf4a0f743cf79e14615ddfaf0bed54d85f() -> memPtr {
            memPtr := allocate_memory_array_t_string_memory_ptr(6)
            store_literal_in_memory_9472547d2fdad7d085cdfd9b64240cbf4a0f743cf79e14615ddfaf0bed54d85f(add(memPtr, 32))
        }

        function convert_t_stringliteral_9472547d2fdad7d085cdfd9b64240cbf4a0f743cf79e14615ddfaf0bed54d85f_to_t_string_memory_ptr() -> converted {
            converted := copy_literal_to_memory_9472547d2fdad7d085cdfd9b64240cbf4a0f743cf79e14615ddfaf0bed54d85f()
        }

        function cleanup_t_rational_1000_by_1(value) -> cleaned {
            cleaned := value
        }

        function cleanup_t_uint16(value) -> cleaned {
            cleaned := and(value, 0xffff)
        }

        function convert_t_rational_1000_by_1_to_t_uint16(value) -> converted {
            converted := cleanup_t_uint16(identity(cleanup_t_rational_1000_by_1(value)))
        }

        function abi_encode_t_rational_1000_by_1_to_t_uint16_fromStack(value, pos) {
            mstore(pos, convert_t_rational_1000_by_1_to_t_uint16(value))
        }

        function abi_encode_tuple_t_address_t_rational_1000_by_1__to_t_address_t_uint16__fromStack(headStart , value0, value1) -> tail {
            tail := add(headStart, 64)

            abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

            abi_encode_t_rational_1000_by_1_to_t_uint16_fromStack(value1,  add(headStart, 32))

        }

        function store_literal_in_memory_d6517175b2b01e61adabcc1ac299c52cffc04481afc45cc590f19e321c137d8a(memPtr) {

            mstore(add(memPtr, 0), "msg333")

        }

        function copy_literal_to_memory_d6517175b2b01e61adabcc1ac299c52cffc04481afc45cc590f19e321c137d8a() -> memPtr {
            memPtr := allocate_memory_array_t_string_memory_ptr(6)
            store_literal_in_memory_d6517175b2b01e61adabcc1ac299c52cffc04481afc45cc590f19e321c137d8a(add(memPtr, 32))
        }

        function convert_t_stringliteral_d6517175b2b01e61adabcc1ac299c52cffc04481afc45cc590f19e321c137d8a_to_t_string_memory_ptr() -> converted {
            converted := copy_literal_to_memory_d6517175b2b01e61adabcc1ac299c52cffc04481afc45cc590f19e321c137d8a()
        }

        function cleanup_t_rational_25_by_1(value) -> cleaned {
            cleaned := value
        }

        function convert_t_rational_25_by_1_to_t_uint8(value) -> converted {
            converted := cleanup_t_uint8(identity(cleanup_t_rational_25_by_1(value)))
        }

        function abi_encode_t_rational_25_by_1_to_t_uint8_fromStack(value, pos) {
            mstore(pos, convert_t_rational_25_by_1_to_t_uint8(value))
        }

        function abi_encode_tuple_t_address_t_rational_25_by_1__to_t_address_t_uint8__fromStack(headStart , value0, value1) -> tail {
            tail := add(headStart, 64)

            abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

            abi_encode_t_rational_25_by_1_to_t_uint8_fromStack(value1,  add(headStart, 32))

        }

        function store_literal_in_memory_1863069b843956ab98c9f40676ad1999347dd2328a71693623254d8e4bb5e4f8(memPtr) {

            mstore(add(memPtr, 0), "msg337")

        }

        function copy_literal_to_memory_1863069b843956ab98c9f40676ad1999347dd2328a71693623254d8e4bb5e4f8() -> memPtr {
            memPtr := allocate_memory_array_t_string_memory_ptr(6)
            store_literal_in_memory_1863069b843956ab98c9f40676ad1999347dd2328a71693623254d8e4bb5e4f8(add(memPtr, 32))
        }

        function convert_t_stringliteral_1863069b843956ab98c9f40676ad1999347dd2328a71693623254d8e4bb5e4f8_to_t_string_memory_ptr() -> converted {
            converted := copy_literal_to_memory_1863069b843956ab98c9f40676ad1999347dd2328a71693623254d8e4bb5e4f8()
        }

        /// @ast-id 699
        /// @src 1:886:3257  "constructor() {..."
        function constructor_Harness_759() {

            /// @src 1:886:3257  "constructor() {..."
            constructor_Eurus_312()

            /// @src 1:935:936  "1"
            let expr_335 := 0x01
            /// @src 1:927:937  "address(1)"
            let expr_336 := convert_t_rational_1_by_1_to_t_address(expr_335)
            /// @src 1:921:938  "ERC20(address(1))"
            let expr_337_address := convert_t_address_to_t_contract$_ERC20_$236(expr_336)
            /// @src 1:910:938  "tgtToken = ERC20(address(1))"
            update_storage_value_offset_0t_contract$_ERC20_$236_to_t_contract$_ERC20_$236(0x00, expr_337_address)
            let expr_338_address := expr_337_address
            /// @src 1:973:974  "2"
            let expr_344 := 0x02
            /// @src 1:965:975  "address(2)"
            let expr_345 := convert_t_rational_2_by_1_to_t_address(expr_344)
            /// @src 1:959:976  "ERC20(address(2))"
            let expr_346_address := convert_t_address_to_t_contract$_ERC20_$236(expr_345)
            /// @src 1:948:976  "ethToken = ERC20(address(2))"
            update_storage_value_offset_0t_contract$_ERC20_$236_to_t_contract$_ERC20_$236(0x01, expr_346_address)
            let expr_347_address := expr_346_address
            /// @src 1:1017:1018  "3"
            let expr_353 := 0x03
            /// @src 1:1009:1019  "address(3)"
            let expr_354 := convert_t_rational_3_by_1_to_t_address(expr_353)
            /// @src 1:996:1020  "UniswapModel(address(3))"
            let expr_355_address := convert_t_address_to_t_contract$_UniswapModel_$1143(expr_354)
            /// @src 1:986:1020  "uniswap = UniswapModel(address(3))"
            update_storage_value_offset_0t_contract$_UniswapModel_$1143_to_t_contract$_UniswapModel_$1143(0x02, expr_355_address)
            let expr_356_address := expr_355_address
            /// @src 1:1056:1057  "4"
            let expr_362 := 0x04
            /// @src 1:1048:1058  "address(4)"
            let expr_363 := convert_t_rational_4_by_1_to_t_address(expr_362)
            /// @src 1:1037:1059  "PuppetPool(address(4))"
            let expr_364_address := convert_t_address_to_t_contract$_PuppetPool_$979(expr_363)
            /// @src 1:1030:1059  "pool = PuppetPool(address(4))"
            update_storage_value_offset_0t_contract$_PuppetPool_$979_to_t_contract$_PuppetPool_$979(0x03, expr_364_address)
            let expr_365_address := expr_364_address
            /// @src 1:1085:1086  "5"
            let expr_370 := 0x05
            /// @src 1:1077:1087  "address(5)"
            let expr_371 := convert_t_rational_5_by_1_to_t_address(expr_370)
            /// @src 1:1069:1087  "owner = address(5)"
            update_storage_value_offset_0t_address_to_t_address(0x04, expr_371)
            let expr_372 := expr_371
            /// @src 1:1113:1114  "0"
            let expr_376 := 0x00
            /// @src 1:1097:1114  "uint256 value = 0"
            let var_value_375 := convert_t_rational_0_by_1_to_t_uint256(expr_376)
            /// @src 1:1149:1153  "this"
            let expr_382_address := address()
            /// @src 1:1141:1154  "address(this)"
            let expr_383 := convert_t_contract$_Harness_$759_to_t_address(expr_382_address)
            /// @src 1:1124:1154  "address sender = address(this)"
            let var_sender_379 := expr_383
            /// @src 1:1172:1173  "0"
            let expr_386 := 0x00
            /// @src 1:1164:1173  "value = 0"
            let _2 := convert_t_rational_0_by_1_to_t_uint256(expr_386)
            var_value_375 := _2
            let expr_387 := _2
            /// @src 1:1200:1206  "sender"
            let _3 := var_sender_379
            let expr_390 := _3
            fun_eurus_prank_once_299(expr_390)
            /// @src 1:1246:1253  "uniswap"
            let _4_address := read_from_storage_split_offset_0_t_contract$_UniswapModel_$1143(0x02)
            let expr_397_address := _4_address
            /// @src 1:1238:1254  "address(uniswap)"
            let expr_398 := convert_t_contract$_UniswapModel_$1143_to_t_address(expr_397_address)
            /// @src 1:1238:1259  "address(uniswap).call"
            let expr_399_address := expr_398
            /// @src 1:1306:1314  "tgtToken"
            let _5_address := read_from_storage_split_offset_0_t_contract$_ERC20_$236(0x00)
            let expr_405_address := _5_address
            /// @src 1:1298:1315  "address(tgtToken)"
            let expr_406 := convert_t_contract$_ERC20_$236_to_t_address(expr_405_address)
            /// @src 1:1325:1333  "ethToken"
            let _6_address := read_from_storage_split_offset_0_t_contract$_ERC20_$236(0x01)
            let expr_409_address := _6_address
            /// @src 1:1317:1334  "address(ethToken)"
            let expr_410 := convert_t_contract$_ERC20_$236_to_t_address(expr_409_address)
            /// @src 1:1260:1335  "abi.encodeWithSelector(hex\"a7be7948\", address(tgtToken), address(ethToken))"
            let _7 := convert_t_stringliteral_03a8a2a8f6aa8ae43ce8815ce3b819163fc1f4ed4af2268d87a55652fd314de2_to_t_bytes4()

            let expr_411_mpos := allocate_unbounded()
            let _8 := add(expr_411_mpos, 0x20)

            mstore(_8, _7)
            _8 := add(_8, 4)

            let _9 := abi_encode_tuple_t_address_t_address__to_t_address_t_address__fromStack(_8, expr_406, expr_410)
            mstore(expr_411_mpos, sub(_9, add(expr_411_mpos, 0x20)))
            finalize_allocation(expr_411_mpos, sub(_9, expr_411_mpos))
            /// @src 1:1238:1336  "address(uniswap).call(abi.encodeWithSelector(hex\"a7be7948\", address(tgtToken), address(ethToken)))"

            let _10 := add(expr_411_mpos, 0x20)
            let _11 := mload(expr_411_mpos)

            let expr_412_component_1 := call(gas(), expr_399_address,  0,  _10, _11, 0, 0)
            let expr_412_component_2_mpos := extract_returndata()
            /// @src 1:1217:1336  "(bool success81, ) = address(uniswap).call(abi.encodeWithSelector(hex\"a7be7948\", address(tgtToken), address(ethToken)))"
            let var_success81_394 := expr_412_component_1
            /// @src 1:1369:1378  "success81"
            let _12 := var_success81_394
            let expr_416 := _12
            /// @src 1:1346:1379  "eurus_assume(\"msg365\", success81)"
            let _13_mpos := convert_t_stringliteral_203bacc78a2eb7f519576692bc60aaafc70a1bd0d0ec0fae0da790d832406d35_to_t_string_memory_ptr()
            fun_eurus_assume_253(_13_mpos, expr_416)
            /// @src 1:1397:1398  "0"
            let expr_420 := 0x00
            /// @src 1:1389:1398  "value = 0"
            let _14 := convert_t_rational_0_by_1_to_t_uint256(expr_420)
            var_value_375 := _14
            let expr_421 := _14
            /// @src 1:1425:1431  "sender"
            let _15 := var_sender_379
            let expr_424 := _15
            fun_eurus_prank_once_299(expr_424)
            /// @src 1:1472:1476  "pool"
            let _16_address := read_from_storage_split_offset_0_t_contract$_PuppetPool_$979(0x03)
            let expr_431_address := _16_address
            /// @src 1:1464:1477  "address(pool)"
            let expr_432 := convert_t_contract$_PuppetPool_$979_to_t_address(expr_431_address)
            /// @src 1:1464:1482  "address(pool).call"
            let expr_433_address := expr_432
            /// @src 1:1529:1537  "ethToken"
            let _17_address := read_from_storage_split_offset_0_t_contract$_ERC20_$236(0x01)
            let expr_439_address := _17_address
            /// @src 1:1521:1538  "address(ethToken)"
            let expr_440 := convert_t_contract$_ERC20_$236_to_t_address(expr_439_address)
            /// @src 1:1548:1556  "tgtToken"
            let _18_address := read_from_storage_split_offset_0_t_contract$_ERC20_$236(0x00)
            let expr_443_address := _18_address
            /// @src 1:1540:1557  "address(tgtToken)"
            let expr_444 := convert_t_contract$_ERC20_$236_to_t_address(expr_443_address)
            /// @src 1:1567:1574  "uniswap"
            let _19_address := read_from_storage_split_offset_0_t_contract$_UniswapModel_$1143(0x02)
            let expr_447_address := _19_address
            /// @src 1:1559:1575  "address(uniswap)"
            let expr_448 := convert_t_contract$_UniswapModel_$1143_to_t_address(expr_447_address)
            /// @src 1:1483:1576  "abi.encodeWithSelector(hex\"8597600f\", address(ethToken), address(tgtToken), address(uniswap))"
            let _20 := convert_t_stringliteral_50f05b09664371a5ffabeeb22871cddbfbc34f409488a95c0262348f5f5234ea_to_t_bytes4()

            let expr_449_mpos := allocate_unbounded()
            let _21 := add(expr_449_mpos, 0x20)

            mstore(_21, _20)
            _21 := add(_21, 4)

            let _22 := abi_encode_tuple_t_address_t_address_t_address__to_t_address_t_address_t_address__fromStack(_21, expr_440, expr_444, expr_448)
            mstore(expr_449_mpos, sub(_22, add(expr_449_mpos, 0x20)))
            finalize_allocation(expr_449_mpos, sub(_22, expr_449_mpos))
            /// @src 1:1464:1577  "address(pool).call(abi.encodeWithSelector(hex\"8597600f\", address(ethToken), address(tgtToken), address(uniswap)))"

            let _23 := add(expr_449_mpos, 0x20)
            let _24 := mload(expr_449_mpos)

            let expr_450_component_1 := call(gas(), expr_433_address,  0,  _23, _24, 0, 0)
            let expr_450_component_2_mpos := extract_returndata()
            /// @src 1:1442:1577  "(bool success111, ) = address(pool).call(abi.encodeWithSelector(hex\"8597600f\", address(ethToken), address(tgtToken), address(uniswap)))"
            let var_success111_428 := expr_450_component_1
            /// @src 1:1610:1620  "success111"
            let _25 := var_success111_428
            let expr_454 := _25
            /// @src 1:1587:1621  "eurus_assume(\"msg361\", success111)"
            let _26_mpos := convert_t_stringliteral_4441e641e0a1af5162bb8d02bf7cb80de2980952e90686dd4d78bc71bbc6f33d_to_t_string_memory_ptr()
            fun_eurus_assume_253(_26_mpos, expr_454)
            /// @src 1:1639:1640  "0"
            let expr_458 := 0x00
            /// @src 1:1631:1640  "value = 0"
            let _27 := convert_t_rational_0_by_1_to_t_uint256(expr_458)
            var_value_375 := _27
            let expr_459 := _27
            /// @src 1:1667:1673  "sender"
            let _28 := var_sender_379
            let expr_462 := _28
            fun_eurus_prank_once_299(expr_462)
            /// @src 1:1714:1722  "tgtToken"
            let _29_address := read_from_storage_split_offset_0_t_contract$_ERC20_$236(0x00)
            let expr_469_address := _29_address
            /// @src 1:1706:1723  "address(tgtToken)"
            let expr_470 := convert_t_contract$_ERC20_$236_to_t_address(expr_469_address)
            /// @src 1:1706:1728  "address(tgtToken).call"
            let expr_471_address := expr_470
            /// @src 1:1767:1772  "owner"
            let _30 := read_from_storage_split_offset_0_t_address(0x04)
            let expr_475 := _30
            /// @src 1:1774:1781  "1000000"
            let expr_476 := 0x0f4240
            /// @src 1:1729:1782  "abi.encodeWithSelector(hex\"dac3bd85\", owner, 1000000)"
            let _31 := convert_t_stringliteral_ca3af10847493457e4ae06eb52beb20192cd8bb0f2f2c13aa43273621def20ad_to_t_bytes4()

            let expr_477_mpos := allocate_unbounded()
            let _32 := add(expr_477_mpos, 0x20)

            mstore(_32, _31)
            _32 := add(_32, 4)

            let _33 := abi_encode_tuple_t_address_t_rational_1000000_by_1__to_t_address_t_uint24__fromStack(_32, expr_475, expr_476)
            mstore(expr_477_mpos, sub(_33, add(expr_477_mpos, 0x20)))
            finalize_allocation(expr_477_mpos, sub(_33, expr_477_mpos))
            /// @src 1:1706:1783  "address(tgtToken).call(abi.encodeWithSelector(hex\"dac3bd85\", owner, 1000000))"

            let _34 := add(expr_477_mpos, 0x20)
            let _35 := mload(expr_477_mpos)

            let expr_478_component_1 := call(gas(), expr_471_address,  0,  _34, _35, 0, 0)
            let expr_478_component_2_mpos := extract_returndata()
            /// @src 1:1684:1783  "(bool success135, ) = address(tgtToken).call(abi.encodeWithSelector(hex\"dac3bd85\", owner, 1000000))"
            let var_success135_466 := expr_478_component_1
            /// @src 1:1816:1826  "success135"
            let _36 := var_success135_466
            let expr_482 := _36
            /// @src 1:1793:1827  "eurus_assume(\"msg357\", success135)"
            let _37_mpos := convert_t_stringliteral_94f1eedc245f9b90c68c4e31098b2de5d4ebcc27daf1e752f0398a38568e1a44_to_t_string_memory_ptr()
            fun_eurus_assume_253(_37_mpos, expr_482)
            /// @src 1:1845:1846  "0"
            let expr_486 := 0x00
            /// @src 1:1837:1846  "value = 0"
            let _38 := convert_t_rational_0_by_1_to_t_uint256(expr_486)
            var_value_375 := _38
            let expr_487 := _38
            /// @src 1:1873:1879  "sender"
            let _39 := var_sender_379
            let expr_490 := _39
            fun_eurus_prank_once_299(expr_490)
            /// @src 1:1920:1928  "ethToken"
            let _40_address := read_from_storage_split_offset_0_t_contract$_ERC20_$236(0x01)
            let expr_497_address := _40_address
            /// @src 1:1912:1929  "address(ethToken)"
            let expr_498 := convert_t_contract$_ERC20_$236_to_t_address(expr_497_address)
            /// @src 1:1912:1934  "address(ethToken).call"
            let expr_499_address := expr_498
            /// @src 1:1973:1978  "owner"
            let _41 := read_from_storage_split_offset_0_t_address(0x04)
            let expr_503 := _41
            /// @src 1:1980:1987  "1000000"
            let expr_504 := 0x0f4240
            /// @src 1:1935:1988  "abi.encodeWithSelector(hex\"dac3bd85\", owner, 1000000)"
            let _42 := convert_t_stringliteral_ca3af10847493457e4ae06eb52beb20192cd8bb0f2f2c13aa43273621def20ad_to_t_bytes4()

            let expr_505_mpos := allocate_unbounded()
            let _43 := add(expr_505_mpos, 0x20)

            mstore(_43, _42)
            _43 := add(_43, 4)

            let _44 := abi_encode_tuple_t_address_t_rational_1000000_by_1__to_t_address_t_uint24__fromStack(_43, expr_503, expr_504)
            mstore(expr_505_mpos, sub(_44, add(expr_505_mpos, 0x20)))
            finalize_allocation(expr_505_mpos, sub(_44, expr_505_mpos))
            /// @src 1:1912:1989  "address(ethToken).call(abi.encodeWithSelector(hex\"dac3bd85\", owner, 1000000))"

            let _45 := add(expr_505_mpos, 0x20)
            let _46 := mload(expr_505_mpos)

            let expr_506_component_1 := call(gas(), expr_499_address,  0,  _45, _46, 0, 0)
            let expr_506_component_2_mpos := extract_returndata()
            /// @src 1:1890:1989  "(bool success159, ) = address(ethToken).call(abi.encodeWithSelector(hex\"dac3bd85\", owner, 1000000))"
            let var_success159_494 := expr_506_component_1
            /// @src 1:2022:2032  "success159"
            let _47 := var_success159_494
            let expr_510 := _47
            /// @src 1:1999:2033  "eurus_assume(\"msg353\", success159)"
            let _48_mpos := convert_t_stringliteral_5a2b1fa336d9f0091b5dc3f9cae4f8b9c297202ff82060e05516cef51604d07b_to_t_string_memory_ptr()
            fun_eurus_assume_253(_48_mpos, expr_510)
            /// @src 1:2052:2057  "owner"
            let _49 := read_from_storage_split_offset_0_t_address(0x04)
            let expr_514 := _49
            /// @src 1:2043:2057  "sender = owner"
            var_sender_379 := expr_514
            let expr_515 := expr_514
            /// @src 1:2075:2076  "0"
            let expr_518 := 0x00
            /// @src 1:2067:2076  "value = 0"
            let _50 := convert_t_rational_0_by_1_to_t_uint256(expr_518)
            var_value_375 := _50
            let expr_519 := _50
            /// @src 1:2103:2109  "sender"
            let _51 := var_sender_379
            let expr_522 := _51
            fun_eurus_prank_once_299(expr_522)
            /// @src 1:2150:2158  "tgtToken"
            let _52_address := read_from_storage_split_offset_0_t_contract$_ERC20_$236(0x00)
            let expr_529_address := _52_address
            /// @src 1:2142:2159  "address(tgtToken)"
            let expr_530 := convert_t_contract$_ERC20_$236_to_t_address(expr_529_address)
            /// @src 1:2142:2164  "address(tgtToken).call"
            let expr_531_address := expr_530
            /// @src 1:2211:2215  "pool"
            let _53_address := read_from_storage_split_offset_0_t_contract$_PuppetPool_$979(0x03)
            let expr_537_address := _53_address
            /// @src 1:2203:2216  "address(pool)"
            let expr_538 := convert_t_contract$_PuppetPool_$979_to_t_address(expr_537_address)
            /// @src 1:2218:2224  "100000"
            let expr_539 := 0x0186a0
            /// @src 1:2165:2225  "abi.encodeWithSelector(hex\"a9059cbb\", address(pool), 100000)"
            let _54 := convert_t_stringliteral_abce0605a16ff5e998983a0af570b8ad942bb11e305eb20ae3ada0a3be24eb97_to_t_bytes4()

            let expr_540_mpos := allocate_unbounded()
            let _55 := add(expr_540_mpos, 0x20)

            mstore(_55, _54)
            _55 := add(_55, 4)

            let _56 := abi_encode_tuple_t_address_t_rational_100000_by_1__to_t_address_t_uint24__fromStack(_55, expr_538, expr_539)
            mstore(expr_540_mpos, sub(_56, add(expr_540_mpos, 0x20)))
            finalize_allocation(expr_540_mpos, sub(_56, expr_540_mpos))
            /// @src 1:2142:2226  "address(tgtToken).call(abi.encodeWithSelector(hex\"a9059cbb\", address(pool), 100000))"

            let _57 := add(expr_540_mpos, 0x20)
            let _58 := mload(expr_540_mpos)

            let expr_541_component_1 := call(gas(), expr_531_address,  0,  _57, _58, 0, 0)
            let expr_541_component_2_mpos := extract_returndata()
            /// @src 1:2120:2226  "(bool success190, ) = address(tgtToken).call(abi.encodeWithSelector(hex\"a9059cbb\", address(pool), 100000))"
            let var_success190_526 := expr_541_component_1
            /// @src 1:2259:2269  "success190"
            let _59 := var_success190_526
            let expr_545 := _59
            /// @src 1:2259:2277  "success190 && true"
            let expr_547 := expr_545
            if expr_547 {
                /// @src 1:2273:2277  "true"
                let expr_546 := 0x01
                /// @src 1:2259:2277  "success190 && true"
                expr_547 := expr_546
            }
            /// @src 1:2236:2278  "eurus_assume(\"msg349\", success190 && true)"
            let _60_mpos := convert_t_stringliteral_83229ee0bf384381a6a024c33beb74efbb518716a5b51adfcef8bbb412aee07d_to_t_string_memory_ptr()
            fun_eurus_assume_253(_60_mpos, expr_547)
            /// @src 1:2297:2302  "owner"
            let _61 := read_from_storage_split_offset_0_t_address(0x04)
            let expr_551 := _61
            /// @src 1:2288:2302  "sender = owner"
            var_sender_379 := expr_551
            let expr_552 := expr_551
            /// @src 1:2320:2321  "0"
            let expr_555 := 0x00
            /// @src 1:2312:2321  "value = 0"
            let _62 := convert_t_rational_0_by_1_to_t_uint256(expr_555)
            var_value_375 := _62
            let expr_556 := _62
            /// @src 1:2348:2354  "sender"
            let _63 := var_sender_379
            let expr_559 := _63
            fun_eurus_prank_once_299(expr_559)
            /// @src 1:2395:2403  "tgtToken"
            let _64_address := read_from_storage_split_offset_0_t_contract$_ERC20_$236(0x00)
            let expr_566_address := _64_address
            /// @src 1:2387:2404  "address(tgtToken)"
            let expr_567 := convert_t_contract$_ERC20_$236_to_t_address(expr_566_address)
            /// @src 1:2387:2409  "address(tgtToken).call"
            let expr_568_address := expr_567
            /// @src 1:2456:2463  "uniswap"
            let _65_address := read_from_storage_split_offset_0_t_contract$_UniswapModel_$1143(0x02)
            let expr_574_address := _65_address
            /// @src 1:2448:2464  "address(uniswap)"
            let expr_575 := convert_t_contract$_UniswapModel_$1143_to_t_address(expr_574_address)
            /// @src 1:2466:2468  "10"
            let expr_576 := 0x0a
            /// @src 1:2410:2469  "abi.encodeWithSelector(hex\"a9059cbb\", address(uniswap), 10)"
            let _66 := convert_t_stringliteral_abce0605a16ff5e998983a0af570b8ad942bb11e305eb20ae3ada0a3be24eb97_to_t_bytes4()

            let expr_577_mpos := allocate_unbounded()
            let _67 := add(expr_577_mpos, 0x20)

            mstore(_67, _66)
            _67 := add(_67, 4)

            let _68 := abi_encode_tuple_t_address_t_rational_10_by_1__to_t_address_t_uint8__fromStack(_67, expr_575, expr_576)
            mstore(expr_577_mpos, sub(_68, add(expr_577_mpos, 0x20)))
            finalize_allocation(expr_577_mpos, sub(_68, expr_577_mpos))
            /// @src 1:2387:2470  "address(tgtToken).call(abi.encodeWithSelector(hex\"a9059cbb\", address(uniswap), 10))"

            let _69 := add(expr_577_mpos, 0x20)
            let _70 := mload(expr_577_mpos)

            let expr_578_component_1 := call(gas(), expr_568_address,  0,  _69, _70, 0, 0)
            let expr_578_component_2_mpos := extract_returndata()
            /// @src 1:2365:2470  "(bool success222, ) = address(tgtToken).call(abi.encodeWithSelector(hex\"a9059cbb\", address(uniswap), 10))"
            let var_success222_563 := expr_578_component_1
            /// @src 1:2503:2513  "success222"
            let _71 := var_success222_563
            let expr_582 := _71
            /// @src 1:2503:2521  "success222 && true"
            let expr_584 := expr_582
            if expr_584 {
                /// @src 1:2517:2521  "true"
                let expr_583 := 0x01
                /// @src 1:2503:2521  "success222 && true"
                expr_584 := expr_583
            }
            /// @src 1:2480:2522  "eurus_assume(\"msg345\", success222 && true)"
            let _72_mpos := convert_t_stringliteral_b5e74df209956697782a966c6e7d5bbc5eaef7076f1639883cb1866abf741dbf_to_t_string_memory_ptr()
            fun_eurus_assume_253(_72_mpos, expr_584)
            /// @src 1:2541:2546  "owner"
            let _73 := read_from_storage_split_offset_0_t_address(0x04)
            let expr_588 := _73
            /// @src 1:2532:2546  "sender = owner"
            var_sender_379 := expr_588
            let expr_589 := expr_588
            /// @src 1:2564:2565  "0"
            let expr_592 := 0x00
            /// @src 1:2556:2565  "value = 0"
            let _74 := convert_t_rational_0_by_1_to_t_uint256(expr_592)
            var_value_375 := _74
            let expr_593 := _74
            /// @src 1:2592:2598  "sender"
            let _75 := var_sender_379
            let expr_596 := _75
            fun_eurus_prank_once_299(expr_596)
            /// @src 1:2639:2647  "ethToken"
            let _76_address := read_from_storage_split_offset_0_t_contract$_ERC20_$236(0x01)
            let expr_603_address := _76_address
            /// @src 1:2631:2648  "address(ethToken)"
            let expr_604 := convert_t_contract$_ERC20_$236_to_t_address(expr_603_address)
            /// @src 1:2631:2653  "address(ethToken).call"
            let expr_605_address := expr_604
            /// @src 1:2700:2707  "uniswap"
            let _77_address := read_from_storage_split_offset_0_t_contract$_UniswapModel_$1143(0x02)
            let expr_611_address := _77_address
            /// @src 1:2692:2708  "address(uniswap)"
            let expr_612 := convert_t_contract$_UniswapModel_$1143_to_t_address(expr_611_address)
            /// @src 1:2710:2712  "10"
            let expr_613 := 0x0a
            /// @src 1:2654:2713  "abi.encodeWithSelector(hex\"a9059cbb\", address(uniswap), 10)"
            let _78 := convert_t_stringliteral_abce0605a16ff5e998983a0af570b8ad942bb11e305eb20ae3ada0a3be24eb97_to_t_bytes4()

            let expr_614_mpos := allocate_unbounded()
            let _79 := add(expr_614_mpos, 0x20)

            mstore(_79, _78)
            _79 := add(_79, 4)

            let _80 := abi_encode_tuple_t_address_t_rational_10_by_1__to_t_address_t_uint8__fromStack(_79, expr_612, expr_613)
            mstore(expr_614_mpos, sub(_80, add(expr_614_mpos, 0x20)))
            finalize_allocation(expr_614_mpos, sub(_80, expr_614_mpos))
            /// @src 1:2631:2714  "address(ethToken).call(abi.encodeWithSelector(hex\"a9059cbb\", address(uniswap), 10))"

            let _81 := add(expr_614_mpos, 0x20)
            let _82 := mload(expr_614_mpos)

            let expr_615_component_1 := call(gas(), expr_605_address,  0,  _81, _82, 0, 0)
            let expr_615_component_2_mpos := extract_returndata()
            /// @src 1:2609:2714  "(bool success254, ) = address(ethToken).call(abi.encodeWithSelector(hex\"a9059cbb\", address(uniswap), 10))"
            let var_success254_600 := expr_615_component_1
            /// @src 1:2747:2757  "success254"
            let _83 := var_success254_600
            let expr_619 := _83
            /// @src 1:2747:2765  "success254 && true"
            let expr_621 := expr_619
            if expr_621 {
                /// @src 1:2761:2765  "true"
                let expr_620 := 0x01
                /// @src 1:2747:2765  "success254 && true"
                expr_621 := expr_620
            }
            /// @src 1:2724:2766  "eurus_assume(\"msg341\", success254 && true)"
            let _84_mpos := convert_t_stringliteral_9472547d2fdad7d085cdfd9b64240cbf4a0f743cf79e14615ddfaf0bed54d85f_to_t_string_memory_ptr()
            fun_eurus_assume_253(_84_mpos, expr_621)
            /// @src 1:2785:2790  "owner"
            let _85 := read_from_storage_split_offset_0_t_address(0x04)
            let expr_625 := _85
            /// @src 1:2776:2790  "sender = owner"
            var_sender_379 := expr_625
            let expr_626 := expr_625
            /// @src 1:2808:2809  "0"
            let expr_629 := 0x00
            /// @src 1:2800:2809  "value = 0"
            let _86 := convert_t_rational_0_by_1_to_t_uint256(expr_629)
            var_value_375 := _86
            let expr_630 := _86
            /// @src 1:2836:2842  "sender"
            let _87 := var_sender_379
            let expr_633 := _87
            fun_eurus_prank_once_299(expr_633)
            /// @src 1:2883:2891  "tgtToken"
            let _88_address := read_from_storage_split_offset_0_t_contract$_ERC20_$236(0x00)
            let expr_640_address := _88_address
            /// @src 1:2875:2892  "address(tgtToken)"
            let expr_641 := convert_t_contract$_ERC20_$236_to_t_address(expr_640_address)
            /// @src 1:2875:2897  "address(tgtToken).call"
            let expr_642_address := expr_641
            /// @src 1:2944:2948  "this"
            let expr_648_address := address()
            /// @src 1:2936:2949  "address(this)"
            let expr_649 := convert_t_contract$_Harness_$759_to_t_address(expr_648_address)
            /// @src 1:2951:2955  "1000"
            let expr_650 := 0x03e8
            /// @src 1:2898:2956  "abi.encodeWithSelector(hex\"a9059cbb\", address(this), 1000)"
            let _89 := convert_t_stringliteral_abce0605a16ff5e998983a0af570b8ad942bb11e305eb20ae3ada0a3be24eb97_to_t_bytes4()

            let expr_651_mpos := allocate_unbounded()
            let _90 := add(expr_651_mpos, 0x20)

            mstore(_90, _89)
            _90 := add(_90, 4)

            let _91 := abi_encode_tuple_t_address_t_rational_1000_by_1__to_t_address_t_uint16__fromStack(_90, expr_649, expr_650)
            mstore(expr_651_mpos, sub(_91, add(expr_651_mpos, 0x20)))
            finalize_allocation(expr_651_mpos, sub(_91, expr_651_mpos))
            /// @src 1:2875:2957  "address(tgtToken).call(abi.encodeWithSelector(hex\"a9059cbb\", address(this), 1000))"

            let _92 := add(expr_651_mpos, 0x20)
            let _93 := mload(expr_651_mpos)

            let expr_652_component_1 := call(gas(), expr_642_address,  0,  _92, _93, 0, 0)
            let expr_652_component_2_mpos := extract_returndata()
            /// @src 1:2853:2957  "(bool success289, ) = address(tgtToken).call(abi.encodeWithSelector(hex\"a9059cbb\", address(this), 1000))"
            let var_success289_637 := expr_652_component_1
            /// @src 1:2990:3000  "success289"
            let _94 := var_success289_637
            let expr_656 := _94
            /// @src 1:2990:3008  "success289 && true"
            let expr_658 := expr_656
            if expr_658 {
                /// @src 1:3004:3008  "true"
                let expr_657 := 0x01
                /// @src 1:2990:3008  "success289 && true"
                expr_658 := expr_657
            }
            /// @src 1:2967:3009  "eurus_assume(\"msg333\", success289 && true)"
            let _95_mpos := convert_t_stringliteral_d6517175b2b01e61adabcc1ac299c52cffc04481afc45cc590f19e321c137d8a_to_t_string_memory_ptr()
            fun_eurus_assume_253(_95_mpos, expr_658)
            /// @src 1:3028:3033  "owner"
            let _96 := read_from_storage_split_offset_0_t_address(0x04)
            let expr_662 := _96
            /// @src 1:3019:3033  "sender = owner"
            var_sender_379 := expr_662
            let expr_663 := expr_662
            /// @src 1:3051:3052  "0"
            let expr_666 := 0x00
            /// @src 1:3043:3052  "value = 0"
            let _97 := convert_t_rational_0_by_1_to_t_uint256(expr_666)
            var_value_375 := _97
            let expr_667 := _97
            /// @src 1:3079:3085  "sender"
            let _98 := var_sender_379
            let expr_670 := _98
            fun_eurus_prank_once_299(expr_670)
            /// @src 1:3126:3134  "ethToken"
            let _99_address := read_from_storage_split_offset_0_t_contract$_ERC20_$236(0x01)
            let expr_677_address := _99_address
            /// @src 1:3118:3135  "address(ethToken)"
            let expr_678 := convert_t_contract$_ERC20_$236_to_t_address(expr_677_address)
            /// @src 1:3118:3140  "address(ethToken).call"
            let expr_679_address := expr_678
            /// @src 1:3187:3191  "this"
            let expr_685_address := address()
            /// @src 1:3179:3192  "address(this)"
            let expr_686 := convert_t_contract$_Harness_$759_to_t_address(expr_685_address)
            /// @src 1:3194:3196  "25"
            let expr_687 := 0x19
            /// @src 1:3141:3197  "abi.encodeWithSelector(hex\"a9059cbb\", address(this), 25)"
            let _100 := convert_t_stringliteral_abce0605a16ff5e998983a0af570b8ad942bb11e305eb20ae3ada0a3be24eb97_to_t_bytes4()

            let expr_688_mpos := allocate_unbounded()
            let _101 := add(expr_688_mpos, 0x20)

            mstore(_101, _100)
            _101 := add(_101, 4)

            let _102 := abi_encode_tuple_t_address_t_rational_25_by_1__to_t_address_t_uint8__fromStack(_101, expr_686, expr_687)
            mstore(expr_688_mpos, sub(_102, add(expr_688_mpos, 0x20)))
            finalize_allocation(expr_688_mpos, sub(_102, expr_688_mpos))
            /// @src 1:3118:3198  "address(ethToken).call(abi.encodeWithSelector(hex\"a9059cbb\", address(this), 25))"

            let _103 := add(expr_688_mpos, 0x20)
            let _104 := mload(expr_688_mpos)

            let expr_689_component_1 := call(gas(), expr_679_address,  0,  _103, _104, 0, 0)
            let expr_689_component_2_mpos := extract_returndata()
            /// @src 1:3096:3198  "(bool success324, ) = address(ethToken).call(abi.encodeWithSelector(hex\"a9059cbb\", address(this), 25))"
            let var_success324_674 := expr_689_component_1
            /// @src 1:3231:3241  "success324"
            let _105 := var_success324_674
            let expr_693 := _105
            /// @src 1:3231:3249  "success324 && true"
            let expr_695 := expr_693
            if expr_695 {
                /// @src 1:3245:3249  "true"
                let expr_694 := 0x01
                /// @src 1:3231:3249  "success324 && true"
                expr_695 := expr_694
            }
            /// @src 1:3208:3250  "eurus_assume(\"msg337\", success324 && true)"
            let _106_mpos := convert_t_stringliteral_1863069b843956ab98c9f40676ad1999347dd2328a71693623254d8e4bb5e4f8_to_t_string_memory_ptr()
            fun_eurus_assume_253(_106_mpos, expr_695)

        }
        /// @src 3:228:790  "contract Synthesis is Harness {..."

        /// @src 1:105:736  "contract Eurus {..."
        function constructor_Eurus_312() {

            /// @src 1:105:736  "contract Eurus {..."

        }
        /// @src 3:228:790  "contract Synthesis is Harness {..."

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

        /// @ast-id 253
        /// @src 1:126:218  "function eurus_assume(string memory msg, bool cond) public view {..."
        function fun_eurus_assume_253(var_msg_243_mpos, var_cond_245) {

            /// @src 1:207:210  "msg"
            let _107_mpos := var_msg_243_mpos
            let expr_249_mpos := _107_mpos
            /// @src 1:200:211  "revert(msg)"
            {
                let _108 := allocate_unbounded()
                mstore(_108, 3963877391197344453575983046348115674221700746820753546331534351508065746944)
                let _109 := abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack(add(_108, 4) , expr_249_mpos)
                // adapted by Eurus: hijack_eurus_assume
                eurus_assume(_108, sub(_109, _108), var_cond_245)
            }
        }
        /// @src 3:228:790  "contract Synthesis is Harness {..."

        function store_literal_in_memory_046e3b60602e4c9ae035a6752d3453a5f0b8da88167fb304fd5bb28922e092b0(memPtr) {

            mstore(add(memPtr, 0), "eurus_prank_once")

        }

        function abi_encode_t_stringliteral_046e3b60602e4c9ae035a6752d3453a5f0b8da88167fb304fd5bb28922e092b0_to_t_string_memory_ptr_fromStack(pos) -> end {
            pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 16)
            store_literal_in_memory_046e3b60602e4c9ae035a6752d3453a5f0b8da88167fb304fd5bb28922e092b0(pos)
            end := add(pos, 32)
        }

        function abi_encode_tuple_t_stringliteral_046e3b60602e4c9ae035a6752d3453a5f0b8da88167fb304fd5bb28922e092b0__to_t_string_memory_ptr__fromStack(headStart ) -> tail {
            tail := add(headStart, 32)

            mstore(add(headStart, 0), sub(tail, headStart))
            tail := abi_encode_t_stringliteral_046e3b60602e4c9ae035a6752d3453a5f0b8da88167fb304fd5bb28922e092b0_to_t_string_memory_ptr_fromStack( tail)

        }

        /// @ast-id 299
        /// @src 1:522:619  "function eurus_prank_once(address sender) public view {..."
        function fun_eurus_prank_once_299(var_sender_291) {
                // adapted by Eurus: hijack_eurus_prank_once
                eurus_prank_once(var_sender_291)
        }
        /// @src 3:228:790  "contract Synthesis is Harness {..."

    }
    /// @use-src 1:"Harness.sol", 3:"Synthesis.sol"
    object "Synthesis_81_deployed" {
        code {
            /// @src 3:228:790  "contract Synthesis is Harness {..."
            mstore(64, memoryguard(128))

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x1dd906d0
                {
                    // eurus_assume(string,bool)

                    external_fun_eurus_assume_253()
                }

                case 0x2af896fb
                {
                    // synthesis()

                    external_fun_synthesis_26()
                }

                case 0x2d26ac43
                {
                    // eurus_assert(string,bool)

                    external_fun_eurus_assert_265()
                }

                case 0x36beb6cb
                {
                    // synthesis0()

                    external_fun_synthesis0_80()
                }

                case 0x9e5faafc
                {
                    // attack()

                    external_fun_attack_19()
                }

                case 0xa1c923fd
                {
                    // eurus_attack(string,bool)

                    external_fun_eurus_attack_289()
                }

                case 0xd85f77d6
                {
                    // eurus_synthesize(string,bool)

                    external_fun_eurus_synthesize_277()
                }

                case 0xdb9d7e71
                {
                    // harness465()

                    external_fun_harness465_758()
                }

                case 0xe7b2c72d
                {
                    // eurus_prank_once(address)

                    external_fun_eurus_prank_once_299()
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

            function revert_error_1b9f4a0a5773e33b91aa01db23bf8c55fce1411167c872835e7fa00a4f17d46d() {
                revert(0, 0)
            }

            function revert_error_987264b3b1d58a9c7f8255e93e81c77d86d6299019c33110a076957a3e06e2ae() {
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

            function array_allocation_size_t_string_memory_ptr(length) -> size {
                // Make sure we can allocate memory without overflow
                if gt(length, 0xffffffffffffffff) { panic_error_0x41() }

                size := round_up_to_mul_of_32(length)

                // add length slot
                size := add(size, 0x20)

            }

            function copy_calldata_to_memory(src, dst, length) {
                calldatacopy(dst, src, length)
                // clear end
                mstore(add(dst, length), 0)
            }

            function abi_decode_available_length_t_string_memory_ptr(src, length, end) -> array {
                array := allocate_memory(array_allocation_size_t_string_memory_ptr(length))
                mstore(array, length)
                let dst := add(array, 0x20)
                if gt(add(src, length), end) { revert_error_987264b3b1d58a9c7f8255e93e81c77d86d6299019c33110a076957a3e06e2ae() }
                copy_calldata_to_memory(src, dst, length)
            }

            // string
            function abi_decode_t_string_memory_ptr(offset, end) -> array {
                if iszero(slt(add(offset, 0x1f), end)) { revert_error_1b9f4a0a5773e33b91aa01db23bf8c55fce1411167c872835e7fa00a4f17d46d() }
                let length := calldataload(offset)
                array := abi_decode_available_length_t_string_memory_ptr(add(offset, 0x20), length, end)
            }

            function cleanup_t_bool(value) -> cleaned {
                cleaned := iszero(iszero(value))
            }

            function validator_revert_t_bool(value) {
                if iszero(eq(value, cleanup_t_bool(value))) { revert(0, 0) }
            }

            function abi_decode_t_bool(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_bool(value)
            }

            function abi_decode_tuple_t_string_memory_ptrt_bool(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := calldataload(add(headStart, 0))
                    if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

                    value0 := abi_decode_t_string_memory_ptr(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 32

                    value1 := abi_decode_t_bool(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function external_fun_eurus_assume_253() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1 :=  abi_decode_tuple_t_string_memory_ptrt_bool(4, calldatasize())
                fun_eurus_assume_253(param_0, param_1)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

            }

            function external_fun_synthesis_26() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                fun_synthesis_26()
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_eurus_assert_265() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1 :=  abi_decode_tuple_t_string_memory_ptrt_bool(4, calldatasize())
                fun_eurus_assert_265(param_0, param_1)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_synthesis0_80() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                fun_synthesis0_80()
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_attack_19() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                fun_attack_19()
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_eurus_attack_289() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1 :=  abi_decode_tuple_t_string_memory_ptrt_bool(4, calldatasize())
                fun_eurus_attack_289(param_0, param_1)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_eurus_synthesize_277() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1 :=  abi_decode_tuple_t_string_memory_ptrt_bool(4, calldatasize())
                fun_eurus_synthesize_277(param_0, param_1)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_harness465_758() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                fun_harness465_758()
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function cleanup_t_uint160(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_t_address(value) -> cleaned {
                cleaned := cleanup_t_uint160(value)
            }

            function validator_revert_t_address(value) {
                if iszero(eq(value, cleanup_t_address(value))) { revert(0, 0) }
            }

            function abi_decode_t_address(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_address(value)
            }

            function abi_decode_tuple_t_address(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            function external_fun_eurus_prank_once_299() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                fun_eurus_prank_once_299(param_0)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74() {
                // adapted by Eurus: hijack_dispatcher_revert
                eurus_dispatcher_revert()
            }

            /// @ast-id 19
            /// @src 3:323:385  "function attack() public override {..."
            function fun_attack_19() {

                fun_synthesis_26()

            }
            /// @src 3:228:790  "contract Synthesis is Harness {..."

            /// @ast-id 26
            /// @src 3:391:448  "function synthesis() public {..."
            function fun_synthesis_26() {

                fun_synthesis0_80()

            }
            /// @src 3:228:790  "contract Synthesis is Harness {..."

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

            function shift_right_0_unsigned(value) -> newValue {
                newValue :=

                shr(0, value)

            }

            function cleanup_from_storage_t_contract$_ERC20_$236(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function extract_from_storage_value_offset_0t_contract$_ERC20_$236(slot_value) -> value {
                value := cleanup_from_storage_t_contract$_ERC20_$236(shift_right_0_unsigned(slot_value))
            }

            function read_from_storage_split_offset_0_t_contract$_ERC20_$236(slot) -> value {
                value := extract_from_storage_value_offset_0t_contract$_ERC20_$236(sload(slot))

            }

            function identity(value) -> ret {
                ret := value
            }

            function convert_t_uint160_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(identity(cleanup_t_uint160(value)))
            }

            function convert_t_uint160_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_contract$_ERC20_$236_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function cleanup_from_storage_t_contract$_UniswapModel_$1143(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function extract_from_storage_value_offset_0t_contract$_UniswapModel_$1143(slot_value) -> value {
                value := cleanup_from_storage_t_contract$_UniswapModel_$1143(shift_right_0_unsigned(slot_value))
            }

            function read_from_storage_split_offset_0_t_contract$_UniswapModel_$1143(slot) -> value {
                value := extract_from_storage_value_offset_0t_contract$_UniswapModel_$1143(sload(slot))

            }

            function convert_t_contract$_UniswapModel_$1143_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function revert_error_0cc013b6b3b6beabea4e3a74a6d380f0df81852ca99887912475e1f66b2a2c20() {
                revert(0, 0)
            }

            function shift_left_224(value) -> newValue {
                newValue :=

                shl(224, value)

            }

            function abi_decode_t_bool_fromMemory(offset, end) -> value {
                value := mload(offset)
                validator_revert_t_bool(value)
            }

            function abi_decode_tuple_t_bool_fromMemory(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_bool_fromMemory(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_t_address_to_t_address_fromStack(value, pos) {
                mstore(pos, cleanup_t_address(value))
            }

            function cleanup_t_rational_1000_by_1(value) -> cleaned {
                cleaned := value
            }

            function cleanup_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_1000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_1000_by_1(value)))
            }

            function abi_encode_t_rational_1000_by_1_to_t_uint256_fromStack(value, pos) {
                mstore(pos, convert_t_rational_1000_by_1_to_t_uint256(value))
            }

            function abi_encode_tuple_t_address_t_rational_1000_by_1__to_t_address_t_uint256__fromStack(headStart , value0, value1) -> tail {
                tail := add(headStart, 64)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

                abi_encode_t_rational_1000_by_1_to_t_uint256_fromStack(value1,  add(headStart, 32))

            }

            function revert_forward_1() {
                let pos := allocate_unbounded()
                returndatacopy(pos, 0, returndatasize())
                revert(pos, returndatasize())
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

            function cleanup_t_rational_0_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_0_by_1(value)))
            }

            function abi_encode_t_rational_0_by_1_to_t_uint256_fromStack(value, pos) {
                mstore(pos, convert_t_rational_0_by_1_to_t_uint256(value))
            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple_t_rational_0_by_1_t_uint256__to_t_uint256_t_uint256__fromStack(headStart , value0, value1) -> tail {
                tail := add(headStart, 64)

                abi_encode_t_rational_0_by_1_to_t_uint256_fromStack(value0,  add(headStart, 0))

                abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

            }

            function cleanup_from_storage_t_contract$_PuppetPool_$979(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function extract_from_storage_value_offset_0t_contract$_PuppetPool_$979(slot_value) -> value {
                value := cleanup_from_storage_t_contract$_PuppetPool_$979(shift_right_0_unsigned(slot_value))
            }

            function read_from_storage_split_offset_0_t_contract$_PuppetPool_$979(slot) -> value {
                value := extract_from_storage_value_offset_0t_contract$_PuppetPool_$979(sload(slot))

            }

            function convert_t_contract$_PuppetPool_$979_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function abi_encode_tuple_t_address__to_t_address__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

            }

            function abi_decode_tuple__fromMemory(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

            }

            function abi_encode_tuple_t_uint256_t_rational_0_by_1__to_t_uint256_t_uint256__fromStack(headStart , value0, value1) -> tail {
                tail := add(headStart, 64)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

                abi_encode_t_rational_0_by_1_to_t_uint256_fromStack(value1,  add(headStart, 32))

            }

            function store_literal_in_memory_ebda8dab3317e265b4b3e4d71ba99e5a984f41fe2be6fc8df61312e5200e0665(memPtr) {

                mstore(add(memPtr, 0), "synthesize")

            }

            function copy_literal_to_memory_ebda8dab3317e265b4b3e4d71ba99e5a984f41fe2be6fc8df61312e5200e0665() -> memPtr {
                memPtr := allocate_memory_array_t_string_memory_ptr(10)
                store_literal_in_memory_ebda8dab3317e265b4b3e4d71ba99e5a984f41fe2be6fc8df61312e5200e0665(add(memPtr, 32))
            }

            function convert_t_stringliteral_ebda8dab3317e265b4b3e4d71ba99e5a984f41fe2be6fc8df61312e5200e0665_to_t_string_memory_ptr() -> converted {
                converted := copy_literal_to_memory_ebda8dab3317e265b4b3e4d71ba99e5a984f41fe2be6fc8df61312e5200e0665()
            }

            /// @ast-id 80
            /// @src 3:454:787  "function synthesis0() public {..."
            function fun_synthesis0_80() {

                /// @src 3:508:538  "eurus_symbolic_uint256(\"sym0\")"
                let _1_mpos := convert_t_stringliteral_fda3a92554e84fea8dc568bb5df0c00f3ec63fd891725bdc84348b2c7b6486d4_to_t_string_memory_ptr()
                let expr_33 := fun_eurus_symbolic_uint256_311(_1_mpos)
                /// @src 3:493:538  "uint256 sym0 = eurus_symbolic_uint256(\"sym0\")"
                let var_sym0_30 := expr_33
                /// @src 3:548:556  "tgtToken"
                let _2_address := read_from_storage_split_offset_0_t_contract$_ERC20_$236(0x00)
                let expr_35_address := _2_address
                /// @src 3:548:564  "tgtToken.approve"
                let expr_37_address := convert_t_contract$_ERC20_$236_to_t_address(expr_35_address)
                let expr_37_functionSelector := 0x095ea7b3
                /// @src 3:573:580  "uniswap"
                let _3_address := read_from_storage_split_offset_0_t_contract$_UniswapModel_$1143(0x02)
                let expr_40_address := _3_address
                /// @src 3:565:581  "address(uniswap)"
                let expr_41 := convert_t_contract$_UniswapModel_$1143_to_t_address(expr_40_address)
                /// @src 3:583:587  "1000"
                let expr_42 := 0x03e8
                /// @src 3:548:588  "tgtToken.approve(address(uniswap), 1000)"

                // storage for arguments and returned data
                let _4 := allocate_unbounded()
                mstore(_4, shift_left_224(expr_37_functionSelector))
                let _5 := abi_encode_tuple_t_address_t_rational_1000_by_1__to_t_address_t_uint256__fromStack(add(_4, 4) , expr_41, expr_42)

                let _6 := call(gas(), expr_37_address,  0,  _4, sub(_5, _4), _4, 32)

                if iszero(_6) { revert_forward_1() }

                let expr_43
                if _6 {

                    let _7 := 32

                    if gt(_7, returndatasize()) {
                        _7 := returndatasize()
                    }

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_4, _7)

                    // decode return parameters from external try-call into retVars
                    expr_43 :=  abi_decode_tuple_t_bool_fromMemory(_4, add(_4, _7))
                }
                /// @src 3:615:622  "uniswap"
                let _8_address := read_from_storage_split_offset_0_t_contract$_UniswapModel_$1143(0x02)
                let expr_47_address := _8_address
                /// @src 3:615:634  "uniswap.swapDVT4ETH"
                let expr_48_address := convert_t_contract$_UniswapModel_$1143_to_t_address(expr_47_address)
                let expr_48_functionSelector := 0x7aebab27
                /// @src 3:635:636  "0"
                let expr_49 := 0x00
                /// @src 3:638:642  "sym0"
                let _9 := var_sym0_30
                let expr_50 := _9
                /// @src 3:615:643  "uniswap.swapDVT4ETH(0, sym0)"

                // storage for arguments and returned data
                let _10 := allocate_unbounded()
                mstore(_10, shift_left_224(expr_48_functionSelector))
                let _11 := abi_encode_tuple_t_rational_0_by_1_t_uint256__to_t_uint256_t_uint256__fromStack(add(_10, 4) , expr_49, expr_50)

                let _12 := call(gas(), expr_48_address,  0,  _10, sub(_11, _10), _10, 32)

                if iszero(_12) { revert_forward_1() }

                let expr_51
                if _12 {

                    let _13 := 32

                    if gt(_13, returndatasize()) {
                        _13 := returndatasize()
                    }

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_10, _13)

                    // decode return parameters from external try-call into retVars
                    expr_51 :=  abi_decode_tuple_t_uint256_fromMemory(_10, add(_10, _13))
                }
                /// @src 3:598:643  "uint256 newETH = uniswap.swapDVT4ETH(0, sym0)"
                let var_newETH_46 := expr_51
                /// @src 3:653:657  "pool"
                let _14_address := read_from_storage_split_offset_0_t_contract$_PuppetPool_$979(0x03)
                let expr_53_address := _14_address
                /// @src 3:653:664  "pool.borrow"
                let expr_55_address := convert_t_contract$_PuppetPool_$979_to_t_address(expr_53_address)
                let expr_55_functionSelector := 0x0ecbcdab
                /// @src 3:665:673  "tgtToken"
                let _15_address := read_from_storage_split_offset_0_t_contract$_ERC20_$236(0x00)
                let expr_56_address := _15_address
                /// @src 3:665:683  "tgtToken.balanceOf"
                let expr_57_address := convert_t_contract$_ERC20_$236_to_t_address(expr_56_address)
                let expr_57_functionSelector := 0x70a08231
                /// @src 3:692:696  "pool"
                let _16_address := read_from_storage_split_offset_0_t_contract$_PuppetPool_$979(0x03)
                let expr_60_address := _16_address
                /// @src 3:684:697  "address(pool)"
                let expr_61 := convert_t_contract$_PuppetPool_$979_to_t_address(expr_60_address)
                /// @src 3:665:698  "tgtToken.balanceOf(address(pool))"

                // storage for arguments and returned data
                let _17 := allocate_unbounded()
                mstore(_17, shift_left_224(expr_57_functionSelector))
                let _18 := abi_encode_tuple_t_address__to_t_address__fromStack(add(_17, 4) , expr_61)

                let _19 := staticcall(gas(), expr_57_address,  _17, sub(_18, _17), _17, 32)

                if iszero(_19) { revert_forward_1() }

                let expr_62
                if _19 {

                    let _20 := 32

                    if gt(_20, returndatasize()) {
                        _20 := returndatasize()
                    }

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_17, _20)

                    // decode return parameters from external try-call into retVars
                    expr_62 :=  abi_decode_tuple_t_uint256_fromMemory(_17, add(_17, _20))
                }
                /// @src 3:700:701  "0"
                let expr_63 := 0x00
                /// @src 3:653:702  "pool.borrow(tgtToken.balanceOf(address(pool)), 0)"

                if iszero(extcodesize(expr_55_address)) { revert_error_0cc013b6b3b6beabea4e3a74a6d380f0df81852ca99887912475e1f66b2a2c20() }

                // storage for arguments and returned data
                let _21 := allocate_unbounded()
                mstore(_21, shift_left_224(expr_55_functionSelector))
                let _22 := abi_encode_tuple_t_uint256_t_rational_0_by_1__to_t_uint256_t_uint256__fromStack(add(_21, 4) , expr_62, expr_63)

                let _23 := call(gas(), expr_55_address,  0,  _21, sub(_22, _21), _21, 0)

                if iszero(_23) { revert_forward_1() }

                if _23 {

                    let _24 := 0

                    if gt(_24, returndatasize()) {
                        _24 := returndatasize()
                    }

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_21, _24)

                    // decode return parameters from external try-call into retVars
                    abi_decode_tuple__fromMemory(_21, add(_21, _24))
                }
                /// @src 3:743:751  "tgtToken"
                let _25_address := read_from_storage_split_offset_0_t_contract$_ERC20_$236(0x00)
                let expr_68_address := _25_address
                /// @src 3:743:761  "tgtToken.balanceOf"
                let expr_69_address := convert_t_contract$_ERC20_$236_to_t_address(expr_68_address)
                let expr_69_functionSelector := 0x70a08231
                /// @src 3:770:774  "pool"
                let _26_address := read_from_storage_split_offset_0_t_contract$_PuppetPool_$979(0x03)
                let expr_72_address := _26_address
                /// @src 3:762:775  "address(pool)"
                let expr_73 := convert_t_contract$_PuppetPool_$979_to_t_address(expr_72_address)
                /// @src 3:743:776  "tgtToken.balanceOf(address(pool))"

                // storage for arguments and returned data
                let _27 := allocate_unbounded()
                mstore(_27, shift_left_224(expr_69_functionSelector))
                let _28 := abi_encode_tuple_t_address__to_t_address__fromStack(add(_27, 4) , expr_73)

                let _29 := staticcall(gas(), expr_69_address,  _27, sub(_28, _27), _27, 32)

                if iszero(_29) { revert_forward_1() }

                let expr_74
                if _29 {

                    let _30 := 32

                    if gt(_30, returndatasize()) {
                        _30 := returndatasize()
                    }

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_27, _30)

                    // decode return parameters from external try-call into retVars
                    expr_74 :=  abi_decode_tuple_t_uint256_fromMemory(_27, add(_27, _30))
                }
                /// @src 3:778:779  "0"
                let expr_75 := 0x00
                /// @src 3:743:779  "tgtToken.balanceOf(address(pool))==0"
                let expr_76 := eq(cleanup_t_uint256(expr_74), convert_t_rational_0_by_1_to_t_uint256(expr_75))
                /// @src 3:712:780  "eurus_synthesize(\"synthesize\", tgtToken.balanceOf(address(pool))==0)"
                let _31_mpos := convert_t_stringliteral_ebda8dab3317e265b4b3e4d71ba99e5a984f41fe2be6fc8df61312e5200e0665_to_t_string_memory_ptr()
                fun_eurus_synthesize_277(_31_mpos, expr_76)

            }
            /// @src 3:228:790  "contract Synthesis is Harness {..."

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

            /// @ast-id 253
            /// @src 1:126:218  "function eurus_assume(string memory msg, bool cond) public view {..."
            function fun_eurus_assume_253(var_msg_243_mpos, var_cond_245) {

                /// @src 1:207:210  "msg"
                let _32_mpos := var_msg_243_mpos
                let expr_249_mpos := _32_mpos
                /// @src 1:200:211  "revert(msg)"
                {
                    let _33 := allocate_unbounded()
                    mstore(_33, 3963877391197344453575983046348115674221700746820753546331534351508065746944)
                    let _34 := abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack(add(_33, 4) , expr_249_mpos)
                    // adapted by Eurus: hijack_eurus_assume
                    eurus_assume(_33, sub(_34, _33), var_cond_245)
                }
            }
            /// @src 3:228:790  "contract Synthesis is Harness {..."

            /// @ast-id 265
            /// @src 1:224:316  "function eurus_assert(string memory msg, bool cond) public view {..."
            function fun_eurus_assert_265(var_msg_255_mpos, var_cond_257) {

                /// @src 1:305:308  "msg"
                let _35_mpos := var_msg_255_mpos
                let expr_261_mpos := _35_mpos
                /// @src 1:298:309  "revert(msg)"
                {
                    let _36 := allocate_unbounded()
                    mstore(_36, 3963877391197344453575983046348115674221700746820753546331534351508065746944)
                    let _37 := abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack(add(_36, 4) , expr_261_mpos)
                    // adapted by Eurus: hijack_eurus_assert
                    eurus_assert(_36, sub(_37, _36), var_cond_257)
                }
            }
            /// @src 3:228:790  "contract Synthesis is Harness {..."

            /// @ast-id 277
            /// @src 1:322:418  "function eurus_synthesize(string memory msg, bool cond) public view {..."
            function fun_eurus_synthesize_277(var_msg_267_mpos, var_cond_269) {

                /// @src 1:407:410  "msg"
                let _38_mpos := var_msg_267_mpos
                let expr_273_mpos := _38_mpos
                /// @src 1:400:411  "revert(msg)"
                {
                    let _39 := allocate_unbounded()
                    mstore(_39, 3963877391197344453575983046348115674221700746820753546331534351508065746944)
                    let _40 := abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack(add(_39, 4) , expr_273_mpos)
                    // adapted by Eurus: hijack_eurus_synthesize
                    eurus_synthesize(_39, sub(_40, _39), var_cond_269)
                }
            }
            /// @src 3:228:790  "contract Synthesis is Harness {..."

            /// @ast-id 289
            /// @src 1:424:516  "function eurus_attack(string memory msg, bool cond) public view {..."
            function fun_eurus_attack_289(var_msg_279_mpos, var_cond_281) {

                /// @src 1:505:508  "msg"
                let _41_mpos := var_msg_279_mpos
                let expr_285_mpos := _41_mpos
                /// @src 1:498:509  "revert(msg)"
                {
                    let _42 := allocate_unbounded()
                    mstore(_42, 3963877391197344453575983046348115674221700746820753546331534351508065746944)
                    let _43 := abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack(add(_42, 4) , expr_285_mpos)
                    revert(_42, sub(_43, _42))
                }
            }
            /// @src 3:228:790  "contract Synthesis is Harness {..."

            function store_literal_in_memory_046e3b60602e4c9ae035a6752d3453a5f0b8da88167fb304fd5bb28922e092b0(memPtr) {

                mstore(add(memPtr, 0), "eurus_prank_once")

            }

            function abi_encode_t_stringliteral_046e3b60602e4c9ae035a6752d3453a5f0b8da88167fb304fd5bb28922e092b0_to_t_string_memory_ptr_fromStack(pos) -> end {
                pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 16)
                store_literal_in_memory_046e3b60602e4c9ae035a6752d3453a5f0b8da88167fb304fd5bb28922e092b0(pos)
                end := add(pos, 32)
            }

            function abi_encode_tuple_t_stringliteral_046e3b60602e4c9ae035a6752d3453a5f0b8da88167fb304fd5bb28922e092b0__to_t_string_memory_ptr__fromStack(headStart ) -> tail {
                tail := add(headStart, 32)

                mstore(add(headStart, 0), sub(tail, headStart))
                tail := abi_encode_t_stringliteral_046e3b60602e4c9ae035a6752d3453a5f0b8da88167fb304fd5bb28922e092b0_to_t_string_memory_ptr_fromStack( tail)

            }

            /// @ast-id 299
            /// @src 1:522:619  "function eurus_prank_once(address sender) public view {..."
            function fun_eurus_prank_once_299(var_sender_291) {
                    // adapted by Eurus: hijack_eurus_prank_once
                    eurus_prank_once(var_sender_291)
            }
            /// @src 3:228:790  "contract Synthesis is Harness {..."

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

            /// @ast-id 311
            /// @src 1:625:734  "function eurus_symbolic_uint256(string memory id) internal view returns (uint256) {..."
            function fun_eurus_symbolic_uint256_311(var_id_301_mpos) -> var__304 {
                /// @src 1:698:705  "uint256"
                let zero_t_uint256_46 := zero_value_for_split_t_uint256()
                var__304 := zero_t_uint256_46

                /// @src 1:724:726  "id"
                let _47_mpos := var_id_301_mpos
                let expr_307_mpos := _47_mpos
                /// @src 1:717:727  "revert(id)"
                {
                    let _48 := allocate_unbounded()
                    mstore(_48, 3963877391197344453575983046348115674221700746820753546331534351508065746944)
                    let _49 := abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack(add(_48, 4) , expr_307_mpos)
                    // adapted by Eurus: hijack_eurus_symbolic_uintX
                    var__304 := eurus_symbolic_uint256(_48, sub(_49, _48))
                }
            }
            /// @src 3:228:790  "contract Synthesis is Harness {..."

            function convert_t_contract$_Harness_$759_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_stringliteral_b0e31374f71f4e34784b485ee4fb05dde8cb07c4e1bc4b1bdf48f16f779db839_to_t_bytes4() -> converted {
                converted := 0x9e5faafc00000000000000000000000000000000000000000000000000000000
            }

            function array_allocation_size_t_bytes_memory_ptr(length) -> size {
                // Make sure we can allocate memory without overflow
                if gt(length, 0xffffffffffffffff) { panic_error_0x41() }

                size := round_up_to_mul_of_32(length)

                // add length slot
                size := add(size, 0x20)

            }

            function allocate_memory_array_t_bytes_memory_ptr(length) -> memPtr {
                let allocSize := array_allocation_size_t_bytes_memory_ptr(length)
                memPtr := allocate_memory(allocSize)

                mstore(memPtr, length)

            }

            function zero_value_for_split_t_bytes_memory_ptr() -> ret {
                ret := 96
            }

            function extract_returndata() -> data {

                switch returndatasize()
                case 0 {
                    data := zero_value_for_split_t_bytes_memory_ptr()
                }
                default {
                    data := allocate_memory_array_t_bytes_memory_ptr(returndatasize())
                    returndatacopy(add(data, 0x20), 0, returndatasize())
                }

            }

            function store_literal_in_memory_1ae203c7c25f090327d5b0a9fbd3202c54692602f85b7c58f4e4801c980f6ee1(memPtr) {

                mstore(add(memPtr, 0), "msg458")

            }

            function copy_literal_to_memory_1ae203c7c25f090327d5b0a9fbd3202c54692602f85b7c58f4e4801c980f6ee1() -> memPtr {
                memPtr := allocate_memory_array_t_string_memory_ptr(6)
                store_literal_in_memory_1ae203c7c25f090327d5b0a9fbd3202c54692602f85b7c58f4e4801c980f6ee1(add(memPtr, 32))
            }

            function convert_t_stringliteral_1ae203c7c25f090327d5b0a9fbd3202c54692602f85b7c58f4e4801c980f6ee1_to_t_string_memory_ptr() -> converted {
                converted := copy_literal_to_memory_1ae203c7c25f090327d5b0a9fbd3202c54692602f85b7c58f4e4801c980f6ee1()
            }

            /// @ast-id 758
            /// @src 1:3302:3669  "function harness465() public {..."
            function fun_harness465_758() {

                /// @src 1:3357:3358  "0"
                let expr_707 := 0x00
                /// @src 1:3341:3358  "uint256 value = 0"
                let var_value_706 := convert_t_rational_0_by_1_to_t_uint256(expr_707)
                /// @src 1:3393:3397  "this"
                let expr_713_address := address()
                /// @src 1:3385:3398  "address(this)"
                let expr_714 := convert_t_contract$_Harness_$759_to_t_address(expr_713_address)
                /// @src 1:3368:3398  "address sender = address(this)"
                let var_sender_710 := expr_714
                /// @src 1:3416:3417  "0"
                let expr_717 := 0x00
                /// @src 1:3408:3417  "value = 0"
                let _50 := convert_t_rational_0_by_1_to_t_uint256(expr_717)
                var_value_706 := _50
                let expr_718 := _50
                /// @src 1:3444:3450  "sender"
                let _51 := var_sender_710
                let expr_721 := _51
                fun_eurus_prank_once_299(expr_721)
                /// @src 1:3491:3495  "this"
                let expr_728_address := address()
                /// @src 1:3483:3496  "address(this)"
                let expr_729 := convert_t_contract$_Harness_$759_to_t_address(expr_728_address)
                /// @src 1:3483:3501  "address(this).call"
                let expr_730_address := expr_729
                /// @src 1:3502:3539  "abi.encodeWithSelector(hex\"9e5faafc\")"
                let _52 := convert_t_stringliteral_b0e31374f71f4e34784b485ee4fb05dde8cb07c4e1bc4b1bdf48f16f779db839_to_t_bytes4()

                let expr_734_mpos := allocate_unbounded()
                let _53 := add(expr_734_mpos, 0x20)

                mstore(_53, _52)
                _53 := add(_53, 4)

                let _54 := abi_encode_tuple__to__fromStack(_53)
                mstore(expr_734_mpos, sub(_54, add(expr_734_mpos, 0x20)))
                finalize_allocation(expr_734_mpos, sub(_54, expr_734_mpos))
                /// @src 1:3483:3540  "address(this).call(abi.encodeWithSelector(hex\"9e5faafc\"))"

                let _55 := add(expr_734_mpos, 0x20)
                let _56 := mload(expr_734_mpos)

                let expr_735_component_1 := call(gas(), expr_730_address,  0,  _55, _56, 0, 0)
                let expr_735_component_2_mpos := extract_returndata()
                /// @src 1:3461:3540  "(bool success400, ) = address(this).call(abi.encodeWithSelector(hex\"9e5faafc\"))"
                let var_success400_725 := expr_735_component_1
                /// @src 1:3567:3573  "sender"
                let _57 := var_sender_710
                let expr_738 := _57
                fun_eurus_prank_once_299(expr_738)
                /// @src 1:3607:3617  "success400"
                let _58 := var_success400_725
                let expr_743 := _58
                /// @src 1:3607:3661  "success400 && (tgtToken.balanceOf(address(pool)) == 0)"
                let expr_754 := expr_743
                if expr_754 {
                    /// @src 1:3622:3630  "tgtToken"
                    let _59_address := read_from_storage_split_offset_0_t_contract$_ERC20_$236(0x00)
                    let expr_744_address := _59_address
                    /// @src 1:3622:3640  "tgtToken.balanceOf"
                    let expr_745_address := convert_t_contract$_ERC20_$236_to_t_address(expr_744_address)
                    let expr_745_functionSelector := 0x70a08231
                    /// @src 1:3649:3653  "pool"
                    let _60_address := read_from_storage_split_offset_0_t_contract$_PuppetPool_$979(0x03)
                    let expr_748_address := _60_address
                    /// @src 1:3641:3654  "address(pool)"
                    let expr_749 := convert_t_contract$_PuppetPool_$979_to_t_address(expr_748_address)
                    /// @src 1:3622:3655  "tgtToken.balanceOf(address(pool))"

                    // storage for arguments and returned data
                    let _61 := allocate_unbounded()
                    mstore(_61, shift_left_224(expr_745_functionSelector))
                    let _62 := abi_encode_tuple_t_address__to_t_address__fromStack(add(_61, 4) , expr_749)

                    let _63 := staticcall(gas(), expr_745_address,  _61, sub(_62, _61), _61, 32)

                    if iszero(_63) { revert_forward_1() }

                    let expr_750
                    if _63 {

                        let _64 := 32

                        if gt(_64, returndatasize()) {
                            _64 := returndatasize()
                        }

                        // update freeMemoryPointer according to dynamic return size
                        finalize_allocation(_61, _64)

                        // decode return parameters from external try-call into retVars
                        expr_750 :=  abi_decode_tuple_t_uint256_fromMemory(_61, add(_61, _64))
                    }
                    /// @src 1:3659:3660  "0"
                    let expr_751 := 0x00
                    /// @src 1:3622:3660  "tgtToken.balanceOf(address(pool)) == 0"
                    let expr_752 := eq(cleanup_t_uint256(expr_750), convert_t_rational_0_by_1_to_t_uint256(expr_751))
                    /// @src 1:3621:3661  "(tgtToken.balanceOf(address(pool)) == 0)"
                    let expr_753 := expr_752
                    /// @src 1:3607:3661  "success400 && (tgtToken.balanceOf(address(pool)) == 0)"
                    expr_754 := expr_753
                }
                /// @src 1:3584:3662  "eurus_attack(\"msg458\", success400 && (tgtToken.balanceOf(address(pool)) == 0))"
                let _65_mpos := convert_t_stringliteral_1ae203c7c25f090327d5b0a9fbd3202c54692602f85b7c58f4e4801c980f6ee1_to_t_string_memory_ptr()
                fun_eurus_attack_289(_65_mpos, expr_754)

            }
            /// @src 3:228:790  "contract Synthesis is Harness {..."

        }

        
    }

}

