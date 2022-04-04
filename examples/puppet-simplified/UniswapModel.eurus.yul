/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "UniswapModel_181" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_UniswapModel_181()

        // adapted by Eurus: remove_post_constructor_datacall

        // codecopy(0, dataoffset("UniswapModel_181_deployed"), datasize("UniswapModel_181_deployed"))

        // return(0, datasize("UniswapModel_181_deployed"))

        function constructor_UniswapModel_181() {

        }

    }
    object "UniswapModel_181_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x51b9f5b1
                {
                    // swapDVT4ETH(uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    fun_swapDVT4ETH_180(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x83dcf6a5
                {
                    // getETHBalance(uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    let ret_0 :=  fun_getETHBalance_100(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xa7be7948
                {
                    // setPoolAddresses(address,address)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_address(4, calldatasize())
                    fun_setPoolAddresses_68(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xcabaffcf
                {
                    // dvtPool()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_dvtPool_41()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_contract$_IERC20_$38__to_t_contract$_IERC20_$38__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xf16673a4
                {
                    // ethPool()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_ethPool_44()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_contract$_IERC20_$38__to_t_contract$_IERC20_$38__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xfadbf78c
                {
                    // getDVTBalance(uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    let ret_0 :=  fun_getDVTBalance_84(param_0)
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

            function abi_decode_tuple_t_addresst_address(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert(0, 0) }

                {

                    let offset := 0

                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 32

                    value1 := abi_decode_t_address(add(headStart, offset), dataEnd)
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

            function abi_encode_t_address_to_t_address_fromStack(value, pos) {
                mstore(pos, cleanup_t_address(value))
            }

            function abi_encode_t_contract$_IERC20_$38_to_t_address_fromStack(value, pos) {
                mstore(pos, convert_t_contract$_IERC20_$38_to_t_address(value))
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

            function abi_encode_tuple_t_contract$_IERC20_$38__to_t_contract$_IERC20_$38__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_contract$_IERC20_$38_to_t_address_fromStack(value0,  add(headStart, 0))

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

            function cleanup_from_storage_t_contract$_IERC20_$38(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
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

            function convert_t_address_to_t_contract$_IERC20_$38(value) -> converted {
                converted := convert_t_uint160_to_t_contract$_IERC20_$38(value)
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

            function convert_t_contract$_UniswapModel_$181_to_t_address(value) -> converted {
                converted := convert_t_contract$_UniswapModel_$181_to_t_uint160(value)
            }

            function convert_t_contract$_UniswapModel_$181_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_uint160_to_t_contract$_IERC20_$38(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function extract_from_storage_value_dynamict_contract$_IERC20_$38(slot_value, offset) -> value {
                value := cleanup_from_storage_t_contract$_IERC20_$38(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_offset_0t_contract$_IERC20_$38(slot_value) -> value {
                value := cleanup_from_storage_t_contract$_IERC20_$38(shift_right_0_unsigned(slot_value))
            }

            function fun_getDVTBalance_84(vloc__70) -> vloc__73 {
                let zero_value_for_type_t_uint256_3 := zero_value_for_split_t_uint256()
                vloc__73 := zero_value_for_type_t_uint256_3

                let _4_address := read_from_storage_split_offset_0_t_contract$_IERC20_$38(0x00)
                let expr_75_address := _4_address
                let expr_76_address := convert_t_contract$_IERC20_$38_to_t_address(expr_75_address)
                let expr_76_functionSelector := 0x70a08231
                let expr_79_address := address()
                let expr_80 := convert_t_contract$_UniswapModel_$181_to_t_address(expr_79_address)

                if iszero(extcodesize(expr_76_address)) { revert(0, 0) }

                // storage for arguments and returned data
                let _5 := mload(64)
                mstore(_5, shift_left_224(expr_76_functionSelector))
                let _6 := abi_encode_tuple_t_address__to_t_address__fromStack(add(_5, 4) , expr_80)

                let _7 := staticcall(gas(), expr_76_address,  _5, sub(_6, _5), _5, 32)

                if iszero(_7) { revert_forward_1() }

                let expr_81
                if _7 {

                    // update freeMemoryPointer according to dynamic return size
                    mstore(64, add(_5, round_up_to_mul_of_32(returndatasize())))

                    // decode return parameters from external try-call into retVars
                    expr_81 :=  abi_decode_tuple_t_uint256_fromMemory(_5, add(_5, returndatasize()))
                }
                vloc__73 := expr_81
                leave

            }

            function fun_getETHBalance_100(vloc__86) -> vloc__89 {
                let zero_value_for_type_t_uint256_8 := zero_value_for_split_t_uint256()
                vloc__89 := zero_value_for_type_t_uint256_8

                let _9_address := read_from_storage_split_offset_0_t_contract$_IERC20_$38(0x01)
                let expr_91_address := _9_address
                let expr_92_address := convert_t_contract$_IERC20_$38_to_t_address(expr_91_address)
                let expr_92_functionSelector := 0x70a08231
                let expr_95_address := address()
                let expr_96 := convert_t_contract$_UniswapModel_$181_to_t_address(expr_95_address)

                if iszero(extcodesize(expr_92_address)) { revert(0, 0) }

                // storage for arguments and returned data
                let _10 := mload(64)
                mstore(_10, shift_left_224(expr_92_functionSelector))
                let _11 := abi_encode_tuple_t_address__to_t_address__fromStack(add(_10, 4) , expr_96)

                let _12 := staticcall(gas(), expr_92_address,  _10, sub(_11, _10), _10, 32)

                if iszero(_12) { revert_forward_1() }

                let expr_97
                if _12 {

                    // update freeMemoryPointer according to dynamic return size
                    mstore(64, add(_10, round_up_to_mul_of_32(returndatasize())))

                    // decode return parameters from external try-call into retVars
                    expr_97 :=  abi_decode_tuple_t_uint256_fromMemory(_10, add(_10, returndatasize()))
                }
                vloc__89 := expr_97
                leave

            }

            function fun_setPoolAddresses_68(vloc_dvtAddress_50, vloc_ethAddress_52) {

                let _1 := vloc_dvtAddress_50
                let expr_57 := _1
                let expr_58_address := convert_t_address_to_t_contract$_IERC20_$38(expr_57)
                update_storage_value_offset_0t_contract$_IERC20_$38_to_t_contract$_IERC20_$38(0x00, expr_58_address)
                let expr_59_address := expr_58_address
                let _2 := vloc_ethAddress_52
                let expr_63 := _2
                let expr_64_address := convert_t_address_to_t_contract$_IERC20_$38(expr_63)
                update_storage_value_offset_0t_contract$_IERC20_$38_to_t_contract$_IERC20_$38(0x01, expr_64_address)
                let expr_65_address := expr_64_address

            }

            function fun_swapDVT4ETH_180(vloc_v_102) {

                let _13_address := read_from_storage_split_offset_0_t_contract$_IERC20_$38(0x00)
                let expr_107_address := _13_address
                let expr_108_address := convert_t_contract$_IERC20_$38_to_t_address(expr_107_address)
                let expr_108_functionSelector := 0x70a08231
                let expr_111_address := address()
                let expr_112 := convert_t_contract$_UniswapModel_$181_to_t_address(expr_111_address)

                if iszero(extcodesize(expr_108_address)) { revert(0, 0) }

                // storage for arguments and returned data
                let _14 := mload(64)
                mstore(_14, shift_left_224(expr_108_functionSelector))
                let _15 := abi_encode_tuple_t_address__to_t_address__fromStack(add(_14, 4) , expr_112)

                let _16 := staticcall(gas(), expr_108_address,  _14, sub(_15, _14), _14, 32)

                if iszero(_16) { revert_forward_1() }

                let expr_113
                if _16 {

                    // update freeMemoryPointer according to dynamic return size
                    mstore(64, add(_14, round_up_to_mul_of_32(returndatasize())))

                    // decode return parameters from external try-call into retVars
                    expr_113 :=  abi_decode_tuple_t_uint256_fromMemory(_14, add(_14, returndatasize()))
                }
                let vloc_DVTBalance_106 := expr_113
                let _17_address := read_from_storage_split_offset_0_t_contract$_IERC20_$38(0x01)
                let expr_117_address := _17_address
                let expr_118_address := convert_t_contract$_IERC20_$38_to_t_address(expr_117_address)
                let expr_118_functionSelector := 0x70a08231
                let expr_121_address := address()
                let expr_122 := convert_t_contract$_UniswapModel_$181_to_t_address(expr_121_address)

                if iszero(extcodesize(expr_118_address)) { revert(0, 0) }

                // storage for arguments and returned data
                let _18 := mload(64)
                mstore(_18, shift_left_224(expr_118_functionSelector))
                let _19 := abi_encode_tuple_t_address__to_t_address__fromStack(add(_18, 4) , expr_122)

                let _20 := staticcall(gas(), expr_118_address,  _18, sub(_19, _18), _18, 32)

                if iszero(_20) { revert_forward_1() }

                let expr_123
                if _20 {

                    // update freeMemoryPointer according to dynamic return size
                    mstore(64, add(_18, round_up_to_mul_of_32(returndatasize())))

                    // decode return parameters from external try-call into retVars
                    expr_123 :=  abi_decode_tuple_t_uint256_fromMemory(_18, add(_18, returndatasize()))
                }
                let vloc_ETHBalance_116 := expr_123
                let _21 := vloc_DVTBalance_106
                let expr_127 := _21
                let _22 := vloc_ETHBalance_116
                let expr_128 := _22
                let expr_129 := checked_mul_t_uint256(expr_127, expr_128)

                let vloc_k_126 := expr_129
                let _23 := vloc_DVTBalance_106
                let expr_133 := _23
                let _24 := vloc_v_102
                let expr_134 := _24
                let expr_135 := checked_add_t_uint256(expr_133, expr_134)

                let vloc_newDVT_132 := expr_135
                let _25 := vloc_k_126
                let expr_139 := _25
                let _26 := vloc_newDVT_132
                let expr_140 := _26
                let expr_141 := checked_div_t_uint256(expr_139, expr_140)

                let vloc_newETH_138 := expr_141
                let _27 := vloc_ETHBalance_116
                let expr_145 := _27
                let _28 := vloc_newETH_138
                let expr_146 := _28
                let expr_147 := checked_sub_t_uint256(expr_145, expr_146)

                let vloc_s_144 := expr_147
                let _29_address := read_from_storage_split_offset_0_t_contract$_IERC20_$38(0x01)
                let expr_149_address := _29_address
                let expr_151_address := convert_t_contract$_IERC20_$38_to_t_address(expr_149_address)
                let expr_151_functionSelector := 0x23b872dd
                let expr_154_address := address()
                let expr_155 := convert_t_contract$_UniswapModel_$181_to_t_address(expr_154_address)
                let expr_159 := caller()
                let expr_160 := expr_159
                let _30 := vloc_s_144
                let expr_161 := _30

                if iszero(extcodesize(expr_151_address)) { revert(0, 0) }

                // storage for arguments and returned data
                let _31 := mload(64)
                mstore(_31, shift_left_224(expr_151_functionSelector))
                let _32 := abi_encode_tuple_t_address_t_address_t_uint256__to_t_address_t_address_t_uint256__fromStack(add(_31, 4) , expr_155, expr_160, expr_161)

                let _33 := call(gas(), expr_151_address,  0,  _31, sub(_32, _31), _31, 32)

                if iszero(_33) { revert_forward_1() }

                let expr_162
                if _33 {

                    // update freeMemoryPointer according to dynamic return size
                    mstore(64, add(_31, round_up_to_mul_of_32(returndatasize())))

                    // decode return parameters from external try-call into retVars
                    expr_162 :=  abi_decode_tuple_t_bool_fromMemory(_31, add(_31, returndatasize()))
                }
                let _34_address := read_from_storage_split_offset_0_t_contract$_IERC20_$38(0x00)
                let expr_164_address := _34_address
                let expr_166_address := convert_t_contract$_IERC20_$38_to_t_address(expr_164_address)
                let expr_166_functionSelector := 0x23b872dd
                let expr_170 := caller()
                let expr_171 := expr_170
                let expr_174_address := address()
                let expr_175 := convert_t_contract$_UniswapModel_$181_to_t_address(expr_174_address)
                let _35 := vloc_v_102
                let expr_176 := _35

                if iszero(extcodesize(expr_166_address)) { revert(0, 0) }

                // storage for arguments and returned data
                let _36 := mload(64)
                mstore(_36, shift_left_224(expr_166_functionSelector))
                let _37 := abi_encode_tuple_t_address_t_address_t_uint256__to_t_address_t_address_t_uint256__fromStack(add(_36, 4) , expr_171, expr_175, expr_176)

                let _38 := call(gas(), expr_166_address,  0,  _36, sub(_37, _36), _36, 32)

                if iszero(_38) { revert_forward_1() }

                let expr_177
                if _38 {

                    // update freeMemoryPointer according to dynamic return size
                    mstore(64, add(_36, round_up_to_mul_of_32(returndatasize())))

                    // decode return parameters from external try-call into retVars
                    expr_177 :=  abi_decode_tuple_t_bool_fromMemory(_36, add(_36, returndatasize()))
                }

            }

            function getter_fun_dvtPool_41() -> ret_address {

                let slot := 0
                let offset := 0

                ret_address := read_from_storage_split_dynamic_t_contract$_IERC20_$38(slot, offset)

            }

            function getter_fun_ethPool_44() -> ret_address {

                let slot := 1
                let offset := 0

                ret_address := read_from_storage_split_dynamic_t_contract$_IERC20_$38(slot, offset)

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

            function prepare_store_t_contract$_IERC20_$38(value) -> ret {
                ret := value
            }

            function read_from_storage_split_dynamic_t_contract$_IERC20_$38(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_contract$_IERC20_$38(sload(slot), offset)

            }

            function read_from_storage_split_offset_0_t_contract$_IERC20_$38(slot) -> value {
                value := extract_from_storage_value_offset_0t_contract$_IERC20_$38(sload(slot))

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

            function update_storage_value_offset_0t_contract$_IERC20_$38_to_t_contract$_IERC20_$38(slot, value_0) {
                let convertedValue_0 := convert_t_contract$_IERC20_$38_to_t_contract$_IERC20_$38(value_0)
                sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_contract$_IERC20_$38(convertedValue_0)))
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

