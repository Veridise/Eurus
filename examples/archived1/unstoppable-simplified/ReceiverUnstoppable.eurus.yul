/*=====================================================*
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *=====================================================*/


/// @use-src 0:"examples/unstoppable-simplified/ReceiverUnstoppable.sol"
object "ReceiverUnstoppable_114" {
    code {
        /// @src 0:452:1168  "contract ReceiverUnstoppable {..."
        mstore(64, memoryguard(128))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        let _1 := copy_arguments_for_constructor_62_object_ReceiverUnstoppable_114()
        constructor_ReceiverUnstoppable_114(_1)

        // adapted by Eurus: remove_post_constructor_datacall
        // let _2 := allocate_unbounded()
        // codecopy(_2, dataoffset("ReceiverUnstoppable_114_deployed"), datasize("ReceiverUnstoppable_114_deployed"))
        // return(_2, datasize("ReceiverUnstoppable_114_deployed"))

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

        function copy_arguments_for_constructor_62_object_ReceiverUnstoppable_114() -> ret_param_0 {
            // let programSize := datasize("ReceiverUnstoppable_114")
            // let argSize := sub(codesize(), programSize)
            // let memoryDataOffset := allocate_memory(argSize)
            // codecopy(memoryDataOffset, programSize, argSize)
            // adapted by Eurus: rewrite_constructor_arguments
            let argSize := sub(calldatasize(), 4)
            let memoryDataOffset := allocate_memory(argSize)
            calldatacopy(memoryDataOffset, 4, argSize)

            ret_param_0 := abi_decode_tuple_t_address_fromMemory(memoryDataOffset, add(memoryDataOffset, argSize))
        }

        function identity(value) -> ret {
            ret := value
        }

        function convert_t_uint160_to_t_uint160(value) -> converted {
            converted := cleanup_t_uint160(identity(cleanup_t_uint160(value)))
        }

        function convert_t_uint160_to_t_contract$_ILender_$12(value) -> converted {
            converted := convert_t_uint160_to_t_uint160(value)
        }

        function convert_t_address_to_t_contract$_ILender_$12(value) -> converted {
            converted := convert_t_uint160_to_t_contract$_ILender_$12(value)
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

        function convert_t_contract$_ILender_$12_to_t_contract$_ILender_$12(value) -> converted {
            converted := convert_t_uint160_to_t_contract$_ILender_$12(value)
        }

        function prepare_store_t_contract$_ILender_$12(value) -> ret {
            ret := value
        }

        function update_storage_value_offset_0t_contract$_ILender_$12_to_t_contract$_ILender_$12(slot, value_0) {
            let convertedValue_0 := convert_t_contract$_ILender_$12_to_t_contract$_ILender_$12(value_0)
            sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_contract$_ILender_$12(convertedValue_0)))
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

        /// @ast-id 62
        /// @src 0:542:647  "constructor(address poolAddress) {..."
        function constructor_ReceiverUnstoppable_114(var_poolAddress_47) {

            /// @src 0:542:647  "constructor(address poolAddress) {..."

            /// @src 0:600:611  "poolAddress"
            let _3 := var_poolAddress_47
            let expr_52 := _3
            /// @src 0:592:612  "ILender(poolAddress)"
            let expr_53_address := convert_t_address_to_t_contract$_ILender_$12(expr_52)
            /// @src 0:585:612  "pool = ILender(poolAddress)"
            update_storage_value_offset_0t_contract$_ILender_$12_to_t_contract$_ILender_$12(0x00, expr_53_address)
            let expr_54_address := expr_53_address
            /// @src 0:630:640  "msg.sender"
            let expr_58 := caller()
            /// @src 0:622:640  "owner = msg.sender"
            update_storage_value_offset_0t_address_to_t_address(0x01, expr_58)
            let expr_59 := expr_58

        }
        /// @src 0:452:1168  "contract ReceiverUnstoppable {..."

    }
    /// @use-src 0:"examples/unstoppable-simplified/ReceiverUnstoppable.sol"
    object "ReceiverUnstoppable_114_deployed" {
        code {
            /// @src 0:452:1168  "contract ReceiverUnstoppable {..."
            mstore(64, memoryguard(128))

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x35729130
                {
                    // receiveTokens(address,uint256)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_uint256(4, calldatasize())
                    fun_receiveTokens_93(param_0, param_1)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xfb056f68
                {
                    // executeFlashLoan(uint256)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    fun_executeFlashLoan_113(param_0)
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

            function abi_decode_t_address(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_address(value)
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

            function abi_decode_tuple_t_addresst_uint256(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 32

                    value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function abi_decode_tuple_t_uint256(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74() {
                revert(0, 0)
            }

            function shift_right_0_unsigned(value) -> newValue {
                newValue :=

                shr(0, value)

            }

            function cleanup_from_storage_t_contract$_ILender_$12(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function extract_from_storage_value_offset_0t_contract$_ILender_$12(slot_value) -> value {
                value := cleanup_from_storage_t_contract$_ILender_$12(shift_right_0_unsigned(slot_value))
            }

            function read_from_storage_split_offset_0_t_contract$_ILender_$12(slot) -> value {
                value := extract_from_storage_value_offset_0t_contract$_ILender_$12(sload(slot))

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

            function convert_t_contract$_ILender_$12_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length) -> updated_pos {
                mstore(pos, length)
                updated_pos := add(pos, 0x20)
            }

            function store_literal_in_memory_ee1d184cfe91189aee4630b0f63c035ed74d2951e0f9b3ca16f4acb125fce52d(memPtr) {

                mstore(add(memPtr, 0), "Sender must be pool")

            }

            function abi_encode_t_stringliteral_ee1d184cfe91189aee4630b0f63c035ed74d2951e0f9b3ca16f4acb125fce52d_to_t_string_memory_ptr_fromStack(pos) -> end {
                pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 19)
                store_literal_in_memory_ee1d184cfe91189aee4630b0f63c035ed74d2951e0f9b3ca16f4acb125fce52d(pos)
                end := add(pos, 32)
            }

            function abi_encode_tuple_t_stringliteral_ee1d184cfe91189aee4630b0f63c035ed74d2951e0f9b3ca16f4acb125fce52d__to_t_string_memory_ptr__fromStack(headStart ) -> tail {
                tail := add(headStart, 32)

                mstore(add(headStart, 0), sub(tail, headStart))
                tail := abi_encode_t_stringliteral_ee1d184cfe91189aee4630b0f63c035ed74d2951e0f9b3ca16f4acb125fce52d_to_t_string_memory_ptr_fromStack( tail)

            }

            function require_helper_t_stringliteral_ee1d184cfe91189aee4630b0f63c035ed74d2951e0f9b3ca16f4acb125fce52d(condition ) {
                if iszero(condition) {
                    let memPtr := allocate_unbounded()
                    mstore(memPtr, 0x08c379a000000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple_t_stringliteral_ee1d184cfe91189aee4630b0f63c035ed74d2951e0f9b3ca16f4acb125fce52d__to_t_string_memory_ptr__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function convert_t_uint160_to_t_contract$_IERC20_$40(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_address_to_t_contract$_IERC20_$40(value) -> converted {
                converted := convert_t_uint160_to_t_contract$_IERC20_$40(value)
            }

            function convert_t_contract$_IERC20_$40_to_t_address(value) -> converted {
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

            function abi_encode_t_address_to_t_address_fromStack(value, pos) {
                mstore(pos, cleanup_t_address(value))
            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple_t_address_t_uint256__to_t_address_t_uint256__fromStack(headStart , value0, value1) -> tail {
                tail := add(headStart, 64)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

                abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

            }

            function revert_forward_1() {
                let pos := allocate_unbounded()
                returndatacopy(pos, 0, returndatasize())
                revert(pos, returndatasize())
            }

            function store_literal_in_memory_eafaa33b21cbc57e30fceeeae78e898cf81244c64fe1fa1386a00185f0a5f4ff(memPtr) {

                mstore(add(memPtr, 0), "Transfer of tokens failed")

            }

            function abi_encode_t_stringliteral_eafaa33b21cbc57e30fceeeae78e898cf81244c64fe1fa1386a00185f0a5f4ff_to_t_string_memory_ptr_fromStack(pos) -> end {
                pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 25)
                store_literal_in_memory_eafaa33b21cbc57e30fceeeae78e898cf81244c64fe1fa1386a00185f0a5f4ff(pos)
                end := add(pos, 32)
            }

            function abi_encode_tuple_t_stringliteral_eafaa33b21cbc57e30fceeeae78e898cf81244c64fe1fa1386a00185f0a5f4ff__to_t_string_memory_ptr__fromStack(headStart ) -> tail {
                tail := add(headStart, 32)

                mstore(add(headStart, 0), sub(tail, headStart))
                tail := abi_encode_t_stringliteral_eafaa33b21cbc57e30fceeeae78e898cf81244c64fe1fa1386a00185f0a5f4ff_to_t_string_memory_ptr_fromStack( tail)

            }

            function require_helper_t_stringliteral_eafaa33b21cbc57e30fceeeae78e898cf81244c64fe1fa1386a00185f0a5f4ff(condition ) {
                if iszero(condition) {
                    let memPtr := allocate_unbounded()
                    mstore(memPtr, 0x08c379a000000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple_t_stringliteral_eafaa33b21cbc57e30fceeeae78e898cf81244c64fe1fa1386a00185f0a5f4ff__to_t_string_memory_ptr__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            /// @ast-id 93
            /// @src 0:711:995  "function receiveTokens(address tokenAddress, uint256 amount) external {..."
            function fun_receiveTokens_93(var_tokenAddress_64, var_amount_66) {

                /// @src 0:799:809  "msg.sender"
                let expr_71 := caller()
                /// @src 0:821:825  "pool"
                let _1_address := read_from_storage_split_offset_0_t_contract$_ILender_$12(0x00)
                let expr_74_address := _1_address
                /// @src 0:813:826  "address(pool)"
                let expr_75 := convert_t_contract$_ILender_$12_to_t_address(expr_74_address)
                /// @src 0:799:826  "msg.sender == address(pool)"
                let expr_76 := eq(cleanup_t_address(expr_71), cleanup_t_address(expr_75))
                /// @src 0:791:850  "require(msg.sender == address(pool), \"Sender must be pool\")"
                require_helper_t_stringliteral_ee1d184cfe91189aee4630b0f63c035ed74d2951e0f9b3ca16f4acb125fce52d(expr_76)
                /// @src 0:916:928  "tokenAddress"
                let _2 := var_tokenAddress_64
                let expr_82 := _2
                /// @src 0:909:929  "IERC20(tokenAddress)"
                let expr_83_address := convert_t_address_to_t_contract$_IERC20_$40(expr_82)
                /// @src 0:909:938  "IERC20(tokenAddress).transfer"
                let expr_84_address := convert_t_contract$_IERC20_$40_to_t_address(expr_83_address)
                let expr_84_functionSelector := 0xa9059cbb
                /// @src 0:939:949  "msg.sender"
                let expr_86 := caller()
                /// @src 0:951:957  "amount"
                let _3 := var_amount_66
                let expr_87 := _3
                /// @src 0:909:958  "IERC20(tokenAddress).transfer(msg.sender, amount)"

                // storage for arguments and returned data
                let _4 := allocate_unbounded()
                mstore(_4, shift_left_224(expr_84_functionSelector))
                let _5 := abi_encode_tuple_t_address_t_uint256__to_t_address_t_uint256__fromStack(add(_4, 4) , expr_86, expr_87)

                let _6 := call(gas(), expr_84_address,  0,  _4, sub(_5, _4), _4, 32)

                if iszero(_6) { revert_forward_1() }

                let expr_88
                if _6 {

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_4, returndatasize())

                    // decode return parameters from external try-call into retVars
                    expr_88 :=  abi_decode_tuple_t_bool_fromMemory(_4, add(_4, returndatasize()))
                }
                /// @src 0:901:988  "require(IERC20(tokenAddress).transfer(msg.sender, amount), \"Transfer of tokens failed\")"
                require_helper_t_stringliteral_eafaa33b21cbc57e30fceeeae78e898cf81244c64fe1fa1386a00185f0a5f4ff(expr_88)

            }
            /// @src 0:452:1168  "contract ReceiverUnstoppable {..."

            function cleanup_from_storage_t_address(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function extract_from_storage_value_offset_0t_address(slot_value) -> value {
                value := cleanup_from_storage_t_address(shift_right_0_unsigned(slot_value))
            }

            function read_from_storage_split_offset_0_t_address(slot) -> value {
                value := extract_from_storage_value_offset_0t_address(sload(slot))

            }

            function store_literal_in_memory_7e032a5824877d6f8ae211fd28eff75454845b4077482914237795fec908c5e8(memPtr) {

                mstore(add(memPtr, 0), "Only owner can execute flash loa")

                mstore(add(memPtr, 32), "n")

            }

            function abi_encode_t_stringliteral_7e032a5824877d6f8ae211fd28eff75454845b4077482914237795fec908c5e8_to_t_string_memory_ptr_fromStack(pos) -> end {
                pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 33)
                store_literal_in_memory_7e032a5824877d6f8ae211fd28eff75454845b4077482914237795fec908c5e8(pos)
                end := add(pos, 64)
            }

            function abi_encode_tuple_t_stringliteral_7e032a5824877d6f8ae211fd28eff75454845b4077482914237795fec908c5e8__to_t_string_memory_ptr__fromStack(headStart ) -> tail {
                tail := add(headStart, 32)

                mstore(add(headStart, 0), sub(tail, headStart))
                tail := abi_encode_t_stringliteral_7e032a5824877d6f8ae211fd28eff75454845b4077482914237795fec908c5e8_to_t_string_memory_ptr_fromStack( tail)

            }

            function require_helper_t_stringliteral_7e032a5824877d6f8ae211fd28eff75454845b4077482914237795fec908c5e8(condition ) {
                if iszero(condition) {
                    let memPtr := allocate_unbounded()
                    mstore(memPtr, 0x08c379a000000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple_t_stringliteral_7e032a5824877d6f8ae211fd28eff75454845b4077482914237795fec908c5e8__to_t_string_memory_ptr__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function abi_decode_tuple__fromMemory(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

            }

            function abi_encode_tuple_t_uint256__to_t_uint256__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

            }

            /// @ast-id 113
            /// @src 0:1001:1166  "function executeFlashLoan(uint256 amount) external {..."
            function fun_executeFlashLoan_113(var_amount_95) {

                /// @src 0:1070:1080  "msg.sender"
                let expr_100 := caller()
                /// @src 0:1084:1089  "owner"
                let _7 := read_from_storage_split_offset_0_t_address(0x01)
                let expr_101 := _7
                /// @src 0:1070:1089  "msg.sender == owner"
                let expr_102 := eq(cleanup_t_address(expr_100), cleanup_t_address(expr_101))
                /// @src 0:1062:1127  "require(msg.sender == owner, \"Only owner can execute flash loan\")"
                require_helper_t_stringliteral_7e032a5824877d6f8ae211fd28eff75454845b4077482914237795fec908c5e8(expr_102)
                /// @src 0:1137:1141  "pool"
                let _8_address := read_from_storage_split_offset_0_t_contract$_ILender_$12(0x00)
                let expr_106_address := _8_address
                /// @src 0:1137:1151  "pool.flashLoan"
                let expr_108_address := convert_t_contract$_ILender_$12_to_t_address(expr_106_address)
                let expr_108_functionSelector := 0x9ab603b9
                /// @src 0:1152:1158  "amount"
                let _9 := var_amount_95
                let expr_109 := _9
                /// @src 0:1137:1159  "pool.flashLoan(amount)"

                if iszero(extcodesize(expr_108_address)) { revert_error_0cc013b6b3b6beabea4e3a74a6d380f0df81852ca99887912475e1f66b2a2c20() }

                // storage for arguments and returned data
                let _10 := allocate_unbounded()
                mstore(_10, shift_left_224(expr_108_functionSelector))
                let _11 := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(add(_10, 4) , expr_109)

                let _12 := call(gas(), expr_108_address,  0,  _10, sub(_11, _10), _10, 0)

                if iszero(_12) { revert_forward_1() }

                if _12 {

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_10, returndatasize())

                    // decode return parameters from external try-call into retVars
                    abi_decode_tuple__fromMemory(_10, add(_10, returndatasize()))
                }

            }
            /// @src 0:452:1168  "contract ReceiverUnstoppable {..."

        }

        data ".metadata" hex"a3646970667358221220330d7fa7a2eea341f533c299a44c76935fe0aa5694bd35bae5c7c783a39a8d296c6578706572696d656e74616cf564736f6c634300080b0041"
    }

}

