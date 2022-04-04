/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "ERC20_154" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_ERC20_154()

        // adapted by Eurus: remove_post_constructor_datacall

        // codecopy(0, dataoffset("ERC20_154_deployed"), datasize("ERC20_154_deployed"))

        // return(0, datasize("ERC20_154_deployed"))

        function constructor_ERC20_154() {

        }

    }
    object "ERC20_154_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x095ea7b3
                {
                    // approve(address,uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_uint256(4, calldatasize())
                    let ret_0 :=  fun_approve_139(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x23b872dd
                {
                    // transferFrom(address,address,uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1, param_2 :=  abi_decode_tuple_t_addresst_addresst_uint256(4, calldatasize())
                    let ret_0 :=  fun_transferFrom_59(param_0, param_1, param_2)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x27e235e3
                {
                    // balances(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  getter_fun_balances_5(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x70a08231
                {
                    // balanceOf(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  fun_balanceOf_71(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xa9059cbb
                {
                    // transfer(address,uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_uint256(4, calldatasize())
                    let ret_0 :=  fun_transfer_118(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xdac3bd85
                {
                    // eurus_set_balances(address,uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_uint256(4, calldatasize())
                    fun_eurus_set_balances_153(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xf4b16045
                {
                    // approved(address,address)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_address(4, calldatasize())
                    let ret_0 :=  getter_fun_approved_11(param_0, param_1)
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

            function abi_decode_t_uint256(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_uint256(value)
            }

            function abi_decode_tuple_t_address(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {

                    let offset := 0

                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

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

            function abi_decode_tuple_t_addresst_addresst_uint256(headStart, dataEnd) -> value0, value1, value2 {
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

                    value2 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_t_addresst_uint256(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert(0, 0) }

                {

                    let offset := 0

                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 32

                    value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_t_bool_to_t_bool_fromStack(value, pos) {
                mstore(pos, cleanup_t_bool(value))
            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function abi_encode_tuple_t_bool__to_t_bool__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_bool_to_t_bool_fromStack(value0,  add(headStart, 0))

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

            function checked_sub_t_uint256(x, y) -> diff {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                if lt(x, y) { panic_error_0x11() }

                diff := sub(x, y)
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

            function convert_t_uint160_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_uint160_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_uint256_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function extract_from_storage_value_dynamict_uint256(slot_value, offset) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function fun_approve_139(vloc_spender_120, vloc_amount_122) -> vloc__125 {
                let zero_value_for_type_t_bool_50 := zero_value_for_split_t_bool()
                vloc__125 := zero_value_for_type_t_bool_50

                let _51 := vloc_amount_122
                let expr_133 := _51
                let _52 := 0x01
                let expr_127 := _52
                let expr_129 := caller()
                let _53 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_uint256_$_$_of_t_address(expr_127,expr_129)
                let _54 := _53
                let expr_131 := _54
                let _55 := vloc_spender_120
                let expr_130 := _55
                let _56 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_131,expr_130)
                update_storage_value_offset_0t_uint256_to_t_uint256(_56, expr_133)
                let expr_134 := expr_133
                let expr_136 := 0x01
                vloc__125 := expr_136
                leave

            }

            function fun_balanceOf_71(vloc_account_61) -> vloc__64 {
                let zero_value_for_type_t_uint256_23 := zero_value_for_split_t_uint256()
                vloc__64 := zero_value_for_type_t_uint256_23

                let _24 := 0x00
                let expr_66 := _24
                let _25 := vloc_account_61
                let expr_67 := _25
                let _26 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_66,expr_67)
                let _27 := read_from_storage_split_offset_0_t_uint256(_26)
                let expr_68 := _27
                vloc__64 := expr_68
                leave

            }

            function fun_eurus_set_balances_153(vloc_addr_141, vloc_amount_143) {

                let _57 := vloc_amount_143
                let expr_149 := _57
                let _58 := 0x00
                let expr_146 := _58
                let _59 := vloc_addr_141
                let expr_147 := _59
                let _60 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_146,expr_147)
                update_storage_value_offset_0t_uint256_to_t_uint256(_60, expr_149)
                let expr_150 := expr_149

            }

            function fun_transferFrom_59(vloc_from_17, vloc_to_19, vloc_amount_21) -> vloc__24 {
                let zero_value_for_type_t_bool_1 := zero_value_for_split_t_bool()
                vloc__24 := zero_value_for_type_t_bool_1

                let _2 := 0x00
                let expr_26 := _2
                let _3 := vloc_from_17
                let expr_27 := _3
                let _4 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_26,expr_27)
                let _5 := read_from_storage_split_offset_0_t_uint256(_4)
                let expr_28 := _5
                let _6 := vloc_amount_21
                let expr_29 := _6
                let expr_30 := lt(cleanup_t_uint256(expr_28), cleanup_t_uint256(expr_29))
                switch expr_30
                case 0 {
                    let _7 := 0x00
                    let expr_37 := _7
                    let _8 := vloc_from_17
                    let expr_38 := _8
                    let _9 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_37,expr_38)
                    let _10 := read_from_storage_split_offset_0_t_uint256(_9)
                    let expr_39 := _10
                    let _11 := vloc_amount_21
                    let expr_40 := _11
                    let expr_41 := checked_sub_t_uint256(expr_39, expr_40)

                    let _12 := 0x00
                    let expr_34 := _12
                    let _13 := vloc_from_17
                    let expr_35 := _13
                    let _14 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_34,expr_35)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_14, expr_41)
                    let expr_42 := expr_41
                    let _15 := 0x00
                    let expr_47 := _15
                    let _16 := vloc_to_19
                    let expr_48 := _16
                    let _17 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_47,expr_48)
                    let _18 := read_from_storage_split_offset_0_t_uint256(_17)
                    let expr_49 := _18
                    let _19 := vloc_amount_21
                    let expr_50 := _19
                    let expr_51 := checked_add_t_uint256(expr_49, expr_50)

                    let _20 := 0x00
                    let expr_44 := _20
                    let _21 := vloc_to_19
                    let expr_45 := _21
                    let _22 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_44,expr_45)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_22, expr_51)
                    let expr_52 := expr_51
                    let expr_54 := 0x01
                    vloc__24 := expr_54
                    leave
                }
                default {
                    let expr_31 := 0x00
                    vloc__24 := expr_31
                    leave
                }

            }

            function fun_transfer_118(vloc_to_73, vloc_amount_75) -> vloc__78 {
                let zero_value_for_type_t_bool_28 := zero_value_for_split_t_bool()
                vloc__78 := zero_value_for_type_t_bool_28

                let expr_83 := caller()
                let vloc_from_81 := expr_83
                let _29 := 0x00
                let expr_85 := _29
                let _30 := vloc_from_81
                let expr_86 := _30
                let _31 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_85,expr_86)
                let _32 := read_from_storage_split_offset_0_t_uint256(_31)
                let expr_87 := _32
                let _33 := vloc_amount_75
                let expr_88 := _33
                let expr_89 := lt(cleanup_t_uint256(expr_87), cleanup_t_uint256(expr_88))
                switch expr_89
                case 0 {
                    let _34 := 0x00
                    let expr_96 := _34
                    let _35 := vloc_from_81
                    let expr_97 := _35
                    let _36 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_96,expr_97)
                    let _37 := read_from_storage_split_offset_0_t_uint256(_36)
                    let expr_98 := _37
                    let _38 := vloc_amount_75
                    let expr_99 := _38
                    let expr_100 := checked_sub_t_uint256(expr_98, expr_99)

                    let _39 := 0x00
                    let expr_93 := _39
                    let _40 := vloc_from_81
                    let expr_94 := _40
                    let _41 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_93,expr_94)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_41, expr_100)
                    let expr_101 := expr_100
                    let _42 := 0x00
                    let expr_106 := _42
                    let _43 := vloc_to_73
                    let expr_107 := _43
                    let _44 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_106,expr_107)
                    let _45 := read_from_storage_split_offset_0_t_uint256(_44)
                    let expr_108 := _45
                    let _46 := vloc_amount_75
                    let expr_109 := _46
                    let expr_110 := checked_add_t_uint256(expr_108, expr_109)

                    let _47 := 0x00
                    let expr_103 := _47
                    let _48 := vloc_to_73
                    let expr_104 := _48
                    let _49 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_103,expr_104)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_49, expr_110)
                    let expr_111 := expr_110
                    let expr_113 := 0x01
                    vloc__78 := expr_113
                    leave
                }
                default {
                    let expr_90 := 0x00
                    vloc__78 := expr_90
                    leave
                }

            }

            function getter_fun_approved_11(key_0, key_1) -> ret {

                let slot := 1
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_uint256_$_$_of_t_address(slot, key_0)

                slot := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(slot, key_1)

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_balances_5(key_0) -> ret {

                let slot := 0
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(slot, key_0)

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_uint256_$_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
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

            function panic_error_0x41() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x41)
                revert(0, 0x24)
            }

            function prepare_store_t_uint256(value) -> ret {
                ret := value
            }

            function read_from_storage_split_dynamic_t_uint256(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_uint256(sload(slot), offset)

            }

            function read_from_storage_split_offset_0_t_uint256(slot) -> value {
                value := extract_from_storage_value_offset_0t_uint256(sload(slot))

            }

            function shift_left_0(value) -> newValue {
                newValue :=

                shl(0, value)

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

            function update_byte_slice_32_shift_0(value, toInsert) -> result {
                let mask := 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
                let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
                sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
            }

            function validator_revert_t_address(value) {
                if iszero(eq(value, cleanup_t_address(value))) { revert(0, 0) }
            }

            function validator_revert_t_uint256(value) {
                if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
            }

            function zero_value_for_split_t_bool() -> ret {
                ret := 0
            }

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

        }

    }

}

