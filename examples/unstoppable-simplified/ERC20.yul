/*=====================================================*
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *=====================================================*/


/// @use-src 0:"examples/unstoppable-simplified/ERC20.sol"
object "ERC20_127" {
    code {
        /// @src 0:58:1162  "contract ERC20 {..."
        mstore(64, memoryguard(128))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        constructor_ERC20_127()

        let _1 := allocate_unbounded()
        codecopy(_1, dataoffset("ERC20_127_deployed"), datasize("ERC20_127_deployed"))

        return(_1, datasize("ERC20_127_deployed"))

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
            revert(0, 0)
        }

        /// @ast-id 9
        /// @src 0:130:146  "constructor() {}"
        function constructor_ERC20_127() {

            /// @src 0:130:146  "constructor() {}"

        }
        /// @src 0:58:1162  "contract ERC20 {..."

    }
    /// @use-src 0:"examples/unstoppable-simplified/ERC20.sol"
    object "ERC20_127_deployed" {
        code {
            /// @src 0:58:1162  "contract ERC20 {..."
            mstore(64, memoryguard(128))

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x23b872dd
                {
                    // transferFrom(address,address,uint256)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0, param_1, param_2 :=  abi_decode_tuple_t_addresst_addresst_uint256(4, calldatasize())
                    let ret_0 :=  fun_transferFrom_53(param_0, param_1, param_2)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x27e235e3
                {
                    // balances(address)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  getter_fun_balances_5(param_0)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x70a08231
                {
                    // balanceOf(address)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  fun_balanceOf_65(param_0)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xa9059cbb
                {
                    // transfer(address,uint256)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_uint256(4, calldatasize())
                    let ret_0 :=  fun_transfer_112(param_0, param_1)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xdac3bd85
                {
                    // eurus_set_balances(address,uint256)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_uint256(4, calldatasize())
                    fun_eurus_set_balances_126(param_0, param_1)
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

            function abi_decode_tuple_t_addresst_addresst_uint256(headStart, dataEnd) -> value0, value1, value2 {
                if slt(sub(dataEnd, headStart), 96) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

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

            function cleanup_t_bool(value) -> cleaned {
                cleaned := iszero(iszero(value))
            }

            function abi_encode_t_bool_to_t_bool_fromStack(value, pos) {
                mstore(pos, cleanup_t_bool(value))
            }

            function abi_encode_tuple_t_bool__to_t_bool__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_bool_to_t_bool_fromStack(value0,  add(headStart, 0))

            }

            function abi_decode_tuple_t_address(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

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

            function mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function shift_right_unsigned_dynamic(bits, value) -> newValue {
                newValue :=

                shr(bits, value)

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

            /// @ast-id 5
            /// @src 0:80:123  "mapping(address => uint256) public balances"
            function getter_fun_balances_5(key_0) -> ret {

                let slot := 0
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(slot, key_0)

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }
            /// @src 0:58:1162  "contract ERC20 {..."

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple_t_uint256__to_t_uint256__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

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

            function revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74() {
                revert(0, 0)
            }

            function zero_value_for_split_t_bool() -> ret {
                ret := 0
            }

            function shift_right_0_unsigned(value) -> newValue {
                newValue :=

                shr(0, value)

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

            function checked_sub_t_uint256(x, y) -> diff {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                if lt(x, y) { panic_error_0x11() }

                diff := sub(x, y)
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

            function checked_add_t_uint256(x, y) -> sum {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                // overflow, if x > (maxValue - y)
                if gt(x, sub(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, y)) { panic_error_0x11() }

                sum := add(x, y)
            }

            /// @ast-id 53
            /// @src 0:152:517  "function transferFrom(address from, address to, uint256 amount) external returns (bool) {..."
            function fun_transferFrom_53(var_from_11, var_to_13, var_amount_15) -> var__18 {
                /// @src 0:234:238  "bool"
                let zero_t_bool_1 := zero_value_for_split_t_bool()
                var__18 := zero_t_bool_1

                /// @src 0:305:313  "balances"
                let _2 := 0x00
                let expr_20 := _2
                /// @src 0:314:318  "from"
                let _3 := var_from_11
                let expr_21 := _3
                /// @src 0:305:319  "balances[from]"
                let _4 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_20,expr_21)
                let _5 := read_from_storage_split_offset_0_t_uint256(_4)
                let expr_22 := _5
                /// @src 0:320:326  "amount"
                let _6 := var_amount_15
                let expr_23 := _6
                /// @src 0:305:326  "balances[from]<amount"
                let expr_24 := lt(cleanup_t_uint256(expr_22), cleanup_t_uint256(expr_23))
                /// @src 0:301:511  "if (balances[from]<amount) {..."
                switch expr_24
                case 0 {
                    /// @src 0:402:410  "balances"
                    let _7 := 0x00
                    let expr_31 := _7
                    /// @src 0:411:415  "from"
                    let _8 := var_from_11
                    let expr_32 := _8
                    /// @src 0:402:416  "balances[from]"
                    let _9 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_31,expr_32)
                    let _10 := read_from_storage_split_offset_0_t_uint256(_9)
                    let expr_33 := _10
                    /// @src 0:419:425  "amount"
                    let _11 := var_amount_15
                    let expr_34 := _11
                    /// @src 0:402:425  "balances[from] - amount"
                    let expr_35 := checked_sub_t_uint256(expr_33, expr_34)

                    /// @src 0:385:393  "balances"
                    let _12 := 0x00
                    let expr_28 := _12
                    /// @src 0:394:398  "from"
                    let _13 := var_from_11
                    let expr_29 := _13
                    /// @src 0:385:399  "balances[from]"
                    let _14 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_28,expr_29)
                    /// @src 0:385:425  "balances[from] = balances[from] - amount"
                    update_storage_value_offset_0t_uint256_to_t_uint256(_14, expr_35)
                    let expr_36 := expr_35
                    /// @src 0:454:462  "balances"
                    let _15 := 0x00
                    let expr_41 := _15
                    /// @src 0:463:465  "to"
                    let _16 := var_to_13
                    let expr_42 := _16
                    /// @src 0:454:466  "balances[to]"
                    let _17 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_41,expr_42)
                    let _18 := read_from_storage_split_offset_0_t_uint256(_17)
                    let expr_43 := _18
                    /// @src 0:469:475  "amount"
                    let _19 := var_amount_15
                    let expr_44 := _19
                    /// @src 0:454:475  "balances[to] + amount"
                    let expr_45 := checked_add_t_uint256(expr_43, expr_44)

                    /// @src 0:439:447  "balances"
                    let _20 := 0x00
                    let expr_38 := _20
                    /// @src 0:448:450  "to"
                    let _21 := var_to_13
                    let expr_39 := _21
                    /// @src 0:439:451  "balances[to]"
                    let _22 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_38,expr_39)
                    /// @src 0:439:475  "balances[to] = balances[to] + amount"
                    update_storage_value_offset_0t_uint256_to_t_uint256(_22, expr_45)
                    let expr_46 := expr_45
                    /// @src 0:496:500  "true"
                    let expr_48 := 0x01
                    /// @src 0:489:500  "return true"
                    var__18 := expr_48
                    leave
                    /// @src 0:301:511  "if (balances[from]<amount) {..."
                }
                default {
                    /// @src 0:349:354  "false"
                    let expr_25 := 0x00
                    /// @src 0:342:354  "return false"
                    var__18 := expr_25
                    leave
                    /// @src 0:301:511  "if (balances[from]<amount) {..."
                }

            }
            /// @src 0:58:1162  "contract ERC20 {..."

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

            /// @ast-id 65
            /// @src 0:523:632  "function balanceOf(address account) external view returns (uint256) {..."
            function fun_balanceOf_65(var_account_55) -> var__58 {
                /// @src 0:582:589  "uint256"
                let zero_t_uint256_23 := zero_value_for_split_t_uint256()
                var__58 := zero_t_uint256_23

                /// @src 0:608:616  "balances"
                let _24 := 0x00
                let expr_60 := _24
                /// @src 0:617:624  "account"
                let _25 := var_account_55
                let expr_61 := _25
                /// @src 0:608:625  "balances[account]"
                let _26 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_60,expr_61)
                let _27 := read_from_storage_split_offset_0_t_uint256(_26)
                let expr_62 := _27
                /// @src 0:601:625  "return balances[account]"
                var__58 := expr_62
                leave

            }
            /// @src 0:58:1162  "contract ERC20 {..."

            /// @ast-id 112
            /// @src 0:638:1020  "function transfer(address to, uint256 amount) external returns (bool) {..."
            function fun_transfer_112(var_to_67, var_amount_69) -> var__72 {
                /// @src 0:702:706  "bool"
                let zero_t_bool_28 := zero_value_for_split_t_bool()
                var__72 := zero_t_bool_28

                /// @src 0:733:743  "msg.sender"
                let expr_77 := caller()
                /// @src 0:718:743  "address from = msg.sender"
                let var_from_75 := expr_77
                /// @src 0:808:816  "balances"
                let _29 := 0x00
                let expr_79 := _29
                /// @src 0:817:821  "from"
                let _30 := var_from_75
                let expr_80 := _30
                /// @src 0:808:822  "balances[from]"
                let _31 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_79,expr_80)
                let _32 := read_from_storage_split_offset_0_t_uint256(_31)
                let expr_81 := _32
                /// @src 0:823:829  "amount"
                let _33 := var_amount_69
                let expr_82 := _33
                /// @src 0:808:829  "balances[from]<amount"
                let expr_83 := lt(cleanup_t_uint256(expr_81), cleanup_t_uint256(expr_82))
                /// @src 0:804:1014  "if (balances[from]<amount) {..."
                switch expr_83
                case 0 {
                    /// @src 0:905:913  "balances"
                    let _34 := 0x00
                    let expr_90 := _34
                    /// @src 0:914:918  "from"
                    let _35 := var_from_75
                    let expr_91 := _35
                    /// @src 0:905:919  "balances[from]"
                    let _36 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_90,expr_91)
                    let _37 := read_from_storage_split_offset_0_t_uint256(_36)
                    let expr_92 := _37
                    /// @src 0:922:928  "amount"
                    let _38 := var_amount_69
                    let expr_93 := _38
                    /// @src 0:905:928  "balances[from] - amount"
                    let expr_94 := checked_sub_t_uint256(expr_92, expr_93)

                    /// @src 0:888:896  "balances"
                    let _39 := 0x00
                    let expr_87 := _39
                    /// @src 0:897:901  "from"
                    let _40 := var_from_75
                    let expr_88 := _40
                    /// @src 0:888:902  "balances[from]"
                    let _41 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_87,expr_88)
                    /// @src 0:888:928  "balances[from] = balances[from] - amount"
                    update_storage_value_offset_0t_uint256_to_t_uint256(_41, expr_94)
                    let expr_95 := expr_94
                    /// @src 0:957:965  "balances"
                    let _42 := 0x00
                    let expr_100 := _42
                    /// @src 0:966:968  "to"
                    let _43 := var_to_67
                    let expr_101 := _43
                    /// @src 0:957:969  "balances[to]"
                    let _44 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_100,expr_101)
                    let _45 := read_from_storage_split_offset_0_t_uint256(_44)
                    let expr_102 := _45
                    /// @src 0:972:978  "amount"
                    let _46 := var_amount_69
                    let expr_103 := _46
                    /// @src 0:957:978  "balances[to] + amount"
                    let expr_104 := checked_add_t_uint256(expr_102, expr_103)

                    /// @src 0:942:950  "balances"
                    let _47 := 0x00
                    let expr_97 := _47
                    /// @src 0:951:953  "to"
                    let _48 := var_to_67
                    let expr_98 := _48
                    /// @src 0:942:954  "balances[to]"
                    let _49 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_97,expr_98)
                    /// @src 0:942:978  "balances[to] = balances[to] + amount"
                    update_storage_value_offset_0t_uint256_to_t_uint256(_49, expr_104)
                    let expr_105 := expr_104
                    /// @src 0:999:1003  "true"
                    let expr_107 := 0x01
                    /// @src 0:992:1003  "return true"
                    var__72 := expr_107
                    leave
                    /// @src 0:804:1014  "if (balances[from]<amount) {..."
                }
                default {
                    /// @src 0:852:857  "false"
                    let expr_84 := 0x00
                    /// @src 0:845:857  "return false"
                    var__72 := expr_84
                    leave
                    /// @src 0:804:1014  "if (balances[from]<amount) {..."
                }

            }
            /// @src 0:58:1162  "contract ERC20 {..."

            /// @ast-id 126
            /// @src 0:1052:1159  "function eurus_set_balances(address addr, uint256 amount) external {..."
            function fun_eurus_set_balances_126(var_addr_114, var_amount_116) {

                /// @src 0:1146:1152  "amount"
                let _50 := var_amount_116
                let expr_122 := _50
                /// @src 0:1129:1137  "balances"
                let _51 := 0x00
                let expr_119 := _51
                /// @src 0:1138:1142  "addr"
                let _52 := var_addr_114
                let expr_120 := _52
                /// @src 0:1129:1143  "balances[addr]"
                let _53 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_119,expr_120)
                /// @src 0:1129:1152  "balances[addr] = amount"
                update_storage_value_offset_0t_uint256_to_t_uint256(_53, expr_122)
                let expr_123 := expr_122

            }
            /// @src 0:58:1162  "contract ERC20 {..."

        }

        data ".metadata" hex"a364697066735822122009e473e190950ca22b68286d2b5bbd34c11b5e7f3cb4dce9952db60ad7a51bea6c6578706572696d656e74616cf564736f6c634300080b0041"
    }

}

