/*=====================================================*
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *=====================================================*/


/// @use-src 0:"examples/puppet-simplified/UniswapModel.sol"
object "UniswapModel_181" {
    code {
        /// @src 0:399:1370  "contract UniswapModel {..."
        mstore(64, 128)
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        constructor_UniswapModel_181()

        // adapted by Eurus: remove_post_constructor_datacall
        // let _1 := allocate_unbounded()
        // codecopy(_1, dataoffset("UniswapModel_181_deployed"), datasize("UniswapModel_181_deployed"))
        // return(_1, datasize("UniswapModel_181_deployed"))

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
            revert(0, 0)
        }

        /// @ast-id 48
        /// @src 0:474:491  "constructor () {}"
        function constructor_UniswapModel_181() {

            /// @src 0:474:491  "constructor () {}"

        }
        /// @src 0:399:1370  "contract UniswapModel {..."

    }
    /// @use-src 0:"examples/puppet-simplified/UniswapModel.sol"
    object "UniswapModel_181_deployed" {
        code {
            /// @src 0:399:1370  "contract UniswapModel {..."
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x51b9f5b1
                {
                    // swapDVT4ETH(uint256)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    fun_swapDVT4ETH_180(param_0)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x83dcf6a5
                {
                    // getETHBalance(uint256)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    let ret_0 :=  fun_getETHBalance_100(param_0)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xa7be7948
                {
                    // setPoolAddresses(address,address)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_address(4, calldatasize())
                    fun_setPoolAddresses_68(param_0, param_1)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xcabaffcf
                {
                    // dvtPool()

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_dvtPool_41()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_contract$_IERC20_$38__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xf16673a4
                {
                    // ethPool()

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_ethPool_44()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_contract$_IERC20_$38__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xfadbf78c
                {
                    // getDVTBalance(uint256)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    let ret_0 :=  fun_getDVTBalance_84(param_0)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                default {}
            }
            if iszero(calldatasize()) {  }
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

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple_t_uint256__to_t_uint256__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

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

            function abi_decode_tuple_t_addresst_address(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 32

                    value1 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

            }

            function shift_right_unsigned_dynamic(bits, value) -> newValue {
                newValue :=

                shr(bits, value)

            }

            function cleanup_from_storage_t_contract$_IERC20_$38(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function extract_from_storage_value_dynamict_contract$_IERC20_$38(slot_value, offset) -> value {
                value := cleanup_from_storage_t_contract$_IERC20_$38(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function read_from_storage_split_dynamic_t_contract$_IERC20_$38(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_contract$_IERC20_$38(sload(slot), offset)

            }

            /// @ast-id 41
            /// @src 0:425:446  "IERC20 public dvtPool"
            function getter_fun_dvtPool_41() -> ret_address {

                let slot := 0
                let offset := 0

                ret_address := read_from_storage_split_dynamic_t_contract$_IERC20_$38(slot, offset)

            }
            /// @src 0:399:1370  "contract UniswapModel {..."

            function identity(value) -> ret {
                ret := value
            }

            function convert_t_uint160_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(identity(cleanup_t_uint160(value)))
            }

            function convert_t_uint160_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_contract$_IERC20_$38_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function abi_encode_t_contract$_IERC20_$38_to_t_address_fromStack(value, pos) {
                mstore(pos, convert_t_contract$_IERC20_$38_to_t_address(value))
            }

            function abi_encode_tuple_t_contract$_IERC20_$38__to_t_address__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_contract$_IERC20_$38_to_t_address_fromStack(value0,  add(headStart, 0))

            }

            /// @ast-id 44
            /// @src 0:449:470  "IERC20 public ethPool"
            function getter_fun_ethPool_44() -> ret_address {

                let slot := 1
                let offset := 0

                ret_address := read_from_storage_split_dynamic_t_contract$_IERC20_$38(slot, offset)

            }
            /// @src 0:399:1370  "contract UniswapModel {..."

            function revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74() {
                revert(0, 0)
            }

            function convert_t_uint160_to_t_contract$_IERC20_$38(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_address_to_t_contract$_IERC20_$38(value) -> converted {
                converted := convert_t_uint160_to_t_contract$_IERC20_$38(value)
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

            function convert_t_contract$_IERC20_$38_to_t_contract$_IERC20_$38(value) -> converted {
                converted := convert_t_uint160_to_t_contract$_IERC20_$38(value)
            }

            function prepare_store_t_contract$_IERC20_$38(value) -> ret {
                ret := value
            }

            function update_storage_value_offset_0t_contract$_IERC20_$38_to_t_contract$_IERC20_$38(slot, value_0) {
                let convertedValue_0 := convert_t_contract$_IERC20_$38_to_t_contract$_IERC20_$38(value_0)
                sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_contract$_IERC20_$38(convertedValue_0)))
            }

            /// @ast-id 68
            /// @src 0:494:637  "function setPoolAddresses(address dvtAddress, address ethAddress) external {..."
            function fun_setPoolAddresses_68(var_dvtAddress_50, var_ethAddress_52) {

                /// @src 0:590:600  "dvtAddress"
                let _1 := var_dvtAddress_50
                let expr_57 := _1
                /// @src 0:583:601  "IERC20(dvtAddress)"
                let expr_58_address := convert_t_address_to_t_contract$_IERC20_$38(expr_57)
                /// @src 0:573:601  "dvtPool = IERC20(dvtAddress)"
                update_storage_value_offset_0t_contract$_IERC20_$38_to_t_contract$_IERC20_$38(0x00, expr_58_address)
                let expr_59_address := expr_58_address
                /// @src 0:622:632  "ethAddress"
                let _2 := var_ethAddress_52
                let expr_63 := _2
                /// @src 0:615:633  "IERC20(ethAddress)"
                let expr_64_address := convert_t_address_to_t_contract$_IERC20_$38(expr_63)
                /// @src 0:605:633  "ethPool = IERC20(ethAddress)"
                update_storage_value_offset_0t_contract$_IERC20_$38_to_t_contract$_IERC20_$38(0x01, expr_64_address)
                let expr_65_address := expr_64_address

            }
            /// @src 0:399:1370  "contract UniswapModel {..."

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

            function shift_right_0_unsigned(value) -> newValue {
                newValue :=

                shr(0, value)

            }

            function extract_from_storage_value_offset_0t_contract$_IERC20_$38(slot_value) -> value {
                value := cleanup_from_storage_t_contract$_IERC20_$38(shift_right_0_unsigned(slot_value))
            }

            function read_from_storage_split_offset_0_t_contract$_IERC20_$38(slot) -> value {
                value := extract_from_storage_value_offset_0t_contract$_IERC20_$38(sload(slot))

            }

            function convert_t_contract$_UniswapModel_$181_to_t_address(value) -> converted {
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

            function abi_encode_t_address_to_t_address_fromStack(value, pos) {
                mstore(pos, cleanup_t_address(value))
            }

            function abi_encode_tuple_t_address__to_t_address__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

            }

            function revert_forward_1() {
                let pos := allocate_unbounded()
                returndatacopy(pos, 0, returndatasize())
                revert(pos, returndatasize())
            }

            /// @ast-id 84
            /// @src 0:640:751  "function getDVTBalance(uint256) external view returns (uint256) {..."
            function fun_getDVTBalance_84(var__70) -> var__73 {
                /// @src 0:695:702  "uint256"
                let zero_t_uint256_3 := zero_value_for_split_t_uint256()
                var__73 := zero_t_uint256_3

                /// @src 0:715:722  "dvtPool"
                let _4_address := read_from_storage_split_offset_0_t_contract$_IERC20_$38(0x00)
                let expr_75_address := _4_address
                /// @src 0:715:732  "dvtPool.balanceOf"
                let expr_76_address := convert_t_contract$_IERC20_$38_to_t_address(expr_75_address)
                let expr_76_functionSelector := 0x70a08231
                /// @src 0:741:745  "this"
                let expr_79_address := address()
                /// @src 0:733:746  "address(this)"
                let expr_80 := convert_t_contract$_UniswapModel_$181_to_t_address(expr_79_address)
                /// @src 0:715:747  "dvtPool.balanceOf(address(this))"
                if iszero(extcodesize(expr_76_address)) { revert_error_0cc013b6b3b6beabea4e3a74a6d380f0df81852ca99887912475e1f66b2a2c20() }

                // storage for arguments and returned data
                let _5 := allocate_unbounded()
                mstore(_5, shift_left_224(expr_76_functionSelector))
                let _6 := abi_encode_tuple_t_address__to_t_address__fromStack(add(_5, 4) , expr_80)

                let _7 := staticcall(gas(), expr_76_address,  _5, sub(_6, _5), _5, 32)

                if iszero(_7) { revert_forward_1() }

                let expr_81
                if _7 {

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_5, returndatasize())

                    // decode return parameters from external try-call into retVars
                    expr_81 :=  abi_decode_tuple_t_uint256_fromMemory(_5, add(_5, returndatasize()))
                }
                /// @src 0:708:747  "return dvtPool.balanceOf(address(this))"
                var__73 := expr_81
                leave

            }
            /// @src 0:399:1370  "contract UniswapModel {..."

            /// @ast-id 100
            /// @src 0:754:865  "function getETHBalance(uint256) external view returns (uint256) {..."
            function fun_getETHBalance_100(var__86) -> var__89 {
                /// @src 0:809:816  "uint256"
                let zero_t_uint256_8 := zero_value_for_split_t_uint256()
                var__89 := zero_t_uint256_8

                /// @src 0:829:836  "ethPool"
                let _9_address := read_from_storage_split_offset_0_t_contract$_IERC20_$38(0x01)
                let expr_91_address := _9_address
                /// @src 0:829:846  "ethPool.balanceOf"
                let expr_92_address := convert_t_contract$_IERC20_$38_to_t_address(expr_91_address)
                let expr_92_functionSelector := 0x70a08231
                /// @src 0:855:859  "this"
                let expr_95_address := address()
                /// @src 0:847:860  "address(this)"
                let expr_96 := convert_t_contract$_UniswapModel_$181_to_t_address(expr_95_address)
                /// @src 0:829:861  "ethPool.balanceOf(address(this))"
                if iszero(extcodesize(expr_92_address)) { revert_error_0cc013b6b3b6beabea4e3a74a6d380f0df81852ca99887912475e1f66b2a2c20() }

                // storage for arguments and returned data
                let _10 := allocate_unbounded()
                mstore(_10, shift_left_224(expr_92_functionSelector))
                let _11 := abi_encode_tuple_t_address__to_t_address__fromStack(add(_10, 4) , expr_96)

                let _12 := staticcall(gas(), expr_92_address,  _10, sub(_11, _10), _10, 32)

                if iszero(_12) { revert_forward_1() }

                let expr_97
                if _12 {

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_10, returndatasize())

                    // decode return parameters from external try-call into retVars
                    expr_97 :=  abi_decode_tuple_t_uint256_fromMemory(_10, add(_10, returndatasize()))
                }
                /// @src 0:822:861  "return ethPool.balanceOf(address(this))"
                var__89 := expr_97
                leave

            }
            /// @src 0:399:1370  "contract UniswapModel {..."

            function panic_error_0x11() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x11)
                revert(0, 0x24)
            }

            function checked_mul_t_uint256(x, y) -> product {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                // overflow, if x != 0 and y > (maxValue / x)
                if and(iszero(iszero(x)), gt(y, div(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, x))) { panic_error_0x11() }

                product := mul(x, y)
            }

            function checked_add_t_uint256(x, y) -> sum {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                // overflow, if x > (maxValue - y)
                if gt(x, sub(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, y)) { panic_error_0x11() }

                sum := add(x, y)
            }

            function panic_error_0x12() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x12)
                revert(0, 0x24)
            }

            function checked_div_t_uint256(x, y) -> r {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)
                if iszero(y) { panic_error_0x12() }

                r := div(x, y)
            }

            function checked_sub_t_uint256(x, y) -> diff {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                if lt(x, y) { panic_error_0x11() }

                diff := sub(x, y)
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

            function abi_encode_tuple_t_address_t_address_t_uint256__to_t_address_t_address_t_uint256__fromStack(headStart , value0, value1, value2) -> tail {
                tail := add(headStart, 96)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

                abi_encode_t_address_to_t_address_fromStack(value1,  add(headStart, 32))

                abi_encode_t_uint256_to_t_uint256_fromStack(value2,  add(headStart, 64))

            }

            /// @ast-id 180
            /// @src 0:891:1367  "function swapDVT4ETH(uint256 v) external {..."
            function fun_swapDVT4ETH_180(var_v_102) {

                /// @src 0:996:1003  "dvtPool"
                let _13_address := read_from_storage_split_offset_0_t_contract$_IERC20_$38(0x00)
                let expr_107_address := _13_address
                /// @src 0:996:1013  "dvtPool.balanceOf"
                let expr_108_address := convert_t_contract$_IERC20_$38_to_t_address(expr_107_address)
                let expr_108_functionSelector := 0x70a08231
                /// @src 0:1022:1026  "this"
                let expr_111_address := address()
                /// @src 0:1014:1027  "address(this)"
                let expr_112 := convert_t_contract$_UniswapModel_$181_to_t_address(expr_111_address)
                /// @src 0:996:1028  "dvtPool.balanceOf(address(this))"
                if iszero(extcodesize(expr_108_address)) { revert_error_0cc013b6b3b6beabea4e3a74a6d380f0df81852ca99887912475e1f66b2a2c20() }

                // storage for arguments and returned data
                let _14 := allocate_unbounded()
                mstore(_14, shift_left_224(expr_108_functionSelector))
                let _15 := abi_encode_tuple_t_address__to_t_address__fromStack(add(_14, 4) , expr_112)

                let _16 := staticcall(gas(), expr_108_address,  _14, sub(_15, _14), _14, 32)

                if iszero(_16) { revert_forward_1() }

                let expr_113
                if _16 {

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_14, returndatasize())

                    // decode return parameters from external try-call into retVars
                    expr_113 :=  abi_decode_tuple_t_uint256_fromMemory(_14, add(_14, returndatasize()))
                }
                /// @src 0:975:1028  "uint256 DVTBalance = dvtPool.balanceOf(address(this))"
                let var_DVTBalance_106 := expr_113
                /// @src 0:1053:1060  "ethPool"
                let _17_address := read_from_storage_split_offset_0_t_contract$_IERC20_$38(0x01)
                let expr_117_address := _17_address
                /// @src 0:1053:1070  "ethPool.balanceOf"
                let expr_118_address := convert_t_contract$_IERC20_$38_to_t_address(expr_117_address)
                let expr_118_functionSelector := 0x70a08231
                /// @src 0:1079:1083  "this"
                let expr_121_address := address()
                /// @src 0:1071:1084  "address(this)"
                let expr_122 := convert_t_contract$_UniswapModel_$181_to_t_address(expr_121_address)
                /// @src 0:1053:1085  "ethPool.balanceOf(address(this))"
                if iszero(extcodesize(expr_118_address)) { revert_error_0cc013b6b3b6beabea4e3a74a6d380f0df81852ca99887912475e1f66b2a2c20() }

                // storage for arguments and returned data
                let _18 := allocate_unbounded()
                mstore(_18, shift_left_224(expr_118_functionSelector))
                let _19 := abi_encode_tuple_t_address__to_t_address__fromStack(add(_18, 4) , expr_122)

                let _20 := staticcall(gas(), expr_118_address,  _18, sub(_19, _18), _18, 32)

                if iszero(_20) { revert_forward_1() }

                let expr_123
                if _20 {

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_18, returndatasize())

                    // decode return parameters from external try-call into retVars
                    expr_123 :=  abi_decode_tuple_t_uint256_fromMemory(_18, add(_18, returndatasize()))
                }
                /// @src 0:1032:1085  "uint256 ETHBalance = ethPool.balanceOf(address(this))"
                let var_ETHBalance_116 := expr_123
                /// @src 0:1101:1111  "DVTBalance"
                let _21 := var_DVTBalance_106
                let expr_127 := _21
                /// @src 0:1114:1124  "ETHBalance"
                let _22 := var_ETHBalance_116
                let expr_128 := _22
                /// @src 0:1101:1124  "DVTBalance * ETHBalance"
                let expr_129 := checked_mul_t_uint256(expr_127, expr_128)

                /// @src 0:1089:1124  "uint256 k = DVTBalance * ETHBalance"
                let var_k_126 := expr_129
                /// @src 0:1145:1155  "DVTBalance"
                let _23 := var_DVTBalance_106
                let expr_133 := _23
                /// @src 0:1158:1159  "v"
                let _24 := var_v_102
                let expr_134 := _24
                /// @src 0:1145:1159  "DVTBalance + v"
                let expr_135 := checked_add_t_uint256(expr_133, expr_134)

                /// @src 0:1128:1159  "uint256 newDVT = DVTBalance + v"
                let var_newDVT_132 := expr_135
                /// @src 0:1180:1181  "k"
                let _25 := var_k_126
                let expr_139 := _25
                /// @src 0:1184:1190  "newDVT"
                let _26 := var_newDVT_132
                let expr_140 := _26
                /// @src 0:1180:1190  "k / newDVT"
                let expr_141 := checked_div_t_uint256(expr_139, expr_140)

                /// @src 0:1163:1190  "uint256 newETH = k / newDVT"
                let var_newETH_138 := expr_141
                /// @src 0:1206:1216  "ETHBalance"
                let _27 := var_ETHBalance_116
                let expr_145 := _27
                /// @src 0:1219:1225  "newETH"
                let _28 := var_newETH_138
                let expr_146 := _28
                /// @src 0:1206:1225  "ETHBalance - newETH"
                let expr_147 := checked_sub_t_uint256(expr_145, expr_146)

                /// @src 0:1194:1225  "uint256 s = ETHBalance - newETH"
                let var_s_144 := expr_147
                /// @src 0:1241:1248  "ethPool"
                let _29_address := read_from_storage_split_offset_0_t_contract$_IERC20_$38(0x01)
                let expr_149_address := _29_address
                /// @src 0:1241:1261  "ethPool.transferFrom"
                let expr_151_address := convert_t_contract$_IERC20_$38_to_t_address(expr_149_address)
                let expr_151_functionSelector := 0x23b872dd
                /// @src 0:1270:1274  "this"
                let expr_154_address := address()
                /// @src 0:1262:1275  "address(this)"
                let expr_155 := convert_t_contract$_UniswapModel_$181_to_t_address(expr_154_address)
                /// @src 0:1285:1295  "msg.sender"
                let expr_159 := caller()
                /// @src 0:1277:1296  "address(msg.sender)"
                let expr_160 := expr_159
                /// @src 0:1298:1299  "s"
                let _30 := var_s_144
                let expr_161 := _30
                /// @src 0:1241:1300  "ethPool.transferFrom(address(this), address(msg.sender), s)"
                if iszero(extcodesize(expr_151_address)) { revert_error_0cc013b6b3b6beabea4e3a74a6d380f0df81852ca99887912475e1f66b2a2c20() }

                // storage for arguments and returned data
                let _31 := allocate_unbounded()
                mstore(_31, shift_left_224(expr_151_functionSelector))
                let _32 := abi_encode_tuple_t_address_t_address_t_uint256__to_t_address_t_address_t_uint256__fromStack(add(_31, 4) , expr_155, expr_160, expr_161)

                let _33 := call(gas(), expr_151_address,  0,  _31, sub(_32, _31), _31, 32)

                if iszero(_33) { revert_forward_1() }

                let expr_162
                if _33 {

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_31, returndatasize())

                    // decode return parameters from external try-call into retVars
                    expr_162 :=  abi_decode_tuple_t_bool_fromMemory(_31, add(_31, returndatasize()))
                }
                /// @src 0:1304:1311  "dvtPool"
                let _34_address := read_from_storage_split_offset_0_t_contract$_IERC20_$38(0x00)
                let expr_164_address := _34_address
                /// @src 0:1304:1324  "dvtPool.transferFrom"
                let expr_166_address := convert_t_contract$_IERC20_$38_to_t_address(expr_164_address)
                let expr_166_functionSelector := 0x23b872dd
                /// @src 0:1333:1343  "msg.sender"
                let expr_170 := caller()
                /// @src 0:1325:1344  "address(msg.sender)"
                let expr_171 := expr_170
                /// @src 0:1354:1358  "this"
                let expr_174_address := address()
                /// @src 0:1346:1359  "address(this)"
                let expr_175 := convert_t_contract$_UniswapModel_$181_to_t_address(expr_174_address)
                /// @src 0:1361:1362  "v"
                let _35 := var_v_102
                let expr_176 := _35
                /// @src 0:1304:1363  "dvtPool.transferFrom(address(msg.sender), address(this), v)"
                if iszero(extcodesize(expr_166_address)) { revert_error_0cc013b6b3b6beabea4e3a74a6d380f0df81852ca99887912475e1f66b2a2c20() }

                // storage for arguments and returned data
                let _36 := allocate_unbounded()
                mstore(_36, shift_left_224(expr_166_functionSelector))
                let _37 := abi_encode_tuple_t_address_t_address_t_uint256__to_t_address_t_address_t_uint256__fromStack(add(_36, 4) , expr_171, expr_175, expr_176)

                let _38 := call(gas(), expr_166_address,  0,  _36, sub(_37, _36), _36, 32)

                if iszero(_38) { revert_forward_1() }

                let expr_177
                if _38 {

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_36, returndatasize())

                    // decode return parameters from external try-call into retVars
                    expr_177 :=  abi_decode_tuple_t_bool_fromMemory(_36, add(_36, returndatasize()))
                }

            }
            /// @src 0:399:1370  "contract UniswapModel {..."

        }

        data ".metadata" hex"a3646970667358221220a1dd5fa7a5e092bf1ac16c7813bc33654fe25f4c379d6146c92e296bbc338b216c6578706572696d656e74616cf564736f6c63430008090041"
    }

}

