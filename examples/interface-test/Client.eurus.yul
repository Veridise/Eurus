/*=====================================================*
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *=====================================================*/


/// @use-src 0:"examples/interface-test/Client.sol"
object "Client_42" {
    code {
        /// @src 0:148:430  "contract Client {..."
        mstore(64, memoryguard(128))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        let _1 := copy_arguments_for_constructor_23_object_Client_42()
        constructor_Client_42(_1)

        // adapted by Eurus: remove_post_constructor_datacall
        // let _2 := allocate_unbounded()
        // codecopy(_2, dataoffset("Client_42_deployed"), datasize("Client_42_deployed"))
        // return(_2, datasize("Client_42_deployed"))

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

        function copy_arguments_for_constructor_23_object_Client_42() -> ret_param_0 {
            // let programSize := datasize("Client_42")
            // let argSize := sub(codesize(), programSize)
            // let memoryDataOffset := allocate_memory(argSize)
            // codecopy(memoryDataOffset, programSize, argSize)
            // adapted by Eurus: rewrite_constructor_arguments
            let argSize := sub(calldatasize(), 4)
            let memoryDataOffset := allocate_memory(argSize)
            calldatacopy(memoryDataOffset, 4, argSize)

            ret_param_0 := abi_decode_tuple_t_address_fromMemory(memoryDataOffset, add(memoryDataOffset, argSize))
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

        function identity(value) -> ret {
            ret := value
        }

        function convert_t_uint160_to_t_uint160(value) -> converted {
            converted := cleanup_t_uint160(identity(cleanup_t_uint160(value)))
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

        /// @ast-id 23
        /// @src 0:200:286  "constructor(address _server_address) {..."
        function constructor_Client_42(var__server_address_15) {

            /// @src 0:200:286  "constructor(address _server_address) {..."

            /// @src 0:264:279  "_server_address"
            let _3 := var__server_address_15
            let expr_19 := _3
            /// @src 0:247:279  "server_address = _server_address"
            update_storage_value_offset_0t_address_to_t_address(0x00, expr_19)
            let expr_20 := expr_19

        }
        /// @src 0:148:430  "contract Client {..."

    }
    /// @use-src 0:"examples/interface-test/Client.sol"
    object "Client_42_deployed" {
        code {
            /// @src 0:148:430  "contract Client {..."
            mstore(64, memoryguard(128))

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                eurus_print("selector is", selector)
                switch selector

                case 0x984f23af
                {
                    // call_addition(uint256,uint256)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0, param_1 :=  abi_decode_tuple_t_uint256t_uint256(4, calldatasize())
                    let ret_0 :=  fun_call_addition_41(param_0, param_1)
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

            function revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74() {
                revert(0, 0)
            }

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

            function shift_right_0_unsigned(value) -> newValue {
                newValue :=

                shr(0, value)

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

            function cleanup_t_uint160(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function identity(value) -> ret {
                ret := value
            }

            function convert_t_uint160_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(identity(cleanup_t_uint160(value)))
            }

            function convert_t_uint160_to_t_contract$_IServer_$11(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_address_to_t_contract$_IServer_$11(value) -> converted {
                converted := convert_t_uint160_to_t_contract$_IServer_$11(value)
            }

            function convert_t_uint160_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_contract$_IServer_$11_to_t_address(value) -> converted {
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

            function abi_encode_tuple_t_uint256_t_uint256__to_t_uint256_t_uint256__fromStack(headStart , value0, value1) -> tail {
                tail := add(headStart, 64)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

                abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

            }

            function revert_forward_1() {
                let pos := allocate_unbounded()
                returndatacopy(pos, 0, returndatasize())
                revert(pos, returndatasize())
            }

            /// @ast-id 41
            /// @src 0:296:427  "function call_addition(uint256 a, uint256 b) public returns (uint256) {..."
            function fun_call_addition_41(var_a_25, var_b_27) -> var__30 {
                /// @src 0:357:364  "uint256"
                let zero_t_uint256_1 := zero_value_for_split_t_uint256()
                var__30 := zero_t_uint256_1

                /// @src 0:391:405  "server_address"
                let _2 := read_from_storage_split_offset_0_t_address(0x00)
                let expr_33 := _2
                /// @src 0:383:406  "IServer(server_address)"
                let expr_34_address := convert_t_address_to_t_contract$_IServer_$11(expr_33)
                /// @src 0:383:415  "IServer(server_address).addition"
                let expr_35_address := convert_t_contract$_IServer_$11_to_t_address(expr_34_address)
                eurus_print("address is", expr_35_address)
                let expr_35_functionSelector := 0x54f363a3
                /// @src 0:416:417  "a"
                let _3 := var_a_25
                let expr_36 := _3
                /// @src 0:418:419  "b"
                let _4 := var_b_27
                let expr_37 := _4
                /// @src 0:383:420  "IServer(server_address).addition(a,b)"

                // storage for arguments and returned data
                let _5 := allocate_unbounded()
                mstore(_5, shift_left_224(expr_35_functionSelector))
                let _6 := abi_encode_tuple_t_uint256_t_uint256__to_t_uint256_t_uint256__fromStack(add(_5, 4) , expr_36, expr_37)

                let _7 := call(gas(), expr_35_address,  0,  _5, sub(_6, _5), _5, 32)

                if iszero(_7) { revert_forward_1() }

                let expr_38
                if _7 {

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_5, returndatasize())
                    eurus_print("returndatasize is", returndatasize())
                    eurus_print("returned is", _7)
                    // decode return parameters from external try-call into retVars
                    expr_38 :=  abi_decode_tuple_t_uint256_fromMemory(_5, add(_5, returndatasize()))
                }
                /// @src 0:376:420  "return IServer(server_address).addition(a,b)"
                var__30 := expr_38
                leave

            }
            /// @src 0:148:430  "contract Client {..."

        }

        data ".metadata" hex"a364697066735822122027fc1daf49b796d218e0608bbc64188b67c13cd9cf2811fc69d19d4361d4d6086c6578706572696d656e74616cf564736f6c634300080b0041"
    }

}

