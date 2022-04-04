/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "PuppetPool_263" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_PuppetPool_263()

        codecopy(0, dataoffset("PuppetPool_263_deployed"), datasize("PuppetPool_263_deployed"))

        return(0, datasize("PuppetPool_263_deployed"))

        function constructor_PuppetPool_263() {

        }

    }
    object "PuppetPool_263_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x0e2feb05
                {
                    // uniswapAddress()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_uniswapAddress_59()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x0ecbcdab
                {
                    // borrow(uint256,uint256)

                    let param_0, param_1 :=  abi_decode_tuple_t_uint256t_uint256(4, calldatasize())
                    fun_borrow_172(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x1a97b88c
                {
                    // eurus_deposit_required(uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    let ret_0 :=  fun_eurus_deposit_required_240(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x2681f7e4
                {
                    // uniswap()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_uniswap_68()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_contract$_IUniswapModel_$53__to_t_contract$_IUniswapModel_$53__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x4730bf33
                {
                    // eurus_dep0()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_eurus_dep0_249()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x8597600f
                {
                    // setPoolAddresses(address,address,address)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1, param_2 :=  abi_decode_tuple_t_addresst_addresst_address(4, calldatasize())
                    fun_setPoolAddresses_104(param_0, param_1, param_2)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xbc554c28
                {
                    // calculateDepositRequired(uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    let ret_0 :=  fun_calculateDepositRequired_189(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xcabaffcf
                {
                    // dvtPool()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_dvtPool_62()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_contract$_IERC20_$38__to_t_contract$_IERC20_$38__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xe1a7969c
                {
                    // eurus_dep1(uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    let ret_0 :=  fun_eurus_dep1_262(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xf16673a4
                {
                    // ethPool()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_ethPool_65()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_contract$_IERC20_$38__to_t_contract$_IERC20_$38__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xf57b1bb4
                {
                    // eurus_oracle_price(uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    let ret_0 :=  fun_eurus_oracle_price_223(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xfc7e286d
                {
                    // deposits(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  getter_fun_deposits_57(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                default {}
            }
            if iszero(calldatasize()) {  }
            revert(0, 0)

            function abi_decode_t_address(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_address(value)
            }

            function abi_decode_t_bool_fromMemory(offset, end) -> value {
                value := mload(offset)
                validator_revert_t_bool(value)
            }

            function abi_decode_t_uint256(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_uint256(value)
            }

            function abi_decode_t_uint256_fromMemory(offset, end) -> value {
                value := mload(offset)
                validator_revert_t_uint256(value)
            }

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert(0, 0) }

            }

            function abi_decode_tuple_t_address(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {

                    let offset := 0

                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_t_addresst_addresst_address(headStart, dataEnd) -> value0, value1, value2 {
                if slt(sub(dataEnd, headStart), 96) { revert(0, 0) }

                {

                    let offset := 0

                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 32

                    value1 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 64

                    value2 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_t_bool_fromMemory(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {

                    let offset := 0

                    value0 := abi_decode_t_bool_fromMemory(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_t_uint256(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {

                    let offset := 0

                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_t_uint256_fromMemory(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {

                    let offset := 0

                    value0 := abi_decode_t_uint256_fromMemory(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_t_uint256t_uint256(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert(0, 0) }

                {

                    let offset := 0

                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 32

                    value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_t_address_to_t_address_fromStack(value, pos) {
                mstore(pos, cleanup_t_address(value))
            }

            function abi_encode_t_contract$_IERC20_$38_to_t_address_fromStack(value, pos) {
                mstore(pos, convert_t_contract$_IERC20_$38_to_t_address(value))
            }

            function abi_encode_t_contract$_IUniswapModel_$53_to_t_address_fromStack(value, pos) {
                mstore(pos, convert_t_contract$_IUniswapModel_$53_to_t_address(value))
            }

            function abi_encode_t_rational_0_by_1_to_t_uint256_fromStack(value, pos) {
                mstore(pos, convert_t_rational_0_by_1_to_t_uint256(value))
            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function abi_encode_tuple_t_address__to_t_address__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

            }

            function abi_encode_tuple_t_address_t_address_t_uint256__to_t_address_t_address_t_uint256__fromStack(headStart , value0, value1, value2) -> tail {
                tail := add(headStart, 96)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

                abi_encode_t_address_to_t_address_fromStack(value1,  add(headStart, 32))

                abi_encode_t_uint256_to_t_uint256_fromStack(value2,  add(headStart, 64))

            }

            function abi_encode_tuple_t_address_t_uint256__to_t_address_t_uint256__fromStack(headStart , value0, value1) -> tail {
                tail := add(headStart, 64)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

                abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

            }

            function abi_encode_tuple_t_contract$_IERC20_$38__to_t_contract$_IERC20_$38__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_contract$_IERC20_$38_to_t_address_fromStack(value0,  add(headStart, 0))

            }

            function abi_encode_tuple_t_contract$_IUniswapModel_$53__to_t_contract$_IUniswapModel_$53__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_contract$_IUniswapModel_$53_to_t_address_fromStack(value0,  add(headStart, 0))

            }

            function abi_encode_tuple_t_rational_0_by_1__to_t_uint256__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_rational_0_by_1_to_t_uint256_fromStack(value0,  add(headStart, 0))

            }

            function abi_encode_tuple_t_uint256__to_t_uint256__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

            }

            function allocateMemory(size) -> memPtr {
                memPtr := mload(64)
                let newFreePtr := add(memPtr, size)
                // protect against overflow
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error_0x41() }
                mstore(64, newFreePtr)
            }

            function checked_add_t_uint256(x, y) -> sum {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                // overflow, if x > (maxValue - y)
                if gt(x, sub(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, y)) { panic_error_0x11() }

                sum := add(x, y)
            }

            function checked_div_t_uint256(x, y) -> r {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)
                if iszero(y) { panic_error_0x12() }

                r := div(x, y)
            }

            function checked_mul_t_uint256(x, y) -> product {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                // overflow, if x != 0 and y > (maxValue / x)
                if and(iszero(iszero(x)), gt(y, div(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, x))) { panic_error_0x11() }

                product := mul(x, y)
            }

            function checked_sub_t_uint256(x, y) -> diff {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                if lt(x, y) { panic_error_0x11() }

                diff := sub(x, y)
            }

            function cleanup_from_storage_t_address(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_from_storage_t_contract$_IERC20_$38(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_from_storage_t_contract$_IUniswapModel_$53(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_from_storage_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function cleanup_t_address(value) -> cleaned {
                cleaned := cleanup_t_uint160(value)
            }

            function cleanup_t_bool(value) -> cleaned {
                cleaned := iszero(iszero(value))
            }

            function cleanup_t_uint160(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function convert_t_address_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_address_to_t_contract$_IERC20_$38(value) -> converted {
                converted := convert_t_uint160_to_t_contract$_IERC20_$38(value)
            }

            function convert_t_address_to_t_contract$_IUniswapModel_$53(value) -> converted {
                converted := convert_t_uint160_to_t_contract$_IUniswapModel_$53(value)
            }

            function convert_t_contract$_IERC20_$38_to_t_address(value) -> converted {
                converted := convert_t_contract$_IERC20_$38_to_t_uint160(value)
            }

            function convert_t_contract$_IERC20_$38_to_t_contract$_IERC20_$38(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_contract$_IERC20_$38_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_contract$_IUniswapModel_$53_to_t_address(value) -> converted {
                converted := convert_t_contract$_IUniswapModel_$53_to_t_uint160(value)
            }

            function convert_t_contract$_IUniswapModel_$53_to_t_contract$_IUniswapModel_$53(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_contract$_IUniswapModel_$53_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_contract$_PuppetPool_$263_to_t_address(value) -> converted {
                converted := convert_t_contract$_PuppetPool_$263_to_t_uint160(value)
            }

            function convert_t_contract$_PuppetPool_$263_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_10_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_2_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_uint160_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_uint160_to_t_contract$_IERC20_$38(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_uint160_to_t_contract$_IUniswapModel_$53(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_uint160_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_uint256_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function extract_from_storage_value_dynamict_address(slot_value, offset) -> value {
                value := cleanup_from_storage_t_address(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_dynamict_contract$_IERC20_$38(slot_value, offset) -> value {
                value := cleanup_from_storage_t_contract$_IERC20_$38(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_dynamict_contract$_IUniswapModel_$53(slot_value, offset) -> value {
                value := cleanup_from_storage_t_contract$_IUniswapModel_$53(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_dynamict_uint256(slot_value, offset) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_offset_0t_address(slot_value) -> value {
                value := cleanup_from_storage_t_address(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_0t_contract$_IERC20_$38(slot_value) -> value {
                value := cleanup_from_storage_t_contract$_IERC20_$38(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_0t_contract$_IUniswapModel_$53(slot_value) -> value {
                value := cleanup_from_storage_t_contract$_IUniswapModel_$53(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function fun__computeOraclePrice_205() -> vloc__192 {
                let zero_value_for_type_t_uint256_34 := zero_value_for_split_t_uint256()
                vloc__192 := zero_value_for_type_t_uint256_34

                let _35_address := read_from_storage_split_offset_0_t_contract$_IUniswapModel_$53(0x04)
                let expr_194_address := _35_address
                let expr_195_address := convert_t_contract$_IUniswapModel_$53_to_t_address(expr_194_address)
                let expr_195_functionSelector := 0x83dcf6a5
                let expr_196 := 0x00

                if iszero(extcodesize(expr_195_address)) { revert(0, 0) }

                // storage for arguments and returned data
                let _36 := mload(64)
                mstore(_36, shift_left_224(expr_195_functionSelector))
                let _37 := abi_encode_tuple_t_rational_0_by_1__to_t_uint256__fromStack(add(_36, 4) , expr_196)

                let _38 := staticcall(gas(), expr_195_address,  _36, sub(_37, _36), _36, 32)

                if iszero(_38) { revert_forward_1() }

                let expr_197
                if _38 {

                    // update freeMemoryPointer according to dynamic return size
                    mstore(64, add(_36, round_up_to_mul_of_32(returndatasize())))

                    // decode return parameters from external try-call into retVars
                    expr_197 :=  abi_decode_tuple_t_uint256_fromMemory(_36, add(_36, returndatasize()))
                }
                let _39_address := read_from_storage_split_offset_0_t_contract$_IERC20_$38(0x02)
                let expr_198_address := _39_address
                let expr_199_address := convert_t_contract$_IERC20_$38_to_t_address(expr_198_address)
                let expr_199_functionSelector := 0x70a08231
                let _40 := read_from_storage_split_offset_0_t_address(0x01)
                let expr_200 := _40

                if iszero(extcodesize(expr_199_address)) { revert(0, 0) }

                // storage for arguments and returned data
                let _41 := mload(64)
                mstore(_41, shift_left_224(expr_199_functionSelector))
                let _42 := abi_encode_tuple_t_address__to_t_address__fromStack(add(_41, 4) , expr_200)

                let _43 := staticcall(gas(), expr_199_address,  _41, sub(_42, _41), _41, 32)

                if iszero(_43) { revert_forward_1() }

                let expr_201
                if _43 {

                    // update freeMemoryPointer according to dynamic return size
                    mstore(64, add(_41, round_up_to_mul_of_32(returndatasize())))

                    // decode return parameters from external try-call into retVars
                    expr_201 :=  abi_decode_tuple_t_uint256_fromMemory(_41, add(_41, returndatasize()))
                }
                let expr_202 := checked_div_t_uint256(expr_197, expr_201)

                vloc__192 := expr_202
                leave

            }

            function fun_borrow_172(vloc_borrowAmount_106, vloc_depositAmount_108) {

                let _5_address := read_from_storage_split_offset_0_t_contract$_IERC20_$38(0x03)
                let expr_111_address := _5_address
                let expr_113_address := convert_t_contract$_IERC20_$38_to_t_address(expr_111_address)
                let expr_113_functionSelector := 0x23b872dd
                let expr_115 := caller()
                let expr_118_address := address()
                let expr_119 := convert_t_contract$_PuppetPool_$263_to_t_address(expr_118_address)
                let _6 := vloc_depositAmount_108
                let expr_120 := _6

                if iszero(extcodesize(expr_113_address)) { revert(0, 0) }

                // storage for arguments and returned data
                let _7 := mload(64)
                mstore(_7, shift_left_224(expr_113_functionSelector))
                let _8 := abi_encode_tuple_t_address_t_address_t_uint256__to_t_address_t_address_t_uint256__fromStack(add(_7, 4) , expr_115, expr_119, expr_120)

                let _9 := call(gas(), expr_113_address,  0,  _7, sub(_8, _7), _7, 32)

                if iszero(_9) { revert_forward_1() }

                let expr_121
                if _9 {

                    // update freeMemoryPointer according to dynamic return size
                    mstore(64, add(_7, round_up_to_mul_of_32(returndatasize())))

                    // decode return parameters from external try-call into retVars
                    expr_121 :=  abi_decode_tuple_t_bool_fromMemory(_7, add(_7, returndatasize()))
                }
                let expr_125_functionIdentifier := 189
                let _10 := vloc_borrowAmount_106
                let expr_126 := _10
                let expr_127 := fun_calculateDepositRequired_189(expr_126)
                let vloc_depositRequired_124 := expr_127
                let _11 := vloc_depositAmount_108
                let expr_130 := _11
                let _12 := vloc_depositRequired_124
                let expr_131 := _12
                let expr_132 := iszero(lt(cleanup_t_uint256(expr_130), cleanup_t_uint256(expr_131)))
                require_helper(expr_132)
                let _13 := vloc_depositAmount_108
                let expr_135 := _13
                let _14 := vloc_depositRequired_124
                let expr_136 := _14
                let expr_137 := gt(cleanup_t_uint256(expr_135), cleanup_t_uint256(expr_136))
                if expr_137 {
                    let _15_address := read_from_storage_split_offset_0_t_contract$_IERC20_$38(0x03)
                    let expr_138_address := _15_address
                    let expr_140_address := convert_t_contract$_IERC20_$38_to_t_address(expr_138_address)
                    let expr_140_functionSelector := 0xa9059cbb
                    let expr_142 := caller()
                    let _16 := vloc_depositAmount_108
                    let expr_143 := _16
                    let _17 := vloc_depositRequired_124
                    let expr_144 := _17
                    let expr_145 := checked_sub_t_uint256(expr_143, expr_144)

                    if iszero(extcodesize(expr_140_address)) { revert(0, 0) }

                    // storage for arguments and returned data
                    let _18 := mload(64)
                    mstore(_18, shift_left_224(expr_140_functionSelector))
                    let _19 := abi_encode_tuple_t_address_t_uint256__to_t_address_t_uint256__fromStack(add(_18, 4) , expr_142, expr_145)

                    let _20 := call(gas(), expr_140_address,  0,  _18, sub(_19, _18), _18, 32)

                    if iszero(_20) { revert_forward_1() }

                    let expr_146
                    if _20 {

                        // update freeMemoryPointer according to dynamic return size
                        mstore(64, add(_18, round_up_to_mul_of_32(returndatasize())))

                        // decode return parameters from external try-call into retVars
                        expr_146 :=  abi_decode_tuple_t_bool_fromMemory(_18, add(_18, returndatasize()))
                    }
                }
                let _21 := 0x00
                let expr_154 := _21
                let expr_156 := caller()
                let _22 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_154,expr_156)
                let _23 := read_from_storage_split_offset_0_t_uint256(_22)
                let expr_157 := _23
                let _24 := vloc_depositRequired_124
                let expr_158 := _24
                let expr_159 := checked_add_t_uint256(expr_157, expr_158)

                let _25 := 0x00
                let expr_150 := _25
                let expr_152 := caller()
                let _26 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_150,expr_152)
                update_storage_value_offset_0t_uint256_to_t_uint256(_26, expr_159)
                let expr_160 := expr_159
                let _27_address := read_from_storage_split_offset_0_t_contract$_IERC20_$38(0x02)
                let expr_163_address := _27_address
                let expr_164_address := convert_t_contract$_IERC20_$38_to_t_address(expr_163_address)
                let expr_164_functionSelector := 0xa9059cbb
                let expr_166 := caller()
                let _28 := vloc_borrowAmount_106
                let expr_167 := _28

                if iszero(extcodesize(expr_164_address)) { revert(0, 0) }

                // storage for arguments and returned data
                let _29 := mload(64)
                mstore(_29, shift_left_224(expr_164_functionSelector))
                let _30 := abi_encode_tuple_t_address_t_uint256__to_t_address_t_uint256__fromStack(add(_29, 4) , expr_166, expr_167)

                let _31 := call(gas(), expr_164_address,  0,  _29, sub(_30, _29), _29, 32)

                if iszero(_31) { revert_forward_1() }

                let expr_168
                if _31 {

                    // update freeMemoryPointer according to dynamic return size
                    mstore(64, add(_29, round_up_to_mul_of_32(returndatasize())))

                    // decode return parameters from external try-call into retVars
                    expr_168 :=  abi_decode_tuple_t_bool_fromMemory(_29, add(_29, returndatasize()))
                }
                require_helper(expr_168)

            }

            function fun_calculateDepositRequired_189(vloc_amount_174) -> vloc__177 {
                let zero_value_for_type_t_uint256_32 := zero_value_for_split_t_uint256()
                vloc__177 := zero_value_for_type_t_uint256_32

                let _33 := vloc_amount_174
                let expr_179 := _33
                let expr_180_functionIdentifier := 205
                let expr_181 := fun__computeOraclePrice_205()
                let expr_182 := checked_mul_t_uint256(expr_179, expr_181)

                let expr_183 := 0x02
                let expr_184 := checked_mul_t_uint256(expr_182, convert_t_rational_2_by_1_to_t_uint256(expr_183))

                let expr_185 := 0x0a
                let expr_186 := checked_div_t_uint256(expr_184, convert_t_rational_10_by_1_to_t_uint256(expr_185))

                vloc__177 := expr_186
                leave

            }

            function fun_eurus_dep0_249() -> vloc__243 {
                let zero_value_for_type_t_uint256_56 := zero_value_for_split_t_uint256()
                vloc__243 := zero_value_for_type_t_uint256_56

                let expr_245_functionIdentifier := 205
                let expr_246 := fun__computeOraclePrice_205()
                vloc__243 := expr_246
                leave

            }

            function fun_eurus_dep1_262(vloc_amount_251) -> vloc__254 {
                let zero_value_for_type_t_uint256_57 := zero_value_for_split_t_uint256()
                vloc__254 := zero_value_for_type_t_uint256_57

                let _58 := vloc_amount_251
                let expr_256 := _58
                let expr_257_functionIdentifier := 205
                let expr_258 := fun__computeOraclePrice_205()
                let expr_259 := checked_mul_t_uint256(expr_256, expr_258)

                vloc__254 := expr_259
                leave

            }

            function fun_eurus_deposit_required_240(vloc_amount_225) -> vloc__228 {
                let zero_value_for_type_t_uint256_54 := zero_value_for_split_t_uint256()
                vloc__228 := zero_value_for_type_t_uint256_54

                let _55 := vloc_amount_225
                let expr_230 := _55
                let expr_231_functionIdentifier := 205
                let expr_232 := fun__computeOraclePrice_205()
                let expr_233 := checked_mul_t_uint256(expr_230, expr_232)

                let expr_234 := 0x02
                let expr_235 := checked_mul_t_uint256(expr_233, convert_t_rational_2_by_1_to_t_uint256(expr_234))

                let expr_236 := 0x0a
                let expr_237 := checked_div_t_uint256(expr_235, convert_t_rational_10_by_1_to_t_uint256(expr_236))

                vloc__228 := expr_237
                leave

            }

            function fun_eurus_oracle_price_223(vloc__207) -> vloc__210 {
                let zero_value_for_type_t_uint256_44 := zero_value_for_split_t_uint256()
                vloc__210 := zero_value_for_type_t_uint256_44

                let _45_address := read_from_storage_split_offset_0_t_contract$_IUniswapModel_$53(0x04)
                let expr_212_address := _45_address
                let expr_213_address := convert_t_contract$_IUniswapModel_$53_to_t_address(expr_212_address)
                let expr_213_functionSelector := 0x83dcf6a5
                let expr_214 := 0x00

                if iszero(extcodesize(expr_213_address)) { revert(0, 0) }

                // storage for arguments and returned data
                let _46 := mload(64)
                mstore(_46, shift_left_224(expr_213_functionSelector))
                let _47 := abi_encode_tuple_t_rational_0_by_1__to_t_uint256__fromStack(add(_46, 4) , expr_214)

                let _48 := staticcall(gas(), expr_213_address,  _46, sub(_47, _46), _46, 32)

                if iszero(_48) { revert_forward_1() }

                let expr_215
                if _48 {

                    // update freeMemoryPointer according to dynamic return size
                    mstore(64, add(_46, round_up_to_mul_of_32(returndatasize())))

                    // decode return parameters from external try-call into retVars
                    expr_215 :=  abi_decode_tuple_t_uint256_fromMemory(_46, add(_46, returndatasize()))
                }
                let _49_address := read_from_storage_split_offset_0_t_contract$_IERC20_$38(0x02)
                let expr_216_address := _49_address
                let expr_217_address := convert_t_contract$_IERC20_$38_to_t_address(expr_216_address)
                let expr_217_functionSelector := 0x70a08231
                let _50 := read_from_storage_split_offset_0_t_address(0x01)
                let expr_218 := _50

                if iszero(extcodesize(expr_217_address)) { revert(0, 0) }

                // storage for arguments and returned data
                let _51 := mload(64)
                mstore(_51, shift_left_224(expr_217_functionSelector))
                let _52 := abi_encode_tuple_t_address__to_t_address__fromStack(add(_51, 4) , expr_218)

                let _53 := staticcall(gas(), expr_217_address,  _51, sub(_52, _51), _51, 32)

                if iszero(_53) { revert_forward_1() }

                let expr_219
                if _53 {

                    // update freeMemoryPointer according to dynamic return size
                    mstore(64, add(_51, round_up_to_mul_of_32(returndatasize())))

                    // decode return parameters from external try-call into retVars
                    expr_219 :=  abi_decode_tuple_t_uint256_fromMemory(_51, add(_51, returndatasize()))
                }
                let expr_220 := checked_div_t_uint256(expr_215, expr_219)

                vloc__210 := expr_220
                leave

            }

            function fun_setPoolAddresses_104(vloc_ethAddress_74, vloc_dvtAddress_76, vloc_uAddr_78) {

                let _1 := vloc_dvtAddress_76
                let expr_83 := _1
                let expr_84_address := convert_t_address_to_t_contract$_IERC20_$38(expr_83)
                update_storage_value_offset_0t_contract$_IERC20_$38_to_t_contract$_IERC20_$38(0x02, expr_84_address)
                let expr_85_address := expr_84_address
                let _2 := vloc_ethAddress_74
                let expr_89 := _2
                let expr_90_address := convert_t_address_to_t_contract$_IERC20_$38(expr_89)
                update_storage_value_offset_0t_contract$_IERC20_$38_to_t_contract$_IERC20_$38(0x03, expr_90_address)
                let expr_91_address := expr_90_address
                let _3 := vloc_uAddr_78
                let expr_95 := _3
                let expr_96_address := convert_t_address_to_t_contract$_IUniswapModel_$53(expr_95)
                update_storage_value_offset_0t_contract$_IUniswapModel_$53_to_t_contract$_IUniswapModel_$53(0x04, expr_96_address)
                let expr_97_address := expr_96_address
                let _4 := vloc_uAddr_78
                let expr_100 := _4
                update_storage_value_offset_0t_address_to_t_address(0x01, expr_100)
                let expr_101 := expr_100

            }

            function getter_fun_deposits_57(key_0) -> ret {

                let slot := 0
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(slot, key_0)

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_dvtPool_62() -> ret_address {

                let slot := 2
                let offset := 0

                ret_address := read_from_storage_split_dynamic_t_contract$_IERC20_$38(slot, offset)

            }

            function getter_fun_ethPool_65() -> ret_address {

                let slot := 3
                let offset := 0

                ret_address := read_from_storage_split_dynamic_t_contract$_IERC20_$38(slot, offset)

            }

            function getter_fun_uniswapAddress_59() -> ret {

                let slot := 1
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

            }

            function getter_fun_uniswap_68() -> ret_address {

                let slot := 4
                let offset := 0

                ret_address := read_from_storage_split_dynamic_t_contract$_IUniswapModel_$53(slot, offset)

            }

            function mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function panic_error_0x11() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x11)
                revert(0, 0x24)
            }

            function panic_error_0x12() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x12)
                revert(0, 0x24)
            }

            function panic_error_0x41() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x41)
                revert(0, 0x24)
            }

            function prepare_store_t_address(value) -> ret {
                ret := value
            }

            function prepare_store_t_contract$_IERC20_$38(value) -> ret {
                ret := value
            }

            function prepare_store_t_contract$_IUniswapModel_$53(value) -> ret {
                ret := value
            }

            function prepare_store_t_uint256(value) -> ret {
                ret := value
            }

            function read_from_storage_split_dynamic_t_address(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_address(sload(slot), offset)

            }

            function read_from_storage_split_dynamic_t_contract$_IERC20_$38(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_contract$_IERC20_$38(sload(slot), offset)

            }

            function read_from_storage_split_dynamic_t_contract$_IUniswapModel_$53(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_contract$_IUniswapModel_$53(sload(slot), offset)

            }

            function read_from_storage_split_dynamic_t_uint256(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_uint256(sload(slot), offset)

            }

            function read_from_storage_split_offset_0_t_address(slot) -> value {
                value := extract_from_storage_value_offset_0t_address(sload(slot))

            }

            function read_from_storage_split_offset_0_t_contract$_IERC20_$38(slot) -> value {
                value := extract_from_storage_value_offset_0t_contract$_IERC20_$38(sload(slot))

            }

            function read_from_storage_split_offset_0_t_contract$_IUniswapModel_$53(slot) -> value {
                value := extract_from_storage_value_offset_0t_contract$_IUniswapModel_$53(sload(slot))

            }

            function read_from_storage_split_offset_0_t_uint256(slot) -> value {
                value := extract_from_storage_value_offset_0t_uint256(sload(slot))

            }

            function require_helper(condition) {
                if iszero(condition) { revert(0, 0) }
            }

            function revert_forward_1() {
                returndatacopy(0, 0, returndatasize())
                revert(0, returndatasize())
            }

            function round_up_to_mul_of_32(value) -> result {
                result := and(add(value, 31), not(31))
            }

            function shift_left_0(value) -> newValue {
                newValue :=

                shl(0, value)

            }

            function shift_left_224(value) -> newValue {
                newValue :=

                shl(224, value)

            }

            function shift_right_0_unsigned(value) -> newValue {
                newValue :=

                shr(0, value)

            }

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

            function shift_right_unsigned_dynamic(bits, value) -> newValue {
                newValue :=

                shr(bits, value)

            }

            function update_byte_slice_20_shift_0(value, toInsert) -> result {
                let mask := 0xffffffffffffffffffffffffffffffffffffffff
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_byte_slice_32_shift_0(value, toInsert) -> result {
                let mask := 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_storage_value_offset_0t_address_to_t_address(slot, value_0) {
                let convertedValue_0 := convert_t_address_to_t_address(value_0)
                sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address(convertedValue_0)))
            }

            function update_storage_value_offset_0t_contract$_IERC20_$38_to_t_contract$_IERC20_$38(slot, value_0) {
                let convertedValue_0 := convert_t_contract$_IERC20_$38_to_t_contract$_IERC20_$38(value_0)
                sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_contract$_IERC20_$38(convertedValue_0)))
            }

            function update_storage_value_offset_0t_contract$_IUniswapModel_$53_to_t_contract$_IUniswapModel_$53(slot, value_0) {
                let convertedValue_0 := convert_t_contract$_IUniswapModel_$53_to_t_contract$_IUniswapModel_$53(value_0)
                sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_contract$_IUniswapModel_$53(convertedValue_0)))
            }

            function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
                let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
                sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
            }

            function validator_revert_t_address(value) {
                if iszero(eq(value, cleanup_t_address(value))) { revert(0, 0) }
            }

            function validator_revert_t_bool(value) {
                if iszero(eq(value, cleanup_t_bool(value))) { revert(0, 0) }
            }

            function validator_revert_t_uint256(value) {
                if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
            }

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

        }

    }

}

