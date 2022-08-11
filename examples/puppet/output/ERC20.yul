
/// @use-src 0:"ERC20.sol"
object "ERC20_236" {
    code {
        /// @src 0:58:1389  "contract ERC20 {..."
        mstore(64, memoryguard(128))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        constructor_ERC20_236()

        let _1 := allocate_unbounded()
        codecopy(_1, dataoffset("ERC20_236_deployed"), datasize("ERC20_236_deployed"))

        return(_1, datasize("ERC20_236_deployed"))

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
            revert(0, 0)
        }

        /// @ast-id 97
        /// @src 0:199:215  "constructor() {}"
        function constructor_ERC20_236() {

            /// @src 0:199:215  "constructor() {}"

        }
        /// @src 0:58:1389  "contract ERC20 {..."

    }
    /// @use-src 0:"ERC20.sol"
    object "ERC20_236_deployed" {
        code {
            /// @src 0:58:1389  "contract ERC20 {..."
            mstore(64, memoryguard(128))

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x095ea7b3
                {
                    // approve(address,uint256)

                    external_fun_approve_221()
                }

                case 0x23b872dd
                {
                    // transferFrom(address,address,uint256)

                    external_fun_transferFrom_141()
                }

                case 0x27e235e3
                {
                    // balances(address)

                    external_fun_balances_87()
                }

                case 0x70a08231
                {
                    // balanceOf(address)

                    external_fun_balanceOf_153()
                }

                case 0xa9059cbb
                {
                    // transfer(address,uint256)

                    external_fun_transfer_200()
                }

                case 0xdac3bd85
                {
                    // eurus_set_balances(address,uint256)

                    external_fun_eurus_set_balances_235()
                }

                case 0xf4b16045
                {
                    // approved(address,address)

                    external_fun_approved_93()
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

            function external_fun_approve_221() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1 :=  abi_decode_tuple_t_addresst_uint256(4, calldatasize())
                let ret_0 :=  fun_approve_221(param_0, param_1)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

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

            function external_fun_transferFrom_141() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1, param_2 :=  abi_decode_tuple_t_addresst_addresst_uint256(4, calldatasize())
                let ret_0 :=  fun_transferFrom_141(param_0, param_1, param_2)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

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

            /// @ast-id 87
            /// @src 0:80:123  "mapping(address => uint256) public balances"
            function getter_fun_balances_87(key_0) -> ret {

                let slot := 0
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(slot, key_0)

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }
            /// @src 0:58:1389  "contract ERC20 {..."

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple_t_uint256__to_t_uint256__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

            }

            function external_fun_balances_87() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                let ret_0 :=  getter_fun_balances_87(param_0)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_balanceOf_153() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                let ret_0 :=  fun_balanceOf_153(param_0)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_transfer_200() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1 :=  abi_decode_tuple_t_addresst_uint256(4, calldatasize())
                let ret_0 :=  fun_transfer_200(param_0, param_1)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function external_fun_eurus_set_balances_235() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1 :=  abi_decode_tuple_t_addresst_uint256(4, calldatasize())
                fun_eurus_set_balances_235(param_0, param_1)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

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

            function mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_uint256_$_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            /// @ast-id 93
            /// @src 0:129:192  "mapping(address => mapping(address => uint256)) public approved"
            function getter_fun_approved_93(key_0, key_1) -> ret {

                let slot := 1
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_uint256_$_$_of_t_address(slot, key_0)

                slot := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(slot, key_1)

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }
            /// @src 0:58:1389  "contract ERC20 {..."

            function external_fun_approved_93() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1 :=  abi_decode_tuple_t_addresst_address(4, calldatasize())
                let ret_0 :=  getter_fun_approved_93(param_0, param_1)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

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

            /// @ast-id 141
            /// @src 0:221:586  "function transferFrom(address from, address to, uint256 amount) external returns (bool) {..."
            function fun_transferFrom_141(var_from_99, var_to_101, var_amount_103) -> var__106 {
                /// @src 0:303:307  "bool"
                let zero_t_bool_1 := zero_value_for_split_t_bool()
                var__106 := zero_t_bool_1

                /// @src 0:374:382  "balances"
                let _2 := 0x00
                let expr_108 := _2
                /// @src 0:383:387  "from"
                let _3 := var_from_99
                let expr_109 := _3
                /// @src 0:374:388  "balances[from]"
                let _4 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_108,expr_109)
                let _5 := read_from_storage_split_offset_0_t_uint256(_4)
                let expr_110 := _5
                /// @src 0:389:395  "amount"
                let _6 := var_amount_103
                let expr_111 := _6
                /// @src 0:374:395  "balances[from]<amount"
                let expr_112 := lt(cleanup_t_uint256(expr_110), cleanup_t_uint256(expr_111))
                /// @src 0:370:580  "if (balances[from]<amount) {..."
                switch expr_112
                case 0 {
                    /// @src 0:471:479  "balances"
                    let _7 := 0x00
                    let expr_119 := _7
                    /// @src 0:480:484  "from"
                    let _8 := var_from_99
                    let expr_120 := _8
                    /// @src 0:471:485  "balances[from]"
                    let _9 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_119,expr_120)
                    let _10 := read_from_storage_split_offset_0_t_uint256(_9)
                    let expr_121 := _10
                    /// @src 0:488:494  "amount"
                    let _11 := var_amount_103
                    let expr_122 := _11
                    /// @src 0:471:494  "balances[from] - amount"
                    let expr_123 := checked_sub_t_uint256(expr_121, expr_122)

                    /// @src 0:454:462  "balances"
                    let _12 := 0x00
                    let expr_116 := _12
                    /// @src 0:463:467  "from"
                    let _13 := var_from_99
                    let expr_117 := _13
                    /// @src 0:454:468  "balances[from]"
                    let _14 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_116,expr_117)
                    /// @src 0:454:494  "balances[from] = balances[from] - amount"
                    update_storage_value_offset_0t_uint256_to_t_uint256(_14, expr_123)
                    let expr_124 := expr_123
                    /// @src 0:523:531  "balances"
                    let _15 := 0x00
                    let expr_129 := _15
                    /// @src 0:532:534  "to"
                    let _16 := var_to_101
                    let expr_130 := _16
                    /// @src 0:523:535  "balances[to]"
                    let _17 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_129,expr_130)
                    let _18 := read_from_storage_split_offset_0_t_uint256(_17)
                    let expr_131 := _18
                    /// @src 0:538:544  "amount"
                    let _19 := var_amount_103
                    let expr_132 := _19
                    /// @src 0:523:544  "balances[to] + amount"
                    let expr_133 := checked_add_t_uint256(expr_131, expr_132)

                    /// @src 0:508:516  "balances"
                    let _20 := 0x00
                    let expr_126 := _20
                    /// @src 0:517:519  "to"
                    let _21 := var_to_101
                    let expr_127 := _21
                    /// @src 0:508:520  "balances[to]"
                    let _22 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_126,expr_127)
                    /// @src 0:508:544  "balances[to] = balances[to] + amount"
                    update_storage_value_offset_0t_uint256_to_t_uint256(_22, expr_133)
                    let expr_134 := expr_133
                    /// @src 0:565:569  "true"
                    let expr_136 := 0x01
                    /// @src 0:558:569  "return true"
                    var__106 := expr_136
                    leave
                    /// @src 0:370:580  "if (balances[from]<amount) {..."
                }
                default {
                    /// @src 0:418:423  "false"
                    let expr_113 := 0x00
                    /// @src 0:411:423  "return false"
                    var__106 := expr_113
                    leave
                    /// @src 0:370:580  "if (balances[from]<amount) {..."
                }

            }
            /// @src 0:58:1389  "contract ERC20 {..."

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

            /// @ast-id 153
            /// @src 0:592:701  "function balanceOf(address account) external view returns (uint256) {..."
            function fun_balanceOf_153(var_account_143) -> var__146 {
                /// @src 0:651:658  "uint256"
                let zero_t_uint256_23 := zero_value_for_split_t_uint256()
                var__146 := zero_t_uint256_23

                /// @src 0:677:685  "balances"
                let _24 := 0x00
                let expr_148 := _24
                /// @src 0:686:693  "account"
                let _25 := var_account_143
                let expr_149 := _25
                /// @src 0:677:694  "balances[account]"
                let _26 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_148,expr_149)
                let _27 := read_from_storage_split_offset_0_t_uint256(_26)
                let expr_150 := _27
                /// @src 0:670:694  "return balances[account]"
                var__146 := expr_150
                leave

            }
            /// @src 0:58:1389  "contract ERC20 {..."

            /// @ast-id 200
            /// @src 0:707:1089  "function transfer(address to, uint256 amount) external returns (bool) {..."
            function fun_transfer_200(var_to_155, var_amount_157) -> var__160 {
                /// @src 0:771:775  "bool"
                let zero_t_bool_28 := zero_value_for_split_t_bool()
                var__160 := zero_t_bool_28

                /// @src 0:802:812  "msg.sender"
                let expr_165 := caller()
                /// @src 0:787:812  "address from = msg.sender"
                let var_from_163 := expr_165
                /// @src 0:877:885  "balances"
                let _29 := 0x00
                let expr_167 := _29
                /// @src 0:886:890  "from"
                let _30 := var_from_163
                let expr_168 := _30
                /// @src 0:877:891  "balances[from]"
                let _31 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_167,expr_168)
                let _32 := read_from_storage_split_offset_0_t_uint256(_31)
                let expr_169 := _32
                /// @src 0:892:898  "amount"
                let _33 := var_amount_157
                let expr_170 := _33
                /// @src 0:877:898  "balances[from]<amount"
                let expr_171 := lt(cleanup_t_uint256(expr_169), cleanup_t_uint256(expr_170))
                /// @src 0:873:1083  "if (balances[from]<amount) {..."
                switch expr_171
                case 0 {
                    /// @src 0:974:982  "balances"
                    let _34 := 0x00
                    let expr_178 := _34
                    /// @src 0:983:987  "from"
                    let _35 := var_from_163
                    let expr_179 := _35
                    /// @src 0:974:988  "balances[from]"
                    let _36 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_178,expr_179)
                    let _37 := read_from_storage_split_offset_0_t_uint256(_36)
                    let expr_180 := _37
                    /// @src 0:991:997  "amount"
                    let _38 := var_amount_157
                    let expr_181 := _38
                    /// @src 0:974:997  "balances[from] - amount"
                    let expr_182 := checked_sub_t_uint256(expr_180, expr_181)

                    /// @src 0:957:965  "balances"
                    let _39 := 0x00
                    let expr_175 := _39
                    /// @src 0:966:970  "from"
                    let _40 := var_from_163
                    let expr_176 := _40
                    /// @src 0:957:971  "balances[from]"
                    let _41 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_175,expr_176)
                    /// @src 0:957:997  "balances[from] = balances[from] - amount"
                    update_storage_value_offset_0t_uint256_to_t_uint256(_41, expr_182)
                    let expr_183 := expr_182
                    /// @src 0:1026:1034  "balances"
                    let _42 := 0x00
                    let expr_188 := _42
                    /// @src 0:1035:1037  "to"
                    let _43 := var_to_155
                    let expr_189 := _43
                    /// @src 0:1026:1038  "balances[to]"
                    let _44 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_188,expr_189)
                    let _45 := read_from_storage_split_offset_0_t_uint256(_44)
                    let expr_190 := _45
                    /// @src 0:1041:1047  "amount"
                    let _46 := var_amount_157
                    let expr_191 := _46
                    /// @src 0:1026:1047  "balances[to] + amount"
                    let expr_192 := checked_add_t_uint256(expr_190, expr_191)

                    /// @src 0:1011:1019  "balances"
                    let _47 := 0x00
                    let expr_185 := _47
                    /// @src 0:1020:1022  "to"
                    let _48 := var_to_155
                    let expr_186 := _48
                    /// @src 0:1011:1023  "balances[to]"
                    let _49 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_185,expr_186)
                    /// @src 0:1011:1047  "balances[to] = balances[to] + amount"
                    update_storage_value_offset_0t_uint256_to_t_uint256(_49, expr_192)
                    let expr_193 := expr_192
                    /// @src 0:1068:1072  "true"
                    let expr_195 := 0x01
                    /// @src 0:1061:1072  "return true"
                    var__160 := expr_195
                    leave
                    /// @src 0:873:1083  "if (balances[from]<amount) {..."
                }
                default {
                    /// @src 0:921:926  "false"
                    let expr_172 := 0x00
                    /// @src 0:914:926  "return false"
                    var__160 := expr_172
                    leave
                    /// @src 0:873:1083  "if (balances[from]<amount) {..."
                }

            }
            /// @src 0:58:1389  "contract ERC20 {..."

            /// @ast-id 221
            /// @src 0:1095:1245  "function approve(address spender, uint256 amount) external returns (bool) {..."
            function fun_approve_221(var_spender_202, var_amount_204) -> var__207 {
                /// @src 0:1163:1167  "bool"
                let zero_t_bool_50 := zero_value_for_split_t_bool()
                var__207 := zero_t_bool_50

                /// @src 0:1211:1217  "amount"
                let _51 := var_amount_204
                let expr_215 := _51
                /// @src 0:1179:1187  "approved"
                let _52 := 0x01
                let expr_209 := _52
                /// @src 0:1188:1198  "msg.sender"
                let expr_211 := caller()
                /// @src 0:1179:1199  "approved[msg.sender]"
                let _53 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_uint256_$_$_of_t_address(expr_209,expr_211)
                let _54 := _53
                let expr_213 := _54
                /// @src 0:1200:1207  "spender"
                let _55 := var_spender_202
                let expr_212 := _55
                /// @src 0:1179:1208  "approved[msg.sender][spender]"
                let _56 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_213,expr_212)
                /// @src 0:1179:1217  "approved[msg.sender][spender] = amount"
                update_storage_value_offset_0t_uint256_to_t_uint256(_56, expr_215)
                let expr_216 := expr_215
                /// @src 0:1234:1238  "true"
                let expr_218 := 0x01
                /// @src 0:1227:1238  "return true"
                var__207 := expr_218
                leave

            }
            /// @src 0:58:1389  "contract ERC20 {..."

            /// @ast-id 235
            /// @src 0:1279:1386  "function eurus_set_balances(address addr, uint256 amount) external {..."
            function fun_eurus_set_balances_235(var_addr_223, var_amount_225) {

                /// @src 0:1373:1379  "amount"
                let _57 := var_amount_225
                let expr_231 := _57
                /// @src 0:1356:1364  "balances"
                let _58 := 0x00
                let expr_228 := _58
                /// @src 0:1365:1369  "addr"
                let _59 := var_addr_223
                let expr_229 := _59
                /// @src 0:1356:1370  "balances[addr]"
                let _60 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_228,expr_229)
                /// @src 0:1356:1379  "balances[addr] = amount"
                update_storage_value_offset_0t_uint256_to_t_uint256(_60, expr_231)
                let expr_232 := expr_231

            }
            /// @src 0:58:1389  "contract ERC20 {..."

        }

        data ".metadata" hex"a2646970667358221220d1702d0c900f092c9701f7013b9af182ff00a7b61c18cf911f2671f82f91581e64736f6c634300080e0033"
    }

}

