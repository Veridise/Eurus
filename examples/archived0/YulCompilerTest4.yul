/*=====================================================*
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *=====================================================*/


/// @use-src 1:"tests/YulCompilerTest4.sol"
object "YulCompilerTest4_60" {
    code {
        /// @src 1:245:560  "contract YulCompilerTest4 {..."
        mstore(64, memoryguard(128))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        let _1 := copy_arguments_for_constructor_43_object_YulCompilerTest4_60()
        constructor_YulCompilerTest4_60(_1)

        let _2 := allocate_unbounded()
        codecopy(_2, dataoffset("YulCompilerTest4_60_deployed"), datasize("YulCompilerTest4_60_deployed"))

        return(_2, datasize("YulCompilerTest4_60_deployed"))

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

        function copy_arguments_for_constructor_43_object_YulCompilerTest4_60() -> ret_param_0 {
            let programSize := datasize("YulCompilerTest4_60")
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

        function abi_encode_tuple__to__fromStack(headStart ) -> tail {
            tail := add(headStart, 0)

        }

        function revert_forward_1() {
            let pos := allocate_unbounded()
            returndatacopy(pos, 0, returndatasize())
            revert(pos, returndatasize())
        }

        function update_byte_slice_20_shift_0(value, toInsert) -> result {
            let mask := 0xffffffffffffffffffffffffffffffffffffffff
            toInsert := shift_left_0(toInsert)
            value := and(value, not(mask))
            result := or(value, and(toInsert, mask))
        }

        function cleanup_t_uint160(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function convert_t_uint160_to_t_uint160(value) -> converted {
            converted := cleanup_t_uint160(identity(cleanup_t_uint160(value)))
        }

        function convert_t_uint160_to_t_contract$_HelperContract_$21(value) -> converted {
            converted := convert_t_uint160_to_t_uint160(value)
        }

        function convert_t_contract$_HelperContract_$21_to_t_contract$_HelperContract_$21(value) -> converted {
            converted := convert_t_uint160_to_t_contract$_HelperContract_$21(value)
        }

        function prepare_store_t_contract$_HelperContract_$21(value) -> ret {
            ret := value
        }

        function update_storage_value_offset_0t_contract$_HelperContract_$21_to_t_contract$_HelperContract_$21(slot, value_0) {
            let convertedValue_0 := convert_t_contract$_HelperContract_$21_to_t_contract$_HelperContract_$21(value_0)
            sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_contract$_HelperContract_$21(convertedValue_0)))
        }

        /// @ast-id 43
        /// @src 1:338:433  "constructor(uint256 para0) {..."
        function constructor_YulCompilerTest4_60(var_para0_28) {

            /// @src 1:338:433  "constructor(uint256 para0) {..."

            /// @src 1:382:387  "para0"
            let _3 := var_para0_28
            let expr_32 := _3
            /// @src 1:375:387  "var0 = para0"
            update_storage_value_offset_0t_uint256_to_t_uint256(0x00, expr_32)
            let expr_33 := expr_32
            /// @src 1:406:426  "new HelperContract()"
            let _4 := allocate_unbounded()
            let _5 := add(_4, datasize("HelperContract_21"))
            if or(gt(_5, 0xffffffffffffffff), lt(_5, _4)) { panic_error_0x41() }
            datacopy(_4, dataoffset("HelperContract_21"), datasize("HelperContract_21"))
            _5 := abi_encode_tuple__to__fromStack(_5)

            let expr_39_address := create(0, _4, sub(_5, _4))

            if iszero(expr_39_address) { revert_forward_1() }

            /// @src 1:397:426  "helper = new HelperContract()"
            update_storage_value_offset_0t_contract$_HelperContract_$21_to_t_contract$_HelperContract_$21(0x01, expr_39_address)
            let expr_40_address := expr_39_address

        }
        /// @src 1:245:560  "contract YulCompilerTest4 {..."

    }
    /// @use-src 1:"tests/YulCompilerTest4.sol"
    object "YulCompilerTest4_60_deployed" {
        code {
            /// @src 1:245:560  "contract YulCompilerTest4 {..."
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
                    let ret_0 :=  fun_addition_59(param_0, param_1)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x63b0e66a
                {
                    // helper()

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_helper_26()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_contract$_HelperContract_$21__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xb8e983f8
                {
                    // var0()

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_var0_23()
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

            function cleanup_from_storage_t_contract$_HelperContract_$21(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function extract_from_storage_value_dynamict_contract$_HelperContract_$21(slot_value, offset) -> value {
                value := cleanup_from_storage_t_contract$_HelperContract_$21(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function read_from_storage_split_dynamic_t_contract$_HelperContract_$21(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_contract$_HelperContract_$21(sload(slot), offset)

            }

            /// @ast-id 26
            /// @src 1:303:331  "HelperContract public helper"
            function getter_fun_helper_26() -> ret_address {

                let slot := 1
                let offset := 0

                ret_address := read_from_storage_split_dynamic_t_contract$_HelperContract_$21(slot, offset)

            }
            /// @src 1:245:560  "contract YulCompilerTest4 {..."

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

            function convert_t_contract$_HelperContract_$21_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function abi_encode_t_contract$_HelperContract_$21_to_t_address_fromStack(value, pos) {
                mstore(pos, convert_t_contract$_HelperContract_$21_to_t_address(value))
            }

            function abi_encode_tuple_t_contract$_HelperContract_$21__to_t_address__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_contract$_HelperContract_$21_to_t_address_fromStack(value0,  add(headStart, 0))

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

            /// @ast-id 23
            /// @src 1:278:297  "uint256 public var0"
            function getter_fun_var0_23() -> ret {

                let slot := 0
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }
            /// @src 1:245:560  "contract YulCompilerTest4 {..."

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

            function extract_from_storage_value_offset_0t_contract$_HelperContract_$21(slot_value) -> value {
                value := cleanup_from_storage_t_contract$_HelperContract_$21(shift_right_0_unsigned(slot_value))
            }

            function read_from_storage_split_offset_0_t_contract$_HelperContract_$21(slot) -> value {
                value := extract_from_storage_value_offset_0t_contract$_HelperContract_$21(sload(slot))

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

            /// @ast-id 59
            /// @src 1:443:557  "function addition(uint256 a, uint256 b) public view returns (uint256) {..."
            function fun_addition_59(var_a_45, var_b_47) -> var__50 {
                /// @src 1:504:511  "uint256"
                let zero_t_uint256_1 := zero_value_for_split_t_uint256()
                var__50 := zero_t_uint256_1

                /// @src 1:530:536  "helper"
                let _2_address := read_from_storage_split_offset_0_t_contract$_HelperContract_$21(0x01)
                let expr_52_address := _2_address
                /// @src 1:530:545  "helper.addition"
                let expr_53_address := convert_t_contract$_HelperContract_$21_to_t_address(expr_52_address)
                let expr_53_functionSelector := 0x54f363a3
                /// @src 1:546:547  "a"
                let _3 := var_a_45
                let expr_54 := _3
                /// @src 1:548:549  "b"
                let _4 := var_b_47
                let expr_55 := _4
                /// @src 1:530:550  "helper.addition(a,b)"

                // storage for arguments and returned data
                let _5 := allocate_unbounded()
                mstore(_5, shift_left_224(expr_53_functionSelector))
                let _6 := abi_encode_tuple_t_uint256_t_uint256__to_t_uint256_t_uint256__fromStack(add(_5, 4) , expr_54, expr_55)

                let _7 := staticcall(gas(), expr_53_address,  _5, sub(_6, _5), _5, 32)

                if iszero(_7) { revert_forward_1() }

                let expr_56
                if _7 {

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_5, returndatasize())

                    // decode return parameters from external try-call into retVars
                    expr_56 :=  abi_decode_tuple_t_uint256_fromMemory(_5, add(_5, returndatasize()))
                }
                /// @src 1:523:550  "return helper.addition(a,b)"
                var__50 := expr_56
                leave

            }
            /// @src 1:245:560  "contract YulCompilerTest4 {..."

        }

        data ".metadata" hex"a3646970667358221220ddaffeedc0c5ec203576d3884a8fcced6451f0864b0c7b95793ba923a7cf4dad6c6578706572696d656e74616cf564736f6c634300080b0041"
    }
    /*=====================================================*
    *                       WARNING                       *
    *  Solidity to Yul compilation is still EXPERIMENTAL  *
    *       It can result in LOSS OF FUNDS or worse       *
    *                !USE AT YOUR OWN RISK!               *
    *=====================================================*/

    /// @use-src 1:"tests/YulCompilerTest4.sol"
    object "HelperContract_21" {
        code {
            /// @src 1:93:243  "contract HelperContract {..."
            mstore(64, memoryguard(128))
            if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

            constructor_HelperContract_21()

            let _1 := allocate_unbounded()
            codecopy(_1, dataoffset("HelperContract_21_deployed"), datasize("HelperContract_21_deployed"))

            return(_1, datasize("HelperContract_21_deployed"))

            function allocate_unbounded() -> memPtr {
                memPtr := mload(64)
            }

            function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
                revert(0, 0)
            }

            /// @ast-id 6
            /// @src 1:123:138  "constructor(){}"
            function constructor_HelperContract_21() {

                /// @src 1:123:138  "constructor(){}"

            }
            /// @src 1:93:243  "contract HelperContract {..."

        }
        /// @use-src 1:"tests/YulCompilerTest4.sol"
        object "HelperContract_21_deployed" {
            code {
                /// @src 1:93:243  "contract HelperContract {..."
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
                        let ret_0 :=  fun_addition_20(param_0, param_1)
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

                /// @ast-id 20
                /// @src 1:144:241  "function addition(uint256 a, uint256 b) public pure returns (uint256) {..."
                function fun_addition_20(var_a_8, var_b_10) -> var__13 {
                    /// @src 1:205:212  "uint256"
                    let zero_t_uint256_1 := zero_value_for_split_t_uint256()
                    var__13 := zero_t_uint256_1

                    /// @src 1:231:232  "a"
                    let _2 := var_a_8
                    let expr_15 := _2
                    /// @src 1:233:234  "b"
                    let _3 := var_b_10
                    let expr_16 := _3
                    /// @src 1:231:234  "a+b"
                    let expr_17 := checked_add_t_uint256(expr_15, expr_16)

                    /// @src 1:224:234  "return a+b"
                    var__13 := expr_17
                    leave

                }
                /// @src 1:93:243  "contract HelperContract {..."

            }

            data ".metadata" hex"a3646970667358221220151c1c26bd94fbdc2c55c6fb42154ad0ee9ff79aff7326a78acff5c49c89c0ea6c6578706572696d656e74616cf564736f6c634300080b0041"
        }

    }

}

