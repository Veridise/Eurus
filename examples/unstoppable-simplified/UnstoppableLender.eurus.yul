/*=====================================================*
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *=====================================================*/


/// @use-src 0:"examples/unstoppable-simplified/UnstoppableLender.sol"
object "UnstoppableLender_132" {
    code {
        /// @src 0:421:1933  "contract UnstoppableLender {..."
        mstore(64, memoryguard(128))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        let _1 := copy_arguments_for_constructor_64_object_UnstoppableLender_132()
        constructor_UnstoppableLender_132(_1)

        // adapted by Eurus: remove_post_constructor_datacall
        // let _2 := allocate_unbounded()
        // codecopy(_2, dataoffset("UnstoppableLender_132_deployed"), datasize("UnstoppableLender_132_deployed"))
        // return(_2, datasize("UnstoppableLender_132_deployed"))

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

        function cleanup_t_uint160(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function cleanup_t_address(value) -> cleaned {
            cleaned := cleanup_t_uint160(value)
        }

        function validator_revert_t_address(value) {
            if iszero(eq(value, cleanup_t_address(value))) { revert(0, 0) }
        }

        function abi_decode_t_address_fromMemory(offset, end) -> value {
            value := mload(offset)
            validator_revert_t_address(value)
        }

        function abi_decode_tuple_t_address_fromMemory(headStart, dataEnd) -> value0 {
            if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

            {

                let offset := 0

                value0 := abi_decode_t_address_fromMemory(add(headStart, offset), dataEnd)
            }

        }

        function copy_arguments_for_constructor_64_object_UnstoppableLender_132() -> ret_param_0 {
            // let programSize := datasize("UnstoppableLender_132")
            // let argSize := sub(codesize(), programSize)
            // let memoryDataOffset := allocate_memory(argSize)
            // codecopy(memoryDataOffset, programSize, argSize)
            // adapted by Eurus: rewrite_constructor_arguments
            let argSize := sub(calldatasize(), 4)
            let memoryDataOffset := allocate_memory(argSize)
            calldatacopy(memoryDataOffset, 4, argSize)

            ret_param_0 := abi_decode_tuple_t_address_fromMemory(memoryDataOffset, add(memoryDataOffset, argSize))
        }

        function cleanup_t_rational_0_by_1(value) -> cleaned {
            cleaned := value
        }

        function identity(value) -> ret {
            ret := value
        }

        function convert_t_rational_0_by_1_to_t_uint160(value) -> converted {
            converted := cleanup_t_uint160(identity(cleanup_t_rational_0_by_1(value)))
        }

        function convert_t_rational_0_by_1_to_t_address(value) -> converted {
            converted := convert_t_rational_0_by_1_to_t_uint160(value)
        }

        function array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length) -> updated_pos {
            mstore(pos, length)
            updated_pos := add(pos, 0x20)
        }

        function store_literal_in_memory_b97bd570dfa893d59e1d678b816146ae67b2a118c113568426b5f20389e7d682(memPtr) {

            mstore(add(memPtr, 0), "Token address cannot be zero")

        }

        function abi_encode_t_stringliteral_b97bd570dfa893d59e1d678b816146ae67b2a118c113568426b5f20389e7d682_to_t_string_memory_ptr_fromStack(pos) -> end {
            pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 28)
            store_literal_in_memory_b97bd570dfa893d59e1d678b816146ae67b2a118c113568426b5f20389e7d682(pos)
            end := add(pos, 32)
        }

        function abi_encode_tuple_t_stringliteral_b97bd570dfa893d59e1d678b816146ae67b2a118c113568426b5f20389e7d682__to_t_string_memory_ptr__fromStack(headStart ) -> tail {
            tail := add(headStart, 32)

            mstore(add(headStart, 0), sub(tail, headStart))
            tail := abi_encode_t_stringliteral_b97bd570dfa893d59e1d678b816146ae67b2a118c113568426b5f20389e7d682_to_t_string_memory_ptr_fromStack( tail)

        }

        function require_helper_t_stringliteral_b97bd570dfa893d59e1d678b816146ae67b2a118c113568426b5f20389e7d682(condition ) {
            if iszero(condition) {
                let memPtr := allocate_unbounded()
                mstore(memPtr, 0x08c379a000000000000000000000000000000000000000000000000000000000)
                let end := abi_encode_tuple_t_stringliteral_b97bd570dfa893d59e1d678b816146ae67b2a118c113568426b5f20389e7d682__to_t_string_memory_ptr__fromStack(add(memPtr, 4) )
                revert(memPtr, sub(end, memPtr))
            }
        }

        function convert_t_uint160_to_t_uint160(value) -> converted {
            converted := cleanup_t_uint160(identity(cleanup_t_uint160(value)))
        }

        function convert_t_uint160_to_t_contract$_IERC20_$37(value) -> converted {
            converted := convert_t_uint160_to_t_uint160(value)
        }

        function convert_t_address_to_t_contract$_IERC20_$37(value) -> converted {
            converted := convert_t_uint160_to_t_contract$_IERC20_$37(value)
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

        function convert_t_contract$_IERC20_$37_to_t_contract$_IERC20_$37(value) -> converted {
            converted := convert_t_uint160_to_t_contract$_IERC20_$37(value)
        }

        function prepare_store_t_contract$_IERC20_$37(value) -> ret {
            ret := value
        }

        function update_storage_value_offset_0t_contract$_IERC20_$37_to_t_contract$_IERC20_$37(slot, value_0) {
            let convertedValue_0 := convert_t_contract$_IERC20_$37_to_t_contract$_IERC20_$37(value_0)
            sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_contract$_IERC20_$37(convertedValue_0)))
        }

        /// @ast-id 64
        /// @src 0:525:693  "constructor(address tokenAddress) {..."
        function constructor_UnstoppableLender_132(var_tokenAddress_44) {

            /// @src 0:525:693  "constructor(address tokenAddress) {..."

            /// @src 0:577:589  "tokenAddress"
            let _3 := var_tokenAddress_44
            let expr_48 := _3
            /// @src 0:601:602  "0"
            let expr_51 := 0x00
            /// @src 0:593:603  "address(0)"
            let expr_52 := convert_t_rational_0_by_1_to_t_address(expr_51)
            /// @src 0:577:603  "tokenAddress != address(0)"
            let expr_53 := iszero(eq(cleanup_t_address(expr_48), cleanup_t_address(expr_52)))
            /// @src 0:569:636  "require(tokenAddress != address(0), \"Token address cannot be zero\")"
            require_helper_t_stringliteral_b97bd570dfa893d59e1d678b816146ae67b2a118c113568426b5f20389e7d682(expr_53)
            /// @src 0:673:685  "tokenAddress"
            let _4 := var_tokenAddress_44
            let expr_59 := _4
            /// @src 0:666:686  "IERC20(tokenAddress)"
            let expr_60_address := convert_t_address_to_t_contract$_IERC20_$37(expr_59)
            /// @src 0:646:686  "damnValuableToken = IERC20(tokenAddress)"
            update_storage_value_offset_0t_contract$_IERC20_$37_to_t_contract$_IERC20_$37(0x00, expr_60_address)
            let expr_61_address := expr_60_address

        }
        /// @src 0:421:1933  "contract UnstoppableLender {..."

    }
    /// @use-src 0:"examples/unstoppable-simplified/UnstoppableLender.sol"
    object "UnstoppableLender_132_deployed" {
        code {
            /// @src 0:421:1933  "contract UnstoppableLender {..."
            mstore(64, memoryguard(128))

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x154c5b0b
                {
                    // damnValuableToken()

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_damnValuableToken_40()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_contract$_IERC20_$37__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x96365d44
                {
                    // poolBalance()

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_poolBalance_42()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x9ab603b9
                {
                    // flashLoan(uint256)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    fun_flashLoan_131(param_0)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xdd49756e
                {
                    // depositTokens(uint256)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    fun_depositTokens_95(param_0)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
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

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

            }

            function shift_right_unsigned_dynamic(bits, value) -> newValue {
                newValue :=

                shr(bits, value)

            }

            function cleanup_from_storage_t_contract$_IERC20_$37(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function extract_from_storage_value_dynamict_contract$_IERC20_$37(slot_value, offset) -> value {
                value := cleanup_from_storage_t_contract$_IERC20_$37(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function read_from_storage_split_dynamic_t_contract$_IERC20_$37(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_contract$_IERC20_$37(sload(slot), offset)

            }

            /// @ast-id 40
            /// @src 0:455:486  "IERC20 public damnValuableToken"
            function getter_fun_damnValuableToken_40() -> ret_address {

                let slot := 0
                let offset := 0

                ret_address := read_from_storage_split_dynamic_t_contract$_IERC20_$37(slot, offset)

            }
            /// @src 0:421:1933  "contract UnstoppableLender {..."

            function cleanup_t_uint160(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
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

            function convert_t_contract$_IERC20_$37_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function abi_encode_t_contract$_IERC20_$37_to_t_address_fromStack(value, pos) {
                mstore(pos, convert_t_contract$_IERC20_$37_to_t_address(value))
            }

            function abi_encode_tuple_t_contract$_IERC20_$37__to_t_address__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_contract$_IERC20_$37_to_t_address_fromStack(value0,  add(headStart, 0))

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

            /// @ast-id 42
            /// @src 0:492:518  "uint256 public poolBalance"
            function getter_fun_poolBalance_42() -> ret {

                let slot := 1
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }
            /// @src 0:421:1933  "contract UnstoppableLender {..."

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

            function revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() {
                revert(0, 0)
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

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74() {
                revert(0, 0)
            }

            function cleanup_t_rational_0_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_0_by_1(value)))
            }

            function array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length) -> updated_pos {
                mstore(pos, length)
                updated_pos := add(pos, 0x20)
            }

            function store_literal_in_memory_aa87c016cf98cdabaa30d5b036c2b2bee3950358cbe39911b3fd97397c5e5bd8(memPtr) {

                mstore(add(memPtr, 0), "Must deposit at least one token")

            }

            function abi_encode_t_stringliteral_aa87c016cf98cdabaa30d5b036c2b2bee3950358cbe39911b3fd97397c5e5bd8_to_t_string_memory_ptr_fromStack(pos) -> end {
                pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 31)
                store_literal_in_memory_aa87c016cf98cdabaa30d5b036c2b2bee3950358cbe39911b3fd97397c5e5bd8(pos)
                end := add(pos, 32)
            }

            function abi_encode_tuple_t_stringliteral_aa87c016cf98cdabaa30d5b036c2b2bee3950358cbe39911b3fd97397c5e5bd8__to_t_string_memory_ptr__fromStack(headStart ) -> tail {
                tail := add(headStart, 32)

                mstore(add(headStart, 0), sub(tail, headStart))
                tail := abi_encode_t_stringliteral_aa87c016cf98cdabaa30d5b036c2b2bee3950358cbe39911b3fd97397c5e5bd8_to_t_string_memory_ptr_fromStack( tail)

            }

            function require_helper_t_stringliteral_aa87c016cf98cdabaa30d5b036c2b2bee3950358cbe39911b3fd97397c5e5bd8(condition ) {
                if iszero(condition) {
                    let memPtr := allocate_unbounded()
                    mstore(memPtr, 0x08c379a000000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple_t_stringliteral_aa87c016cf98cdabaa30d5b036c2b2bee3950358cbe39911b3fd97397c5e5bd8__to_t_string_memory_ptr__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function shift_right_0_unsigned(value) -> newValue {
                newValue :=

                shr(0, value)

            }

            function extract_from_storage_value_offset_0t_contract$_IERC20_$37(slot_value) -> value {
                value := cleanup_from_storage_t_contract$_IERC20_$37(shift_right_0_unsigned(slot_value))
            }

            function read_from_storage_split_offset_0_t_contract$_IERC20_$37(slot) -> value {
                value := extract_from_storage_value_offset_0t_contract$_IERC20_$37(sload(slot))

            }

            function convert_t_contract$_UnstoppableLender_$132_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
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

            function cleanup_t_bool(value) -> cleaned {
                cleaned := iszero(iszero(value))
            }

            function validator_revert_t_bool(value) {
                if iszero(eq(value, cleanup_t_bool(value))) { revert(0, 0) }
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

            function cleanup_t_address(value) -> cleaned {
                cleaned := cleanup_t_uint160(value)
            }

            function abi_encode_t_address_to_t_address_fromStack(value, pos) {
                mstore(pos, cleanup_t_address(value))
            }

            function abi_encode_tuple_t_address_t_address_t_uint256__to_t_address_t_address_t_uint256__fromStack(headStart , value0, value1, value2) -> tail {
                tail := add(headStart, 96)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

                abi_encode_t_address_to_t_address_fromStack(value1,  add(headStart, 32))

                abi_encode_t_uint256_to_t_uint256_fromStack(value2,  add(headStart, 64))

            }

            function revert_forward_1() {
                let pos := allocate_unbounded()
                returndatacopy(pos, 0, returndatasize())
                revert(pos, returndatasize())
            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function read_from_storage_split_offset_0_t_uint256(slot) -> value {
                value := extract_from_storage_value_offset_0t_uint256(sload(slot))

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

            /// @ast-id 95
            /// @src 0:699:1014  "function depositTokens(uint256 amount) external {..."
            function fun_depositTokens_95(var_amount_66) {

                /// @src 0:765:771  "amount"
                let _1 := var_amount_66
                let expr_70 := _1
                /// @src 0:774:775  "0"
                let expr_71 := 0x00
                /// @src 0:765:775  "amount > 0"
                let expr_72 := gt(cleanup_t_uint256(expr_70), convert_t_rational_0_by_1_to_t_uint256(expr_71))
                /// @src 0:757:811  "require(amount > 0, \"Must deposit at least one token\")"
                require_helper_t_stringliteral_aa87c016cf98cdabaa30d5b036c2b2bee3950358cbe39911b3fd97397c5e5bd8(expr_72)
                /// @src 0:898:915  "damnValuableToken"
                let _2_address := read_from_storage_split_offset_0_t_contract$_IERC20_$37(0x00)
                let expr_76_address := _2_address
                /// @src 0:898:928  "damnValuableToken.transferFrom"
                let expr_78_address := convert_t_contract$_IERC20_$37_to_t_address(expr_76_address)
                let expr_78_functionSelector := 0x23b872dd
                /// @src 0:929:939  "msg.sender"
                let expr_80 := caller()
                /// @src 0:949:953  "this"
                let expr_83_address := address()
                /// @src 0:941:954  "address(this)"
                let expr_84 := convert_t_contract$_UnstoppableLender_$132_to_t_address(expr_83_address)
                /// @src 0:956:962  "amount"
                let _3 := var_amount_66
                let expr_85 := _3
                /// @src 0:898:963  "damnValuableToken.transferFrom(msg.sender, address(this), amount)"

                // storage for arguments and returned data
                let _4 := allocate_unbounded()
                mstore(_4, shift_left_224(expr_78_functionSelector))
                let _5 := abi_encode_tuple_t_address_t_address_t_uint256__to_t_address_t_address_t_uint256__fromStack(add(_4, 4) , expr_80, expr_84, expr_85)

                let _6 := call(gas(), expr_78_address,  0,  _4, sub(_5, _4), _4, 32)

                if iszero(_6) { revert_forward_1() }

                let expr_86
                if _6 {

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_4, returndatasize())

                    // decode return parameters from external try-call into retVars
                    expr_86 :=  abi_decode_tuple_t_bool_fromMemory(_4, add(_4, returndatasize()))
                }
                /// @src 0:987:998  "poolBalance"
                let _7 := read_from_storage_split_offset_0_t_uint256(0x01)
                let expr_89 := _7
                /// @src 0:1001:1007  "amount"
                let _8 := var_amount_66
                let expr_90 := _8
                /// @src 0:987:1007  "poolBalance + amount"
                let expr_91 := checked_add_t_uint256(expr_89, expr_90)

                /// @src 0:973:1007  "poolBalance = poolBalance + amount"
                update_storage_value_offset_0t_uint256_to_t_uint256(0x01, expr_91)
                let expr_92 := expr_91

            }
            /// @src 0:421:1933  "contract UnstoppableLender {..."

            function store_literal_in_memory_25877daa4ace7b12af56620aa7f11fa3aa0cb0ec7cbaf6c7ea4626167da2dfe0(memPtr) {

                mstore(add(memPtr, 0), "Must borrow at least one token")

            }

            function abi_encode_t_stringliteral_25877daa4ace7b12af56620aa7f11fa3aa0cb0ec7cbaf6c7ea4626167da2dfe0_to_t_string_memory_ptr_fromStack(pos) -> end {
                pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 30)
                store_literal_in_memory_25877daa4ace7b12af56620aa7f11fa3aa0cb0ec7cbaf6c7ea4626167da2dfe0(pos)
                end := add(pos, 32)
            }

            function abi_encode_tuple_t_stringliteral_25877daa4ace7b12af56620aa7f11fa3aa0cb0ec7cbaf6c7ea4626167da2dfe0__to_t_string_memory_ptr__fromStack(headStart ) -> tail {
                tail := add(headStart, 32)

                mstore(add(headStart, 0), sub(tail, headStart))
                tail := abi_encode_t_stringliteral_25877daa4ace7b12af56620aa7f11fa3aa0cb0ec7cbaf6c7ea4626167da2dfe0_to_t_string_memory_ptr_fromStack( tail)

            }

            function require_helper_t_stringliteral_25877daa4ace7b12af56620aa7f11fa3aa0cb0ec7cbaf6c7ea4626167da2dfe0(condition ) {
                if iszero(condition) {
                    let memPtr := allocate_unbounded()
                    mstore(memPtr, 0x08c379a000000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple_t_stringliteral_25877daa4ace7b12af56620aa7f11fa3aa0cb0ec7cbaf6c7ea4626167da2dfe0__to_t_string_memory_ptr__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
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

            function abi_encode_tuple_t_address__to_t_address__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

            }

            function store_literal_in_memory_b72faba0f3ce88ebe3c1e74158cb85235f15025c6f49bcf2ffc16e426ffab345(memPtr) {

                mstore(add(memPtr, 0), "Not enough tokens in pool")

            }

            function abi_encode_t_stringliteral_b72faba0f3ce88ebe3c1e74158cb85235f15025c6f49bcf2ffc16e426ffab345_to_t_string_memory_ptr_fromStack(pos) -> end {
                pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 25)
                store_literal_in_memory_b72faba0f3ce88ebe3c1e74158cb85235f15025c6f49bcf2ffc16e426ffab345(pos)
                end := add(pos, 32)
            }

            function abi_encode_tuple_t_stringliteral_b72faba0f3ce88ebe3c1e74158cb85235f15025c6f49bcf2ffc16e426ffab345__to_t_string_memory_ptr__fromStack(headStart ) -> tail {
                tail := add(headStart, 32)

                mstore(add(headStart, 0), sub(tail, headStart))
                tail := abi_encode_t_stringliteral_b72faba0f3ce88ebe3c1e74158cb85235f15025c6f49bcf2ffc16e426ffab345_to_t_string_memory_ptr_fromStack( tail)

            }

            function require_helper_t_stringliteral_b72faba0f3ce88ebe3c1e74158cb85235f15025c6f49bcf2ffc16e426ffab345(condition ) {
                if iszero(condition) {
                    let memPtr := allocate_unbounded()
                    mstore(memPtr, 0x08c379a000000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple_t_stringliteral_b72faba0f3ce88ebe3c1e74158cb85235f15025c6f49bcf2ffc16e426ffab345__to_t_string_memory_ptr__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function panic_error_0x01() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x01)
                revert(0, 0x24)
            }

            function assert_helper(condition) {
                if iszero(condition) { panic_error_0x01() }
            }

            /// @ast-id 131
            /// @src 0:1020:1931  "function flashLoan(uint256 borrowAmount) external {..."
            function fun_flashLoan_131(var_borrowAmount_97) {

                /// @src 0:1088:1100  "borrowAmount"
                let _9 := var_borrowAmount_97
                let expr_101 := _9
                /// @src 0:1103:1104  "0"
                let expr_102 := 0x00
                /// @src 0:1088:1104  "borrowAmount > 0"
                let expr_103 := gt(cleanup_t_uint256(expr_101), convert_t_rational_0_by_1_to_t_uint256(expr_102))
                /// @src 0:1080:1139  "require(borrowAmount > 0, \"Must borrow at least one token\")"
                require_helper_t_stringliteral_25877daa4ace7b12af56620aa7f11fa3aa0cb0ec7cbaf6c7ea4626167da2dfe0(expr_103)
                /// @src 0:1174:1191  "damnValuableToken"
                let _10_address := read_from_storage_split_offset_0_t_contract$_IERC20_$37(0x00)
                let expr_109_address := _10_address
                /// @src 0:1174:1201  "damnValuableToken.balanceOf"
                let expr_110_address := convert_t_contract$_IERC20_$37_to_t_address(expr_109_address)
                let expr_110_functionSelector := 0x70a08231
                /// @src 0:1210:1214  "this"
                let expr_113_address := address()
                /// @src 0:1202:1215  "address(this)"
                let expr_114 := convert_t_contract$_UnstoppableLender_$132_to_t_address(expr_113_address)
                /// @src 0:1174:1216  "damnValuableToken.balanceOf(address(this))"

                // storage for arguments and returned data
                let _11 := allocate_unbounded()
                mstore(_11, shift_left_224(expr_110_functionSelector))
                let _12 := abi_encode_tuple_t_address__to_t_address__fromStack(add(_11, 4) , expr_114)

                let _13 := staticcall(gas(), expr_110_address,  _11, sub(_12, _11), _11, 32)

                if iszero(_13) { revert_forward_1() }

                let expr_115
                if _13 {

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_11, returndatasize())

                    // decode return parameters from external try-call into retVars
                    expr_115 :=  abi_decode_tuple_t_uint256_fromMemory(_11, add(_11, returndatasize()))
                }
                /// @src 0:1150:1216  "uint256 balanceBefore = damnValuableToken.balanceOf(address(this))"
                let var_balanceBefore_108 := expr_115
                /// @src 0:1234:1247  "balanceBefore"
                let _14 := var_balanceBefore_108
                let expr_118 := _14
                /// @src 0:1251:1263  "borrowAmount"
                let _15 := var_borrowAmount_97
                let expr_119 := _15
                /// @src 0:1234:1263  "balanceBefore >= borrowAmount"
                let expr_120 := iszero(lt(cleanup_t_uint256(expr_118), cleanup_t_uint256(expr_119)))
                /// @src 0:1226:1293  "require(balanceBefore >= borrowAmount, \"Not enough tokens in pool\")"
                require_helper_t_stringliteral_b72faba0f3ce88ebe3c1e74158cb85235f15025c6f49bcf2ffc16e426ffab345(expr_120)
                /// @src 0:1379:1390  "poolBalance"
                let _16 := read_from_storage_split_offset_0_t_uint256(0x01)
                let expr_125 := _16
                /// @src 0:1394:1407  "balanceBefore"
                let _17 := var_balanceBefore_108
                let expr_126 := _17
                /// @src 0:1379:1407  "poolBalance == balanceBefore"
                let expr_127 := eq(cleanup_t_uint256(expr_125), cleanup_t_uint256(expr_126))
                /// @src 0:1372:1408  "assert(poolBalance == balanceBefore)"
                assert_helper(expr_127)

            }
            /// @src 0:421:1933  "contract UnstoppableLender {..."

        }

        data ".metadata" hex"a3646970667358221220a6bfa3d3b8832137b68d3269caf00ec5bd91a108a58cecc37ee4e8dd2ac310446c6578706572696d656e74616cf564736f6c634300080b0041"
    }

}

