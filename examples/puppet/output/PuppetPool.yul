
/// @use-src 2:"PuppetPool.sol"
object "PuppetPool_979" {
    code {
        /// @src 2:143:2435  "contract PuppetPool {..."
        mstore(64, memoryguard(128))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        constructor_PuppetPool_979()

        let _1 := allocate_unbounded()
        codecopy(_1, dataoffset("PuppetPool_979_deployed"), datasize("PuppetPool_979_deployed"))

        return(_1, datasize("PuppetPool_979_deployed"))

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
            revert(0, 0)
        }

        /// @ast-id 784
        /// @src 2:340:357  "constructor () {}"
        function constructor_PuppetPool_979() {

            /// @src 2:340:357  "constructor () {}"

        }
        /// @src 2:143:2435  "contract PuppetPool {..."

    }
    /// @use-src 2:"PuppetPool.sol"
    object "PuppetPool_979_deployed" {
        code {
            /// @src 2:143:2435  "contract PuppetPool {..."
            mstore(64, memoryguard(128))

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x0e2feb05
                {
                    // uniswapAddress()

                    external_fun_uniswapAddress_771()
                }

                case 0x0ecbcdab
                {
                    // borrow(uint256,uint256)

                    external_fun_borrow_884()
                }

                case 0x1a97b88c
                {
                    // eurus_deposit_required(uint256)

                    external_fun_eurus_deposit_required_956()
                }

                case 0x2681f7e4
                {
                    // uniswap()

                    external_fun_uniswap_780()
                }

                case 0x4730bf33
                {
                    // eurus_dep0()

                    external_fun_eurus_dep0_965()
                }

                case 0x8597600f
                {
                    // setPoolAddresses(address,address,address)

                    external_fun_setPoolAddresses_816()
                }

                case 0xbc554c28
                {
                    // calculateDepositRequired(uint256)

                    external_fun_calculateDepositRequired_902()
                }

                case 0xcabaffcf
                {
                    // dvtPool()

                    external_fun_dvtPool_774()
                }

                case 0xe1a7969c
                {
                    // eurus_dep1(uint256)

                    external_fun_eurus_dep1_978()
                }

                case 0xf16673a4
                {
                    // ethPool()

                    external_fun_ethPool_777()
                }

                case 0xf57b1bb4
                {
                    // eurus_oracle_price(uint256)

                    external_fun_eurus_oracle_price_938()
                }

                case 0xfc7e286d
                {
                    // deposits(address)

                    external_fun_deposits_769()
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

            function cleanup_from_storage_t_address(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function extract_from_storage_value_dynamict_address(slot_value, offset) -> value {
                value := cleanup_from_storage_t_address(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function read_from_storage_split_dynamic_t_address(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_address(sload(slot), offset)

            }

            /// @ast-id 771
            /// @src 2:219:248  "address public uniswapAddress"
            function getter_fun_uniswapAddress_771() -> ret {

                let slot := 1
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

            }
            /// @src 2:143:2435  "contract PuppetPool {..."

            function cleanup_t_uint160(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_t_address(value) -> cleaned {
                cleaned := cleanup_t_uint160(value)
            }

            function abi_encode_t_address_to_t_address_fromStack(value, pos) {
                mstore(pos, cleanup_t_address(value))
            }

            function abi_encode_tuple_t_address__to_t_address__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

            }

            function external_fun_uniswapAddress_771() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                let ret_0 :=  getter_fun_uniswapAddress_771()
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

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

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function external_fun_borrow_884() {

                let param_0, param_1 :=  abi_decode_tuple_t_uint256t_uint256(4, calldatasize())
                fun_borrow_884(param_0, param_1)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function abi_decode_tuple_t_uint256(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple_t_uint256__to_t_uint256__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

            }

            function external_fun_eurus_deposit_required_956() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                let ret_0 :=  fun_eurus_deposit_required_956(param_0)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function cleanup_from_storage_t_contract$_UniswapModel_$1143(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function extract_from_storage_value_dynamict_contract$_UniswapModel_$1143(slot_value, offset) -> value {
                value := cleanup_from_storage_t_contract$_UniswapModel_$1143(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function read_from_storage_split_dynamic_t_contract$_UniswapModel_$1143(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_contract$_UniswapModel_$1143(sload(slot), offset)

            }

            /// @ast-id 780
            /// @src 2:306:333  "UniswapModel public uniswap"
            function getter_fun_uniswap_780() -> ret_address {

                let slot := 4
                let offset := 0

                ret_address := read_from_storage_split_dynamic_t_contract$_UniswapModel_$1143(slot, offset)

            }
            /// @src 2:143:2435  "contract PuppetPool {..."

            function identity(value) -> ret {
                ret := value
            }

            function convert_t_uint160_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(identity(cleanup_t_uint160(value)))
            }

            function convert_t_uint160_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_contract$_UniswapModel_$1143_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function abi_encode_t_contract$_UniswapModel_$1143_to_t_address_fromStack(value, pos) {
                mstore(pos, convert_t_contract$_UniswapModel_$1143_to_t_address(value))
            }

            function abi_encode_tuple_t_contract$_UniswapModel_$1143__to_t_address__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_contract$_UniswapModel_$1143_to_t_address_fromStack(value0,  add(headStart, 0))

            }

            function external_fun_uniswap_780() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                let ret_0 :=  getter_fun_uniswap_780()
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_contract$_UniswapModel_$1143__to_t_address__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_eurus_dep0_965() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                let ret_0 :=  fun_eurus_dep0_965()
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function validator_revert_t_address(value) {
                if iszero(eq(value, cleanup_t_address(value))) { revert(0, 0) }
            }

            function abi_decode_t_address(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_address(value)
            }

            function abi_decode_tuple_t_addresst_addresst_address(headStart, dataEnd) -> value0, value1, value2 {
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

                    value2 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            function external_fun_setPoolAddresses_816() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1, param_2 :=  abi_decode_tuple_t_addresst_addresst_address(4, calldatasize())
                fun_setPoolAddresses_816(param_0, param_1, param_2)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_calculateDepositRequired_902() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                let ret_0 :=  fun_calculateDepositRequired_902(param_0)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function cleanup_from_storage_t_contract$_ERC20_$236(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function extract_from_storage_value_dynamict_contract$_ERC20_$236(slot_value, offset) -> value {
                value := cleanup_from_storage_t_contract$_ERC20_$236(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function read_from_storage_split_dynamic_t_contract$_ERC20_$236(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_contract$_ERC20_$236(sload(slot), offset)

            }

            /// @ast-id 774
            /// @src 2:254:274  "ERC20 public dvtPool"
            function getter_fun_dvtPool_774() -> ret_address {

                let slot := 2
                let offset := 0

                ret_address := read_from_storage_split_dynamic_t_contract$_ERC20_$236(slot, offset)

            }
            /// @src 2:143:2435  "contract PuppetPool {..."

            function convert_t_contract$_ERC20_$236_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function abi_encode_t_contract$_ERC20_$236_to_t_address_fromStack(value, pos) {
                mstore(pos, convert_t_contract$_ERC20_$236_to_t_address(value))
            }

            function abi_encode_tuple_t_contract$_ERC20_$236__to_t_address__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_contract$_ERC20_$236_to_t_address_fromStack(value0,  add(headStart, 0))

            }

            function external_fun_dvtPool_774() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                let ret_0 :=  getter_fun_dvtPool_774()
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_contract$_ERC20_$236__to_t_address__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_eurus_dep1_978() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                let ret_0 :=  fun_eurus_dep1_978(param_0)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            /// @ast-id 777
            /// @src 2:280:300  "ERC20 public ethPool"
            function getter_fun_ethPool_777() -> ret_address {

                let slot := 3
                let offset := 0

                ret_address := read_from_storage_split_dynamic_t_contract$_ERC20_$236(slot, offset)

            }
            /// @src 2:143:2435  "contract PuppetPool {..."

            function external_fun_ethPool_777() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                let ret_0 :=  getter_fun_ethPool_777()
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_contract$_ERC20_$236__to_t_address__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_eurus_oracle_price_938() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                let ret_0 :=  fun_eurus_oracle_price_938(param_0)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function abi_decode_tuple_t_address(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            function convert_t_address_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
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

            /// @ast-id 769
            /// @src 2:170:213  "mapping(address => uint256) public deposits"
            function getter_fun_deposits_769(key_0) -> ret {

                let slot := 0
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(slot, key_0)

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }
            /// @src 2:143:2435  "contract PuppetPool {..."

            function external_fun_deposits_769() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                let ret_0 :=  getter_fun_deposits_769(param_0)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74() {
                revert(0, 0)
            }

            function convert_t_uint160_to_t_contract$_ERC20_$236(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_address_to_t_contract$_ERC20_$236(value) -> converted {
                converted := convert_t_uint160_to_t_contract$_ERC20_$236(value)
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

            function convert_t_contract$_ERC20_$236_to_t_contract$_ERC20_$236(value) -> converted {
                converted := convert_t_uint160_to_t_contract$_ERC20_$236(value)
            }

            function prepare_store_t_contract$_ERC20_$236(value) -> ret {
                ret := value
            }

            function update_storage_value_offset_0t_contract$_ERC20_$236_to_t_contract$_ERC20_$236(slot, value_0) {
                let convertedValue_0 := convert_t_contract$_ERC20_$236_to_t_contract$_ERC20_$236(value_0)
                sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_contract$_ERC20_$236(convertedValue_0)))
            }

            function convert_t_uint160_to_t_contract$_UniswapModel_$1143(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_address_to_t_contract$_UniswapModel_$1143(value) -> converted {
                converted := convert_t_uint160_to_t_contract$_UniswapModel_$1143(value)
            }

            function convert_t_contract$_UniswapModel_$1143_to_t_contract$_UniswapModel_$1143(value) -> converted {
                converted := convert_t_uint160_to_t_contract$_UniswapModel_$1143(value)
            }

            function prepare_store_t_contract$_UniswapModel_$1143(value) -> ret {
                ret := value
            }

            function update_storage_value_offset_0t_contract$_UniswapModel_$1143_to_t_contract$_UniswapModel_$1143(slot, value_0) {
                let convertedValue_0 := convert_t_contract$_UniswapModel_$1143_to_t_contract$_UniswapModel_$1143(value_0)
                sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_contract$_UniswapModel_$1143(convertedValue_0)))
            }

            function prepare_store_t_address(value) -> ret {
                ret := value
            }

            function update_storage_value_offset_0t_address_to_t_address(slot, value_0) {
                let convertedValue_0 := convert_t_address_to_t_address(value_0)
                sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address(convertedValue_0)))
            }

            /// @ast-id 816
            /// @src 2:363:605  "function setPoolAddresses(address ethAddress, address dvtAddress, address uAddr) external {..."
            function fun_setPoolAddresses_816(var_ethAddress_786, var_dvtAddress_788, var_uAddr_790) {

                /// @src 2:479:489  "dvtAddress"
                let _1 := var_dvtAddress_788
                let expr_795 := _1
                /// @src 2:473:490  "ERC20(dvtAddress)"
                let expr_796_address := convert_t_address_to_t_contract$_ERC20_$236(expr_795)
                /// @src 2:463:490  "dvtPool = ERC20(dvtAddress)"
                update_storage_value_offset_0t_contract$_ERC20_$236_to_t_contract$_ERC20_$236(0x02, expr_796_address)
                let expr_797_address := expr_796_address
                /// @src 2:516:526  "ethAddress"
                let _2 := var_ethAddress_786
                let expr_801 := _2
                /// @src 2:510:527  "ERC20(ethAddress)"
                let expr_802_address := convert_t_address_to_t_contract$_ERC20_$236(expr_801)
                /// @src 2:500:527  "ethPool = ERC20(ethAddress)"
                update_storage_value_offset_0t_contract$_ERC20_$236_to_t_contract$_ERC20_$236(0x03, expr_802_address)
                let expr_803_address := expr_802_address
                /// @src 2:560:565  "uAddr"
                let _3 := var_uAddr_790
                let expr_807 := _3
                /// @src 2:547:566  "UniswapModel(uAddr)"
                let expr_808_address := convert_t_address_to_t_contract$_UniswapModel_$1143(expr_807)
                /// @src 2:537:566  "uniswap = UniswapModel(uAddr)"
                update_storage_value_offset_0t_contract$_UniswapModel_$1143_to_t_contract$_UniswapModel_$1143(0x04, expr_808_address)
                let expr_809_address := expr_808_address
                /// @src 2:593:598  "uAddr"
                let _4 := var_uAddr_790
                let expr_812 := _4
                /// @src 2:576:598  "uniswapAddress = uAddr"
                update_storage_value_offset_0t_address_to_t_address(0x01, expr_812)
                let expr_813 := expr_812

            }
            /// @src 2:143:2435  "contract PuppetPool {..."

            function shift_right_0_unsigned(value) -> newValue {
                newValue :=

                shr(0, value)

            }

            function extract_from_storage_value_offset_0t_contract$_ERC20_$236(slot_value) -> value {
                value := cleanup_from_storage_t_contract$_ERC20_$236(shift_right_0_unsigned(slot_value))
            }

            function read_from_storage_split_offset_0_t_contract$_ERC20_$236(slot) -> value {
                value := extract_from_storage_value_offset_0t_contract$_ERC20_$236(sload(slot))

            }

            function convert_t_contract$_PuppetPool_$979_to_t_address(value) -> converted {
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

            function require_helper(condition) {
                if iszero(condition) { revert(0, 0) }
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

            function abi_encode_tuple_t_address_t_uint256__to_t_address_t_uint256__fromStack(headStart , value0, value1) -> tail {
                tail := add(headStart, 64)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

                abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function read_from_storage_split_offset_0_t_uint256(slot) -> value {
                value := extract_from_storage_value_offset_0t_uint256(sload(slot))

            }

            function checked_add_t_uint256(x, y) -> sum {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                // overflow, if x > (maxValue - y)
                if gt(x, sub(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, y)) { panic_error_0x11() }

                sum := add(x, y)
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

            /// @ast-id 884
            /// @src 2:709:1376  "function borrow(uint256 borrowAmount, uint256 depositAmount) public payable {..."
            function fun_borrow_884(var_borrowAmount_818, var_depositAmount_820) {

                /// @src 2:828:835  "ethPool"
                let _5_address := read_from_storage_split_offset_0_t_contract$_ERC20_$236(0x03)
                let expr_823_address := _5_address
                /// @src 2:828:848  "ethPool.transferFrom"
                let expr_825_address := convert_t_contract$_ERC20_$236_to_t_address(expr_823_address)
                let expr_825_functionSelector := 0x23b872dd
                /// @src 2:849:859  "msg.sender"
                let expr_827 := caller()
                /// @src 2:869:873  "this"
                let expr_830_address := address()
                /// @src 2:861:874  "address(this)"
                let expr_831 := convert_t_contract$_PuppetPool_$979_to_t_address(expr_830_address)
                /// @src 2:876:889  "depositAmount"
                let _6 := var_depositAmount_820
                let expr_832 := _6
                /// @src 2:828:890  "ethPool.transferFrom(msg.sender, address(this), depositAmount)"

                // storage for arguments and returned data
                let _7 := allocate_unbounded()
                mstore(_7, shift_left_224(expr_825_functionSelector))
                let _8 := abi_encode_tuple_t_address_t_address_t_uint256__to_t_address_t_address_t_uint256__fromStack(add(_7, 4) , expr_827, expr_831, expr_832)

                let _9 := call(gas(), expr_825_address,  0,  _7, sub(_8, _7), _7, 32)

                if iszero(_9) { revert_forward_1() }

                let expr_833
                if _9 {

                    let _10 := 32

                    if gt(_10, returndatasize()) {
                        _10 := returndatasize()
                    }

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_7, _10)

                    // decode return parameters from external try-call into retVars
                    expr_833 :=  abi_decode_tuple_t_bool_fromMemory(_7, add(_7, _10))
                }
                /// @src 2:952:964  "borrowAmount"
                let _11 := var_borrowAmount_818
                let expr_838 := _11
                /// @src 2:927:965  "calculateDepositRequired(borrowAmount)"
                let expr_839 := fun_calculateDepositRequired_902(expr_838)
                /// @src 2:901:965  "uint256 depositRequired = calculateDepositRequired(borrowAmount)"
                let var_depositRequired_836 := expr_839
                /// @src 2:992:1005  "depositAmount"
                let _12 := var_depositAmount_820
                let expr_842 := _12
                /// @src 2:1009:1024  "depositRequired"
                let _13 := var_depositRequired_836
                let expr_843 := _13
                /// @src 2:992:1024  "depositAmount >= depositRequired"
                let expr_844 := iszero(lt(cleanup_t_uint256(expr_842), cleanup_t_uint256(expr_843)))
                /// @src 2:984:1025  "require(depositAmount >= depositRequired)"
                require_helper(expr_844)
                /// @src 2:1048:1061  "depositAmount"
                let _14 := var_depositAmount_820
                let expr_847 := _14
                /// @src 2:1064:1079  "depositRequired"
                let _15 := var_depositRequired_836
                let expr_848 := _15
                /// @src 2:1048:1079  "depositAmount > depositRequired"
                let expr_849 := gt(cleanup_t_uint256(expr_847), cleanup_t_uint256(expr_848))
                /// @src 2:1044:1167  "if (depositAmount > depositRequired) {..."
                if expr_849 {
                    /// @src 2:1095:1102  "ethPool"
                    let _16_address := read_from_storage_split_offset_0_t_contract$_ERC20_$236(0x03)
                    let expr_850_address := _16_address
                    /// @src 2:1095:1111  "ethPool.transfer"
                    let expr_852_address := convert_t_contract$_ERC20_$236_to_t_address(expr_850_address)
                    let expr_852_functionSelector := 0xa9059cbb
                    /// @src 2:1112:1122  "msg.sender"
                    let expr_854 := caller()
                    /// @src 2:1124:1137  "depositAmount"
                    let _17 := var_depositAmount_820
                    let expr_855 := _17
                    /// @src 2:1140:1155  "depositRequired"
                    let _18 := var_depositRequired_836
                    let expr_856 := _18
                    /// @src 2:1124:1155  "depositAmount - depositRequired"
                    let expr_857 := checked_sub_t_uint256(expr_855, expr_856)

                    /// @src 2:1095:1156  "ethPool.transfer(msg.sender, depositAmount - depositRequired)"

                    // storage for arguments and returned data
                    let _19 := allocate_unbounded()
                    mstore(_19, shift_left_224(expr_852_functionSelector))
                    let _20 := abi_encode_tuple_t_address_t_uint256__to_t_address_t_uint256__fromStack(add(_19, 4) , expr_854, expr_857)

                    let _21 := call(gas(), expr_852_address,  0,  _19, sub(_20, _19), _19, 32)

                    if iszero(_21) { revert_forward_1() }

                    let expr_858
                    if _21 {

                        let _22 := 32

                        if gt(_22, returndatasize()) {
                            _22 := returndatasize()
                        }

                        // update freeMemoryPointer according to dynamic return size
                        finalize_allocation(_19, _22)

                        // decode return parameters from external try-call into retVars
                        expr_858 :=  abi_decode_tuple_t_bool_fromMemory(_19, add(_19, _22))
                    }
                    /// @src 2:1044:1167  "if (depositAmount > depositRequired) {..."
                }
                /// @src 2:1200:1208  "deposits"
                let _23 := 0x00
                let expr_866 := _23
                /// @src 2:1209:1219  "msg.sender"
                let expr_868 := caller()
                /// @src 2:1200:1220  "deposits[msg.sender]"
                let _24 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_866,expr_868)
                let _25 := read_from_storage_split_offset_0_t_uint256(_24)
                let expr_869 := _25
                /// @src 2:1223:1238  "depositRequired"
                let _26 := var_depositRequired_836
                let expr_870 := _26
                /// @src 2:1200:1238  "deposits[msg.sender] + depositRequired"
                let expr_871 := checked_add_t_uint256(expr_869, expr_870)

                /// @src 2:1177:1185  "deposits"
                let _27 := 0x00
                let expr_862 := _27
                /// @src 2:1186:1196  "msg.sender"
                let expr_864 := caller()
                /// @src 2:1177:1197  "deposits[msg.sender]"
                let _28 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_862,expr_864)
                /// @src 2:1177:1238  "deposits[msg.sender] = deposits[msg.sender] + depositRequired"
                update_storage_value_offset_0t_uint256_to_t_uint256(_28, expr_871)
                let expr_872 := expr_871
                /// @src 2:1326:1333  "dvtPool"
                let _29_address := read_from_storage_split_offset_0_t_contract$_ERC20_$236(0x02)
                let expr_875_address := _29_address
                /// @src 2:1326:1342  "dvtPool.transfer"
                let expr_876_address := convert_t_contract$_ERC20_$236_to_t_address(expr_875_address)
                let expr_876_functionSelector := 0xa9059cbb
                /// @src 2:1343:1353  "msg.sender"
                let expr_878 := caller()
                /// @src 2:1355:1367  "borrowAmount"
                let _30 := var_borrowAmount_818
                let expr_879 := _30
                /// @src 2:1326:1368  "dvtPool.transfer(msg.sender, borrowAmount)"

                // storage for arguments and returned data
                let _31 := allocate_unbounded()
                mstore(_31, shift_left_224(expr_876_functionSelector))
                let _32 := abi_encode_tuple_t_address_t_uint256__to_t_address_t_uint256__fromStack(add(_31, 4) , expr_878, expr_879)

                let _33 := call(gas(), expr_876_address,  0,  _31, sub(_32, _31), _31, 32)

                if iszero(_33) { revert_forward_1() }

                let expr_880
                if _33 {

                    let _34 := 32

                    if gt(_34, returndatasize()) {
                        _34 := returndatasize()
                    }

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_31, _34)

                    // decode return parameters from external try-call into retVars
                    expr_880 :=  abi_decode_tuple_t_bool_fromMemory(_31, add(_31, _34))
                }
                /// @src 2:1318:1369  "require(dvtPool.transfer(msg.sender, borrowAmount))"
                require_helper(expr_880)

            }
            /// @src 2:143:2435  "contract PuppetPool {..."

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

            function wrapping_mul_t_uint256(x, y) -> product {
                product := cleanup_t_uint256(mul(x, y))
            }

            function cleanup_t_rational_2_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_2_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_2_by_1(value)))
            }

            function cleanup_t_rational_10_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_10_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_10_by_1(value)))
            }

            function panic_error_0x12() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x12)
                revert(0, 0x24)
            }

            function wrapping_div_t_uint256(x, y) -> r {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)
                if iszero(y) { panic_error_0x12() }
                r := div(x, y)
            }

            /// @ast-id 902
            /// @src 2:1382:1539  "function calculateDepositRequired(uint256 amount) public view returns (uint256) {..."
            function fun_calculateDepositRequired_902(var_amount_886) -> var__889 {
                /// @src 2:1453:1460  "uint256"
                let zero_t_uint256_35 := zero_value_for_split_t_uint256()
                var__889 := zero_t_uint256_35

                /// @src 2:1491:1497  "amount"
                let _36 := var_amount_886
                let expr_891 := _36
                /// @src 2:1500:1521  "_computeOraclePrice()"
                let expr_893 := fun__computeOraclePrice_919()
                /// @src 2:1491:1521  "amount * _computeOraclePrice()"
                let expr_894 := wrapping_mul_t_uint256(expr_891, expr_893)

                /// @src 2:1524:1525  "2"
                let expr_895 := 0x02
                /// @src 2:1491:1525  "amount * _computeOraclePrice() * 2"
                let expr_896 := wrapping_mul_t_uint256(expr_894, convert_t_rational_2_by_1_to_t_uint256(expr_895))

                /// @src 2:1528:1530  "10"
                let expr_897 := 0x0a
                /// @src 2:1491:1530  "amount * _computeOraclePrice() * 2 / 10"
                let expr_898 := wrapping_div_t_uint256(expr_896, convert_t_rational_10_by_1_to_t_uint256(expr_897))

                /// @src 2:1484:1530  "return amount * _computeOraclePrice() * 2 / 10"
                var__889 := expr_898
                leave

            }
            /// @src 2:143:2435  "contract PuppetPool {..."

            function extract_from_storage_value_offset_0t_contract$_UniswapModel_$1143(slot_value) -> value {
                value := cleanup_from_storage_t_contract$_UniswapModel_$1143(shift_right_0_unsigned(slot_value))
            }

            function read_from_storage_split_offset_0_t_contract$_UniswapModel_$1143(slot) -> value {
                value := extract_from_storage_value_offset_0t_contract$_UniswapModel_$1143(sload(slot))

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

            function cleanup_t_rational_0_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_0_by_1(value)))
            }

            function abi_encode_t_rational_0_by_1_to_t_uint256_fromStack(value, pos) {
                mstore(pos, convert_t_rational_0_by_1_to_t_uint256(value))
            }

            function abi_encode_tuple_t_rational_0_by_1__to_t_uint256__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_rational_0_by_1_to_t_uint256_fromStack(value0,  add(headStart, 0))

            }

            function extract_from_storage_value_offset_0t_address(slot_value) -> value {
                value := cleanup_from_storage_t_address(shift_right_0_unsigned(slot_value))
            }

            function read_from_storage_split_offset_0_t_address(slot) -> value {
                value := extract_from_storage_value_offset_0t_address(sload(slot))

            }

            /// @ast-id 919
            /// @src 2:1545:1783  "function _computeOraclePrice() private view returns (uint256) {..."
            function fun__computeOraclePrice_919() -> var__905 {
                /// @src 2:1598:1605  "uint256"
                let zero_t_uint256_37 := zero_value_for_split_t_uint256()
                var__905 := zero_t_uint256_37

                /// @src 2:1714:1721  "uniswap"
                let _38_address := read_from_storage_split_offset_0_t_contract$_UniswapModel_$1143(0x04)
                let expr_907_address := _38_address
                /// @src 2:1714:1735  "uniswap.getETHBalance"
                let expr_908_address := convert_t_contract$_UniswapModel_$1143_to_t_address(expr_907_address)
                let expr_908_functionSelector := 0x83dcf6a5
                /// @src 2:1736:1737  "0"
                let expr_909 := 0x00
                /// @src 2:1714:1738  "uniswap.getETHBalance(0)"

                // storage for arguments and returned data
                let _39 := allocate_unbounded()
                mstore(_39, shift_left_224(expr_908_functionSelector))
                let _40 := abi_encode_tuple_t_rational_0_by_1__to_t_uint256__fromStack(add(_39, 4) , expr_909)

                let _41 := staticcall(gas(), expr_908_address,  _39, sub(_40, _39), _39, 32)

                if iszero(_41) { revert_forward_1() }

                let expr_910
                if _41 {

                    let _42 := 32

                    if gt(_42, returndatasize()) {
                        _42 := returndatasize()
                    }

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_39, _42)

                    // decode return parameters from external try-call into retVars
                    expr_910 :=  abi_decode_tuple_t_uint256_fromMemory(_39, add(_39, _42))
                }
                /// @src 2:1741:1748  "dvtPool"
                let _43_address := read_from_storage_split_offset_0_t_contract$_ERC20_$236(0x02)
                let expr_911_address := _43_address
                /// @src 2:1741:1758  "dvtPool.balanceOf"
                let expr_912_address := convert_t_contract$_ERC20_$236_to_t_address(expr_911_address)
                let expr_912_functionSelector := 0x70a08231
                /// @src 2:1759:1773  "uniswapAddress"
                let _44 := read_from_storage_split_offset_0_t_address(0x01)
                let expr_913 := _44
                /// @src 2:1741:1774  "dvtPool.balanceOf(uniswapAddress)"

                // storage for arguments and returned data
                let _45 := allocate_unbounded()
                mstore(_45, shift_left_224(expr_912_functionSelector))
                let _46 := abi_encode_tuple_t_address__to_t_address__fromStack(add(_45, 4) , expr_913)

                let _47 := staticcall(gas(), expr_912_address,  _45, sub(_46, _45), _45, 32)

                if iszero(_47) { revert_forward_1() }

                let expr_914
                if _47 {

                    let _48 := 32

                    if gt(_48, returndatasize()) {
                        _48 := returndatasize()
                    }

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_45, _48)

                    // decode return parameters from external try-call into retVars
                    expr_914 :=  abi_decode_tuple_t_uint256_fromMemory(_45, add(_45, _48))
                }
                /// @src 2:1714:1774  "uniswap.getETHBalance(0) / dvtPool.balanceOf(uniswapAddress)"
                let expr_915 := wrapping_div_t_uint256(expr_910, expr_914)

                /// @src 2:1707:1774  "return uniswap.getETHBalance(0) / dvtPool.balanceOf(uniswapAddress)"
                var__905 := expr_915
                leave

            }
            /// @src 2:143:2435  "contract PuppetPool {..."

            /// @ast-id 938
            /// @src 2:1789:2034  "function eurus_oracle_price(uint256) view external returns (uint256) {..."
            function fun_eurus_oracle_price_938(var__921) -> var__924 {
                /// @src 2:1849:1856  "uint256"
                let zero_t_uint256_49 := zero_value_for_split_t_uint256()
                var__924 := zero_t_uint256_49

                /// @src 2:1965:1972  "uniswap"
                let _50_address := read_from_storage_split_offset_0_t_contract$_UniswapModel_$1143(0x04)
                let expr_926_address := _50_address
                /// @src 2:1965:1986  "uniswap.getETHBalance"
                let expr_927_address := convert_t_contract$_UniswapModel_$1143_to_t_address(expr_926_address)
                let expr_927_functionSelector := 0x83dcf6a5
                /// @src 2:1987:1988  "0"
                let expr_928 := 0x00
                /// @src 2:1965:1989  "uniswap.getETHBalance(0)"

                // storage for arguments and returned data
                let _51 := allocate_unbounded()
                mstore(_51, shift_left_224(expr_927_functionSelector))
                let _52 := abi_encode_tuple_t_rational_0_by_1__to_t_uint256__fromStack(add(_51, 4) , expr_928)

                let _53 := staticcall(gas(), expr_927_address,  _51, sub(_52, _51), _51, 32)

                if iszero(_53) { revert_forward_1() }

                let expr_929
                if _53 {

                    let _54 := 32

                    if gt(_54, returndatasize()) {
                        _54 := returndatasize()
                    }

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_51, _54)

                    // decode return parameters from external try-call into retVars
                    expr_929 :=  abi_decode_tuple_t_uint256_fromMemory(_51, add(_51, _54))
                }
                /// @src 2:1992:1999  "dvtPool"
                let _55_address := read_from_storage_split_offset_0_t_contract$_ERC20_$236(0x02)
                let expr_930_address := _55_address
                /// @src 2:1992:2009  "dvtPool.balanceOf"
                let expr_931_address := convert_t_contract$_ERC20_$236_to_t_address(expr_930_address)
                let expr_931_functionSelector := 0x70a08231
                /// @src 2:2010:2024  "uniswapAddress"
                let _56 := read_from_storage_split_offset_0_t_address(0x01)
                let expr_932 := _56
                /// @src 2:1992:2025  "dvtPool.balanceOf(uniswapAddress)"

                // storage for arguments and returned data
                let _57 := allocate_unbounded()
                mstore(_57, shift_left_224(expr_931_functionSelector))
                let _58 := abi_encode_tuple_t_address__to_t_address__fromStack(add(_57, 4) , expr_932)

                let _59 := staticcall(gas(), expr_931_address,  _57, sub(_58, _57), _57, 32)

                if iszero(_59) { revert_forward_1() }

                let expr_933
                if _59 {

                    let _60 := 32

                    if gt(_60, returndatasize()) {
                        _60 := returndatasize()
                    }

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_57, _60)

                    // decode return parameters from external try-call into retVars
                    expr_933 :=  abi_decode_tuple_t_uint256_fromMemory(_57, add(_57, _60))
                }
                /// @src 2:1965:2025  "uniswap.getETHBalance(0) / dvtPool.balanceOf(uniswapAddress)"
                let expr_934 := wrapping_div_t_uint256(expr_929, expr_933)

                /// @src 2:1958:2025  "return uniswap.getETHBalance(0) / dvtPool.balanceOf(uniswapAddress)"
                var__924 := expr_934
                leave

            }
            /// @src 2:143:2435  "contract PuppetPool {..."

            /// @ast-id 956
            /// @src 2:2040:2197  "function eurus_deposit_required(uint256 amount) view external returns (uint256) {..."
            function fun_eurus_deposit_required_956(var_amount_940) -> var__943 {
                /// @src 2:2111:2118  "uint256"
                let zero_t_uint256_61 := zero_value_for_split_t_uint256()
                var__943 := zero_t_uint256_61

                /// @src 2:2149:2155  "amount"
                let _62 := var_amount_940
                let expr_945 := _62
                /// @src 2:2158:2179  "_computeOraclePrice()"
                let expr_947 := fun__computeOraclePrice_919()
                /// @src 2:2149:2179  "amount * _computeOraclePrice()"
                let expr_948 := wrapping_mul_t_uint256(expr_945, expr_947)

                /// @src 2:2182:2183  "2"
                let expr_949 := 0x02
                /// @src 2:2149:2183  "amount * _computeOraclePrice() * 2"
                let expr_950 := wrapping_mul_t_uint256(expr_948, convert_t_rational_2_by_1_to_t_uint256(expr_949))

                /// @src 2:2186:2188  "10"
                let expr_951 := 0x0a
                /// @src 2:2149:2188  "amount * _computeOraclePrice() * 2 / 10"
                let expr_952 := wrapping_div_t_uint256(expr_950, convert_t_rational_10_by_1_to_t_uint256(expr_951))

                /// @src 2:2142:2188  "return amount * _computeOraclePrice() * 2 / 10"
                var__943 := expr_952
                leave

            }
            /// @src 2:143:2435  "contract PuppetPool {..."

            /// @ast-id 965
            /// @src 2:2203:2303  "function eurus_dep0() view external returns (uint256) {..."
            function fun_eurus_dep0_965() -> var__959 {
                /// @src 2:2248:2255  "uint256"
                let zero_t_uint256_63 := zero_value_for_split_t_uint256()
                var__959 := zero_t_uint256_63

                /// @src 2:2274:2295  "_computeOraclePrice()"
                let expr_962 := fun__computeOraclePrice_919()
                /// @src 2:2267:2295  "return _computeOraclePrice()"
                var__959 := expr_962
                leave

            }
            /// @src 2:143:2435  "contract PuppetPool {..."

            function checked_mul_t_uint256(x, y) -> product {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                // overflow, if x != 0 and y > (maxValue / x)
                if and(iszero(iszero(x)), gt(y, div(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, x))) { panic_error_0x11() }

                product := mul(x, y)
            }

            /// @ast-id 978
            /// @src 2:2309:2432  "function eurus_dep1(uint256 amount) view external returns (uint256) {..."
            function fun_eurus_dep1_978(var_amount_967) -> var__970 {
                /// @src 2:2368:2375  "uint256"
                let zero_t_uint256_64 := zero_value_for_split_t_uint256()
                var__970 := zero_t_uint256_64

                /// @src 2:2394:2400  "amount"
                let _65 := var_amount_967
                let expr_972 := _65
                /// @src 2:2403:2424  "_computeOraclePrice()"
                let expr_974 := fun__computeOraclePrice_919()
                /// @src 2:2394:2424  "amount * _computeOraclePrice()"
                let expr_975 := checked_mul_t_uint256(expr_972, expr_974)

                /// @src 2:2387:2424  "return amount * _computeOraclePrice()"
                var__970 := expr_975
                leave

            }
            /// @src 2:143:2435  "contract PuppetPool {..."

        }

        data ".metadata" hex"a26469706673582212201a9c0cbfb14b0a64d0516227d7be46c607f5d6c27725247284eea3ae99234b0764736f6c634300080e0033"
    }

}

