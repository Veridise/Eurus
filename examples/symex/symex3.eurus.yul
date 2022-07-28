
/// @use-src 0:".//Eurus.sol", 1:"symex/symex.sol"
object "symex3_336" {
    code {
        /// @src 1:3396:3600  "contract symex3 is Eurus {..."
        mstore(64, memoryguard(128))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        constructor_symex3_336()

        // adapted by Eurus: remove_post_constructor_datacall
        // let _1 := allocate_unbounded()
        // codecopy(_1, dataoffset("symex3_336_deployed"), datasize("symex3_336_deployed"))
        // return(_1, datasize("symex3_336_deployed"))

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

        function store_literal_in_memory_0370238e56777d5b0b4f1f5451d76923dc1d86426ea4119800cdc2cb4710aad8(memPtr) {

            mstore(add(memPtr, 0), "somevalue")

        }

        function copy_literal_to_memory_0370238e56777d5b0b4f1f5451d76923dc1d86426ea4119800cdc2cb4710aad8() -> memPtr {
            memPtr := allocate_memory_array_t_string_memory_ptr(9)
            store_literal_in_memory_0370238e56777d5b0b4f1f5451d76923dc1d86426ea4119800cdc2cb4710aad8(add(memPtr, 32))
        }

        function convert_t_stringliteral_0370238e56777d5b0b4f1f5451d76923dc1d86426ea4119800cdc2cb4710aad8_to_t_string_memory_ptr() -> converted {
            converted := copy_literal_to_memory_0370238e56777d5b0b4f1f5451d76923dc1d86426ea4119800cdc2cb4710aad8()
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

        function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
            let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
            sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
        }

        /// @ast-id 327
        /// @src 1:3489:3505  "constructor() {}"
        function constructor_symex3_336() {

            /// @src 1:3489:3505  "constructor() {}"
            constructor_Eurus_1291()
            /// @src 1:3447:3482  "eurus_symbolic_uint256(\"somevalue\")"
            let _2_mpos := convert_t_stringliteral_0370238e56777d5b0b4f1f5451d76923dc1d86426ea4119800cdc2cb4710aad8_to_t_string_memory_ptr()
            let expr_322 := fun_eurus_symbolic_uint256_428(_2_mpos)
            update_storage_value_offset_0t_uint256_to_t_uint256(0x00, expr_322)

        }
        /// @src 1:3396:3600  "contract symex3 is Eurus {..."

        /// @ast-id 382
        /// @src 0:80:96  "constructor() {}"
        function constructor_Eurus_1291() {

            /// @src 0:80:96  "constructor() {}"

        }
        /// @src 1:3396:3600  "contract symex3 is Eurus {..."

        function zero_value_for_split_t_uint256() -> ret {
            ret := 0
        }

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
            let zero_t_uint256_3 := zero_value_for_split_t_uint256()
            var__421 := zero_t_uint256_3

            /// @src 0:693:696  "tag"
            let _4_mpos := var_tag_418_mpos
            let expr_424_mpos := _4_mpos
            /// @src 0:686:697  "revert(tag)"
            {
                let _5 := allocate_unbounded()
                mstore(_5, 3963877391197344453575983046348115674221700746820753546331534351508065746944)
                let _6 := abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack(add(_5, 4) , expr_424_mpos)
                // adapted by Eurus: hijack_eurus_symbolic_uintX
                var__421 := eurus_symbolic_uint256(_5, sub(_6, _5))
            }
        }
        /// @src 1:3396:3600  "contract symex3 is Eurus {..."

    }
    /// @use-src 1:"symex/symex.sol"
    object "symex3_336_deployed" {
        code {
            /// @src 1:3396:3600  "contract symex3 is Eurus {..."
            mstore(64, memoryguard(128))

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0xbb9f5a2d
                {
                    // getSomevalue()

                    external_fun_getSomevalue_335()
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

            function cleanup_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple_t_uint256__to_t_uint256__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

            }

            function external_fun_getSomevalue_335() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                let ret_0 :=  fun_getSomevalue_335()
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

            /// @ast-id 335
            /// @src 1:3511:3598  "function getSomevalue() public view returns (uint256) {..."
            function fun_getSomevalue_335() -> var__330 {
                /// @src 1:3556:3563  "uint256"
                let zero_t_uint256_1 := zero_value_for_split_t_uint256()
                var__330 := zero_t_uint256_1

                /// @src 1:3582:3591  "somevalue"
                let _2 := read_from_storage_split_offset_0_t_uint256(0x00)
                let expr_332 := _2
                /// @src 1:3575:3591  "return somevalue"
                var__330 := expr_332
                leave

            }
            /// @src 1:3396:3600  "contract symex3 is Eurus {..."

        }

        
    }

}

