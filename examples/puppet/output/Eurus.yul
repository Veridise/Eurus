
/// @use-src 1:"Harness.sol"
object "Eurus_312" {
    code {
        /// @src 1:105:736  "contract Eurus {..."
        mstore(64, memoryguard(128))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        constructor_Eurus_312()

        let _1 := allocate_unbounded()
        codecopy(_1, dataoffset("Eurus_312_deployed"), datasize("Eurus_312_deployed"))

        return(_1, datasize("Eurus_312_deployed"))

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
            revert(0, 0)
        }

        /// @src 1:105:736  "contract Eurus {..."
        function constructor_Eurus_312() {

            /// @src 1:105:736  "contract Eurus {..."

        }
        /// @src 1:105:736  "contract Eurus {..."

    }
    /// @use-src 1:"Harness.sol"
    object "Eurus_312_deployed" {
        code {
            /// @src 1:105:736  "contract Eurus {..."
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

                case 0x2d26ac43
                {
                    // eurus_assert(string,bool)

                    external_fun_eurus_assert_265()
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

                case 0xe7b2c72d
                {
                    // eurus_prank_once(address)

                    external_fun_eurus_prank_once_299()
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

            function external_fun_eurus_assert_265() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1 :=  abi_decode_tuple_t_string_memory_ptrt_bool(4, calldatasize())
                fun_eurus_assert_265(param_0, param_1)
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
                revert(0, 0)
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

            /// @ast-id 253
            /// @src 1:126:218  "function eurus_assume(string memory msg, bool cond) public view {..."
            function fun_eurus_assume_253(var_msg_243_mpos, var_cond_245) {

                /// @src 1:207:210  "msg"
                let _1_mpos := var_msg_243_mpos
                let expr_249_mpos := _1_mpos
                /// @src 1:200:211  "revert(msg)"
                {
                    let _2 := allocate_unbounded()
                    mstore(_2, 3963877391197344453575983046348115674221700746820753546331534351508065746944)
                    let _3 := abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack(add(_2, 4) , expr_249_mpos)
                    revert(_2, sub(_3, _2))
                }
            }
            /// @src 1:105:736  "contract Eurus {..."

            /// @ast-id 265
            /// @src 1:224:316  "function eurus_assert(string memory msg, bool cond) public view {..."
            function fun_eurus_assert_265(var_msg_255_mpos, var_cond_257) {

                /// @src 1:305:308  "msg"
                let _4_mpos := var_msg_255_mpos
                let expr_261_mpos := _4_mpos
                /// @src 1:298:309  "revert(msg)"
                {
                    let _5 := allocate_unbounded()
                    mstore(_5, 3963877391197344453575983046348115674221700746820753546331534351508065746944)
                    let _6 := abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack(add(_5, 4) , expr_261_mpos)
                    revert(_5, sub(_6, _5))
                }
            }
            /// @src 1:105:736  "contract Eurus {..."

            /// @ast-id 277
            /// @src 1:322:418  "function eurus_synthesize(string memory msg, bool cond) public view {..."
            function fun_eurus_synthesize_277(var_msg_267_mpos, var_cond_269) {

                /// @src 1:407:410  "msg"
                let _7_mpos := var_msg_267_mpos
                let expr_273_mpos := _7_mpos
                /// @src 1:400:411  "revert(msg)"
                {
                    let _8 := allocate_unbounded()
                    mstore(_8, 3963877391197344453575983046348115674221700746820753546331534351508065746944)
                    let _9 := abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack(add(_8, 4) , expr_273_mpos)
                    revert(_8, sub(_9, _8))
                }
            }
            /// @src 1:105:736  "contract Eurus {..."

            /// @ast-id 289
            /// @src 1:424:516  "function eurus_attack(string memory msg, bool cond) public view {..."
            function fun_eurus_attack_289(var_msg_279_mpos, var_cond_281) {

                /// @src 1:505:508  "msg"
                let _10_mpos := var_msg_279_mpos
                let expr_285_mpos := _10_mpos
                /// @src 1:498:509  "revert(msg)"
                {
                    let _11 := allocate_unbounded()
                    mstore(_11, 3963877391197344453575983046348115674221700746820753546331534351508065746944)
                    let _12 := abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack(add(_11, 4) , expr_285_mpos)
                    revert(_11, sub(_12, _11))
                }
            }
            /// @src 1:105:736  "contract Eurus {..."

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

                /// @src 1:586:612  "revert(\"eurus_prank_once\")"
                {
                    let _13 := allocate_unbounded()
                    mstore(_13, 3963877391197344453575983046348115674221700746820753546331534351508065746944)
                    let _14 := abi_encode_tuple_t_stringliteral_046e3b60602e4c9ae035a6752d3453a5f0b8da88167fb304fd5bb28922e092b0__to_t_string_memory_ptr__fromStack(add(_13, 4) )
                    revert(_13, sub(_14, _13))
                }
            }
            /// @src 1:105:736  "contract Eurus {..."

        }

        data ".metadata" hex"a26469706673582212200c68e7c021c2fa49348351a83620ea0170e87d8d70dcb80712e361c57be6627c64736f6c634300080e0033"
    }

}

