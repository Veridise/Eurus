/*=====================================================*
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *=====================================================*/


/// @use-src 0:"examples/puppet-simplified/PuppetPool.sol"
object "PuppetPool_263" {
    code {
        /// @src 0:566:2812  "contract PuppetPool {..."
        mstore(64, 128)
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        constructor_PuppetPool_263()

        let _1 := allocate_unbounded()
        codecopy(_1, dataoffset("PuppetPool_263_deployed"), datasize("PuppetPool_263_deployed"))

        return(_1, datasize("PuppetPool_263_deployed"))

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
            revert(0, 0)
        }

        /// @ast-id 72
        /// @src 0:770:787  "constructor () {}"
        function constructor_PuppetPool_263() {

            /// @src 0:770:787  "constructor () {}"

        }
        /// @src 0:566:2812  "contract PuppetPool {..."

    }
    /// @use-src 0:"examples/puppet-simplified/PuppetPool.sol"
    object "PuppetPool_263_deployed" {
        code {
            /// @src 0:566:2812  "contract PuppetPool {..."
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x0e2feb05
                {
                    // uniswapAddress()

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_uniswapAddress_59()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x0ecbcdab
                {
                    // borrow(uint256,uint256)

                    let param_0, param_1 :=  abi_decode_tuple_t_uint256t_uint256(4, calldatasize())
                    fun_borrow_172(param_0, param_1)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x1a97b88c
                {
                    // eurus_deposit_required(uint256)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    let ret_0 :=  fun_eurus_deposit_required_240(param_0)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x2681f7e4
                {
                    // uniswap()

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_uniswap_68()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_contract$_IUniswapModel_$53__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x4730bf33
                {
                    // eurus_dep0()

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_eurus_dep0_249()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x8597600f
                {
                    // setPoolAddresses(address,address,address)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0, param_1, param_2 :=  abi_decode_tuple_t_addresst_addresst_address(4, calldatasize())
                    fun_setPoolAddresses_104(param_0, param_1, param_2)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xbc554c28
                {
                    // calculateDepositRequired(uint256)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    let ret_0 :=  fun_calculateDepositRequired_189(param_0)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xcabaffcf
                {
                    // dvtPool()

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_dvtPool_62()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_contract$_IERC20_$38__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xe1a7969c
                {
                    // eurus_dep1(uint256)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    let ret_0 :=  fun_eurus_dep1_262(param_0)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xf16673a4
                {
                    // ethPool()

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_ethPool_65()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_contract$_IERC20_$38__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xf57b1bb4
                {
                    // eurus_oracle_price(uint256)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    let ret_0 :=  fun_eurus_oracle_price_223(param_0)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xfc7e286d
                {
                    // deposits(address)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  getter_fun_deposits_57(param_0)
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

            /// @ast-id 59
            /// @src 0:642:671  "address public uniswapAddress"
            function getter_fun_uniswapAddress_59() -> ret {

                let slot := 1
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

            }
            /// @src 0:566:2812  "contract PuppetPool {..."

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

            function cleanup_from_storage_t_contract$_IUniswapModel_$53(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function extract_from_storage_value_dynamict_contract$_IUniswapModel_$53(slot_value, offset) -> value {
                value := cleanup_from_storage_t_contract$_IUniswapModel_$53(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function read_from_storage_split_dynamic_t_contract$_IUniswapModel_$53(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_contract$_IUniswapModel_$53(sload(slot), offset)

            }

            /// @ast-id 68
            /// @src 0:731:759  "IUniswapModel public uniswap"
            function getter_fun_uniswap_68() -> ret_address {

                let slot := 4
                let offset := 0

                ret_address := read_from_storage_split_dynamic_t_contract$_IUniswapModel_$53(slot, offset)

            }
            /// @src 0:566:2812  "contract PuppetPool {..."

            function identity(value) -> ret {
                ret := value
            }

            function convert_t_uint160_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(identity(cleanup_t_uint160(value)))
            }

            function convert_t_uint160_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_contract$_IUniswapModel_$53_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function abi_encode_t_contract$_IUniswapModel_$53_to_t_address_fromStack(value, pos) {
                mstore(pos, convert_t_contract$_IUniswapModel_$53_to_t_address(value))
            }

            function abi_encode_tuple_t_contract$_IUniswapModel_$53__to_t_address__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_contract$_IUniswapModel_$53_to_t_address_fromStack(value0,  add(headStart, 0))

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

            function cleanup_from_storage_t_contract$_IERC20_$38(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function extract_from_storage_value_dynamict_contract$_IERC20_$38(slot_value, offset) -> value {
                value := cleanup_from_storage_t_contract$_IERC20_$38(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function read_from_storage_split_dynamic_t_contract$_IERC20_$38(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_contract$_IERC20_$38(sload(slot), offset)

            }

            /// @ast-id 62
            /// @src 0:677:698  "IERC20 public dvtPool"
            function getter_fun_dvtPool_62() -> ret_address {

                let slot := 2
                let offset := 0

                ret_address := read_from_storage_split_dynamic_t_contract$_IERC20_$38(slot, offset)

            }
            /// @src 0:566:2812  "contract PuppetPool {..."

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

            /// @ast-id 65
            /// @src 0:704:725  "IERC20 public ethPool"
            function getter_fun_ethPool_65() -> ret_address {

                let slot := 3
                let offset := 0

                ret_address := read_from_storage_split_dynamic_t_contract$_IERC20_$38(slot, offset)

            }
            /// @src 0:566:2812  "contract PuppetPool {..."

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

            /// @ast-id 57
            /// @src 0:593:636  "mapping(address => uint256) public deposits"
            function getter_fun_deposits_57(key_0) -> ret {

                let slot := 0
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(slot, key_0)

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }
            /// @src 0:566:2812  "contract PuppetPool {..."

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

            function convert_t_uint160_to_t_contract$_IUniswapModel_$53(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_address_to_t_contract$_IUniswapModel_$53(value) -> converted {
                converted := convert_t_uint160_to_t_contract$_IUniswapModel_$53(value)
            }

            function convert_t_contract$_IUniswapModel_$53_to_t_contract$_IUniswapModel_$53(value) -> converted {
                converted := convert_t_uint160_to_t_contract$_IUniswapModel_$53(value)
            }

            function prepare_store_t_contract$_IUniswapModel_$53(value) -> ret {
                ret := value
            }

            function update_storage_value_offset_0t_contract$_IUniswapModel_$53_to_t_contract$_IUniswapModel_$53(slot, value_0) {
                let convertedValue_0 := convert_t_contract$_IUniswapModel_$53_to_t_contract$_IUniswapModel_$53(value_0)
                sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_contract$_IUniswapModel_$53(convertedValue_0)))
            }

            function prepare_store_t_address(value) -> ret {
                ret := value
            }

            function update_storage_value_offset_0t_address_to_t_address(slot, value_0) {
                let convertedValue_0 := convert_t_address_to_t_address(value_0)
                sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address(convertedValue_0)))
            }

            /// @ast-id 104
            /// @src 0:793:1038  "function setPoolAddresses(address ethAddress, address dvtAddress, address uAddr) external {..."
            function fun_setPoolAddresses_104(var_ethAddress_74, var_dvtAddress_76, var_uAddr_78) {

                /// @src 0:910:920  "dvtAddress"
                let _1 := var_dvtAddress_76
                let expr_83 := _1
                /// @src 0:903:921  "IERC20(dvtAddress)"
                let expr_84_address := convert_t_address_to_t_contract$_IERC20_$38(expr_83)
                /// @src 0:893:921  "dvtPool = IERC20(dvtAddress)"
                update_storage_value_offset_0t_contract$_IERC20_$38_to_t_contract$_IERC20_$38(0x02, expr_84_address)
                let expr_85_address := expr_84_address
                /// @src 0:948:958  "ethAddress"
                let _2 := var_ethAddress_74
                let expr_89 := _2
                /// @src 0:941:959  "IERC20(ethAddress)"
                let expr_90_address := convert_t_address_to_t_contract$_IERC20_$38(expr_89)
                /// @src 0:931:959  "ethPool = IERC20(ethAddress)"
                update_storage_value_offset_0t_contract$_IERC20_$38_to_t_contract$_IERC20_$38(0x03, expr_90_address)
                let expr_91_address := expr_90_address
                /// @src 0:993:998  "uAddr"
                let _3 := var_uAddr_78
                let expr_95 := _3
                /// @src 0:979:999  "IUniswapModel(uAddr)"
                let expr_96_address := convert_t_address_to_t_contract$_IUniswapModel_$53(expr_95)
                /// @src 0:969:999  "uniswap = IUniswapModel(uAddr)"
                update_storage_value_offset_0t_contract$_IUniswapModel_$53_to_t_contract$_IUniswapModel_$53(0x04, expr_96_address)
                let expr_97_address := expr_96_address
                /// @src 0:1026:1031  "uAddr"
                let _4 := var_uAddr_78
                let expr_100 := _4
                /// @src 0:1009:1031  "uniswapAddress = uAddr"
                update_storage_value_offset_0t_address_to_t_address(0x01, expr_100)
                let expr_101 := expr_100

            }
            /// @src 0:566:2812  "contract PuppetPool {..."

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

            function convert_t_contract$_PuppetPool_$263_to_t_address(value) -> converted {
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

            /// @ast-id 172
            /// @src 0:1142:1809  "function borrow(uint256 borrowAmount, uint256 depositAmount) public payable {..."
            function fun_borrow_172(var_borrowAmount_106, var_depositAmount_108) {

                /// @src 0:1261:1268  "ethPool"
                let _5_address := read_from_storage_split_offset_0_t_contract$_IERC20_$38(0x03)
                let expr_111_address := _5_address
                /// @src 0:1261:1281  "ethPool.transferFrom"
                let expr_113_address := convert_t_contract$_IERC20_$38_to_t_address(expr_111_address)
                let expr_113_functionSelector := 0x23b872dd
                /// @src 0:1282:1292  "msg.sender"
                let expr_115 := caller()
                /// @src 0:1302:1306  "this"
                let expr_118_address := address()
                /// @src 0:1294:1307  "address(this)"
                let expr_119 := convert_t_contract$_PuppetPool_$263_to_t_address(expr_118_address)
                /// @src 0:1309:1322  "depositAmount"
                let _6 := var_depositAmount_108
                let expr_120 := _6
                /// @src 0:1261:1323  "ethPool.transferFrom(msg.sender, address(this), depositAmount)"
                if iszero(extcodesize(expr_113_address)) { revert_error_0cc013b6b3b6beabea4e3a74a6d380f0df81852ca99887912475e1f66b2a2c20() }

                // storage for arguments and returned data
                let _7 := allocate_unbounded()
                mstore(_7, shift_left_224(expr_113_functionSelector))
                let _8 := abi_encode_tuple_t_address_t_address_t_uint256__to_t_address_t_address_t_uint256__fromStack(add(_7, 4) , expr_115, expr_119, expr_120)

                let _9 := call(gas(), expr_113_address,  0,  _7, sub(_8, _7), _7, 32)

                if iszero(_9) { revert_forward_1() }

                let expr_121
                if _9 {

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_7, returndatasize())

                    // decode return parameters from external try-call into retVars
                    expr_121 :=  abi_decode_tuple_t_bool_fromMemory(_7, add(_7, returndatasize()))
                }
                /// @src 0:1385:1397  "borrowAmount"
                let _10 := var_borrowAmount_106
                let expr_126 := _10
                /// @src 0:1360:1398  "calculateDepositRequired(borrowAmount)"
                let expr_127 := fun_calculateDepositRequired_189(expr_126)
                /// @src 0:1334:1398  "uint256 depositRequired = calculateDepositRequired(borrowAmount)"
                let var_depositRequired_124 := expr_127
                /// @src 0:1425:1438  "depositAmount"
                let _11 := var_depositAmount_108
                let expr_130 := _11
                /// @src 0:1442:1457  "depositRequired"
                let _12 := var_depositRequired_124
                let expr_131 := _12
                /// @src 0:1425:1457  "depositAmount >= depositRequired"
                let expr_132 := iszero(lt(cleanup_t_uint256(expr_130), cleanup_t_uint256(expr_131)))
                /// @src 0:1417:1458  "require(depositAmount >= depositRequired)"
                require_helper(expr_132)
                /// @src 0:1481:1494  "depositAmount"
                let _13 := var_depositAmount_108
                let expr_135 := _13
                /// @src 0:1497:1512  "depositRequired"
                let _14 := var_depositRequired_124
                let expr_136 := _14
                /// @src 0:1481:1512  "depositAmount > depositRequired"
                let expr_137 := gt(cleanup_t_uint256(expr_135), cleanup_t_uint256(expr_136))
                /// @src 0:1477:1600  "if (depositAmount > depositRequired) {..."
                if expr_137 {
                    /// @src 0:1528:1535  "ethPool"
                    let _15_address := read_from_storage_split_offset_0_t_contract$_IERC20_$38(0x03)
                    let expr_138_address := _15_address
                    /// @src 0:1528:1544  "ethPool.transfer"
                    let expr_140_address := convert_t_contract$_IERC20_$38_to_t_address(expr_138_address)
                    let expr_140_functionSelector := 0xa9059cbb
                    /// @src 0:1545:1555  "msg.sender"
                    let expr_142 := caller()
                    /// @src 0:1557:1570  "depositAmount"
                    let _16 := var_depositAmount_108
                    let expr_143 := _16
                    /// @src 0:1573:1588  "depositRequired"
                    let _17 := var_depositRequired_124
                    let expr_144 := _17
                    /// @src 0:1557:1588  "depositAmount - depositRequired"
                    let expr_145 := checked_sub_t_uint256(expr_143, expr_144)

                    /// @src 0:1528:1589  "ethPool.transfer(msg.sender, depositAmount - depositRequired)"
                    if iszero(extcodesize(expr_140_address)) { revert_error_0cc013b6b3b6beabea4e3a74a6d380f0df81852ca99887912475e1f66b2a2c20() }

                    // storage for arguments and returned data
                    let _18 := allocate_unbounded()
                    mstore(_18, shift_left_224(expr_140_functionSelector))
                    let _19 := abi_encode_tuple_t_address_t_uint256__to_t_address_t_uint256__fromStack(add(_18, 4) , expr_142, expr_145)

                    let _20 := call(gas(), expr_140_address,  0,  _18, sub(_19, _18), _18, 32)

                    if iszero(_20) { revert_forward_1() }

                    let expr_146
                    if _20 {

                        // update freeMemoryPointer according to dynamic return size
                        finalize_allocation(_18, returndatasize())

                        // decode return parameters from external try-call into retVars
                        expr_146 :=  abi_decode_tuple_t_bool_fromMemory(_18, add(_18, returndatasize()))
                    }
                    /// @src 0:1477:1600  "if (depositAmount > depositRequired) {..."
                }
                /// @src 0:1633:1641  "deposits"
                let _21 := 0x00
                let expr_154 := _21
                /// @src 0:1642:1652  "msg.sender"
                let expr_156 := caller()
                /// @src 0:1633:1653  "deposits[msg.sender]"
                let _22 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_154,expr_156)
                let _23 := read_from_storage_split_offset_0_t_uint256(_22)
                let expr_157 := _23
                /// @src 0:1656:1671  "depositRequired"
                let _24 := var_depositRequired_124
                let expr_158 := _24
                /// @src 0:1633:1671  "deposits[msg.sender] + depositRequired"
                let expr_159 := checked_add_t_uint256(expr_157, expr_158)

                /// @src 0:1610:1618  "deposits"
                let _25 := 0x00
                let expr_150 := _25
                /// @src 0:1619:1629  "msg.sender"
                let expr_152 := caller()
                /// @src 0:1610:1630  "deposits[msg.sender]"
                let _26 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_150,expr_152)
                /// @src 0:1610:1671  "deposits[msg.sender] = deposits[msg.sender] + depositRequired"
                update_storage_value_offset_0t_uint256_to_t_uint256(_26, expr_159)
                let expr_160 := expr_159
                /// @src 0:1759:1766  "dvtPool"
                let _27_address := read_from_storage_split_offset_0_t_contract$_IERC20_$38(0x02)
                let expr_163_address := _27_address
                /// @src 0:1759:1775  "dvtPool.transfer"
                let expr_164_address := convert_t_contract$_IERC20_$38_to_t_address(expr_163_address)
                let expr_164_functionSelector := 0xa9059cbb
                /// @src 0:1776:1786  "msg.sender"
                let expr_166 := caller()
                /// @src 0:1788:1800  "borrowAmount"
                let _28 := var_borrowAmount_106
                let expr_167 := _28
                /// @src 0:1759:1801  "dvtPool.transfer(msg.sender, borrowAmount)"
                if iszero(extcodesize(expr_164_address)) { revert_error_0cc013b6b3b6beabea4e3a74a6d380f0df81852ca99887912475e1f66b2a2c20() }

                // storage for arguments and returned data
                let _29 := allocate_unbounded()
                mstore(_29, shift_left_224(expr_164_functionSelector))
                let _30 := abi_encode_tuple_t_address_t_uint256__to_t_address_t_uint256__fromStack(add(_29, 4) , expr_166, expr_167)

                let _31 := call(gas(), expr_164_address,  0,  _29, sub(_30, _29), _29, 32)

                if iszero(_31) { revert_forward_1() }

                let expr_168
                if _31 {

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_29, returndatasize())

                    // decode return parameters from external try-call into retVars
                    expr_168 :=  abi_decode_tuple_t_bool_fromMemory(_29, add(_29, returndatasize()))
                }
                /// @src 0:1751:1802  "require(dvtPool.transfer(msg.sender, borrowAmount))"
                require_helper(expr_168)

            }
            /// @src 0:566:2812  "contract PuppetPool {..."

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

            function checked_mul_t_uint256(x, y) -> product {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                // overflow, if x != 0 and y > (maxValue / x)
                if and(iszero(iszero(x)), gt(y, div(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, x))) { panic_error_0x11() }

                product := mul(x, y)
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

            function checked_div_t_uint256(x, y) -> r {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)
                if iszero(y) { panic_error_0x12() }

                r := div(x, y)
            }

            /// @ast-id 189
            /// @src 0:1815:1958  "function calculateDepositRequired(uint256 amount) public view returns (uint256) {..."
            function fun_calculateDepositRequired_189(var_amount_174) -> var__177 {
                /// @src 0:1886:1893  "uint256"
                let zero_t_uint256_32 := zero_value_for_split_t_uint256()
                var__177 := zero_t_uint256_32

                /// @src 0:1912:1918  "amount"
                let _33 := var_amount_174
                let expr_179 := _33
                /// @src 0:1921:1942  "_computeOraclePrice()"
                let expr_181 := fun__computeOraclePrice_205()
                /// @src 0:1912:1942  "amount * _computeOraclePrice()"
                let expr_182 := checked_mul_t_uint256(expr_179, expr_181)

                /// @src 0:1945:1946  "2"
                let expr_183 := 0x02
                /// @src 0:1912:1946  "amount * _computeOraclePrice() * 2"
                let expr_184 := checked_mul_t_uint256(expr_182, convert_t_rational_2_by_1_to_t_uint256(expr_183))

                /// @src 0:1949:1951  "10"
                let expr_185 := 0x0a
                /// @src 0:1912:1951  "amount * _computeOraclePrice() * 2 / 10"
                let expr_186 := checked_div_t_uint256(expr_184, convert_t_rational_10_by_1_to_t_uint256(expr_185))

                /// @src 0:1905:1951  "return amount * _computeOraclePrice() * 2 / 10"
                var__177 := expr_186
                leave

            }
            /// @src 0:566:2812  "contract PuppetPool {..."

            function extract_from_storage_value_offset_0t_contract$_IUniswapModel_$53(slot_value) -> value {
                value := cleanup_from_storage_t_contract$_IUniswapModel_$53(shift_right_0_unsigned(slot_value))
            }

            function read_from_storage_split_offset_0_t_contract$_IUniswapModel_$53(slot) -> value {
                value := extract_from_storage_value_offset_0t_contract$_IUniswapModel_$53(sload(slot))

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

            /// @ast-id 205
            /// @src 0:1964:2188  "function _computeOraclePrice() private view returns (uint256) {..."
            function fun__computeOraclePrice_205() -> var__192 {
                /// @src 0:2017:2024  "uint256"
                let zero_t_uint256_34 := zero_value_for_split_t_uint256()
                var__192 := zero_t_uint256_34

                /// @src 0:2121:2128  "uniswap"
                let _35_address := read_from_storage_split_offset_0_t_contract$_IUniswapModel_$53(0x04)
                let expr_194_address := _35_address
                /// @src 0:2121:2142  "uniswap.getETHBalance"
                let expr_195_address := convert_t_contract$_IUniswapModel_$53_to_t_address(expr_194_address)
                let expr_195_functionSelector := 0x83dcf6a5
                /// @src 0:2143:2144  "0"
                let expr_196 := 0x00
                /// @src 0:2121:2145  "uniswap.getETHBalance(0)"
                if iszero(extcodesize(expr_195_address)) { revert_error_0cc013b6b3b6beabea4e3a74a6d380f0df81852ca99887912475e1f66b2a2c20() }

                // storage for arguments and returned data
                let _36 := allocate_unbounded()
                mstore(_36, shift_left_224(expr_195_functionSelector))
                let _37 := abi_encode_tuple_t_rational_0_by_1__to_t_uint256__fromStack(add(_36, 4) , expr_196)

                let _38 := staticcall(gas(), expr_195_address,  _36, sub(_37, _36), _36, 32)

                if iszero(_38) { revert_forward_1() }

                let expr_197
                if _38 {

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_36, returndatasize())

                    // decode return parameters from external try-call into retVars
                    expr_197 :=  abi_decode_tuple_t_uint256_fromMemory(_36, add(_36, returndatasize()))
                }
                /// @src 0:2148:2155  "dvtPool"
                let _39_address := read_from_storage_split_offset_0_t_contract$_IERC20_$38(0x02)
                let expr_198_address := _39_address
                /// @src 0:2148:2165  "dvtPool.balanceOf"
                let expr_199_address := convert_t_contract$_IERC20_$38_to_t_address(expr_198_address)
                let expr_199_functionSelector := 0x70a08231
                /// @src 0:2166:2180  "uniswapAddress"
                let _40 := read_from_storage_split_offset_0_t_address(0x01)
                let expr_200 := _40
                /// @src 0:2148:2181  "dvtPool.balanceOf(uniswapAddress)"
                if iszero(extcodesize(expr_199_address)) { revert_error_0cc013b6b3b6beabea4e3a74a6d380f0df81852ca99887912475e1f66b2a2c20() }

                // storage for arguments and returned data
                let _41 := allocate_unbounded()
                mstore(_41, shift_left_224(expr_199_functionSelector))
                let _42 := abi_encode_tuple_t_address__to_t_address__fromStack(add(_41, 4) , expr_200)

                let _43 := staticcall(gas(), expr_199_address,  _41, sub(_42, _41), _41, 32)

                if iszero(_43) { revert_forward_1() }

                let expr_201
                if _43 {

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_41, returndatasize())

                    // decode return parameters from external try-call into retVars
                    expr_201 :=  abi_decode_tuple_t_uint256_fromMemory(_41, add(_41, returndatasize()))
                }
                /// @src 0:2121:2181  "uniswap.getETHBalance(0) / dvtPool.balanceOf(uniswapAddress)"
                let expr_202 := checked_div_t_uint256(expr_197, expr_201)

                /// @src 0:2114:2181  "return uniswap.getETHBalance(0) / dvtPool.balanceOf(uniswapAddress)"
                var__192 := expr_202
                leave

            }
            /// @src 0:566:2812  "contract PuppetPool {..."

            /// @ast-id 223
            /// @src 0:2194:2425  "function eurus_oracle_price(uint256) view external returns (uint256) {..."
            function fun_eurus_oracle_price_223(var__207) -> var__210 {
                /// @src 0:2254:2261  "uint256"
                let zero_t_uint256_44 := zero_value_for_split_t_uint256()
                var__210 := zero_t_uint256_44

                /// @src 0:2358:2365  "uniswap"
                let _45_address := read_from_storage_split_offset_0_t_contract$_IUniswapModel_$53(0x04)
                let expr_212_address := _45_address
                /// @src 0:2358:2379  "uniswap.getETHBalance"
                let expr_213_address := convert_t_contract$_IUniswapModel_$53_to_t_address(expr_212_address)
                let expr_213_functionSelector := 0x83dcf6a5
                /// @src 0:2380:2381  "0"
                let expr_214 := 0x00
                /// @src 0:2358:2382  "uniswap.getETHBalance(0)"
                if iszero(extcodesize(expr_213_address)) { revert_error_0cc013b6b3b6beabea4e3a74a6d380f0df81852ca99887912475e1f66b2a2c20() }

                // storage for arguments and returned data
                let _46 := allocate_unbounded()
                mstore(_46, shift_left_224(expr_213_functionSelector))
                let _47 := abi_encode_tuple_t_rational_0_by_1__to_t_uint256__fromStack(add(_46, 4) , expr_214)

                let _48 := staticcall(gas(), expr_213_address,  _46, sub(_47, _46), _46, 32)

                if iszero(_48) { revert_forward_1() }

                let expr_215
                if _48 {

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_46, returndatasize())

                    // decode return parameters from external try-call into retVars
                    expr_215 :=  abi_decode_tuple_t_uint256_fromMemory(_46, add(_46, returndatasize()))
                }
                /// @src 0:2385:2392  "dvtPool"
                let _49_address := read_from_storage_split_offset_0_t_contract$_IERC20_$38(0x02)
                let expr_216_address := _49_address
                /// @src 0:2385:2402  "dvtPool.balanceOf"
                let expr_217_address := convert_t_contract$_IERC20_$38_to_t_address(expr_216_address)
                let expr_217_functionSelector := 0x70a08231
                /// @src 0:2403:2417  "uniswapAddress"
                let _50 := read_from_storage_split_offset_0_t_address(0x01)
                let expr_218 := _50
                /// @src 0:2385:2418  "dvtPool.balanceOf(uniswapAddress)"
                if iszero(extcodesize(expr_217_address)) { revert_error_0cc013b6b3b6beabea4e3a74a6d380f0df81852ca99887912475e1f66b2a2c20() }

                // storage for arguments and returned data
                let _51 := allocate_unbounded()
                mstore(_51, shift_left_224(expr_217_functionSelector))
                let _52 := abi_encode_tuple_t_address__to_t_address__fromStack(add(_51, 4) , expr_218)

                let _53 := staticcall(gas(), expr_217_address,  _51, sub(_52, _51), _51, 32)

                if iszero(_53) { revert_forward_1() }

                let expr_219
                if _53 {

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_51, returndatasize())

                    // decode return parameters from external try-call into retVars
                    expr_219 :=  abi_decode_tuple_t_uint256_fromMemory(_51, add(_51, returndatasize()))
                }
                /// @src 0:2358:2418  "uniswap.getETHBalance(0) / dvtPool.balanceOf(uniswapAddress)"
                let expr_220 := checked_div_t_uint256(expr_215, expr_219)

                /// @src 0:2351:2418  "return uniswap.getETHBalance(0) / dvtPool.balanceOf(uniswapAddress)"
                var__210 := expr_220
                leave

            }
            /// @src 0:566:2812  "contract PuppetPool {..."

            /// @ast-id 240
            /// @src 0:2431:2574  "function eurus_deposit_required(uint256 amount) view external returns (uint256) {..."
            function fun_eurus_deposit_required_240(var_amount_225) -> var__228 {
                /// @src 0:2502:2509  "uint256"
                let zero_t_uint256_54 := zero_value_for_split_t_uint256()
                var__228 := zero_t_uint256_54

                /// @src 0:2528:2534  "amount"
                let _55 := var_amount_225
                let expr_230 := _55
                /// @src 0:2537:2558  "_computeOraclePrice()"
                let expr_232 := fun__computeOraclePrice_205()
                /// @src 0:2528:2558  "amount * _computeOraclePrice()"
                let expr_233 := checked_mul_t_uint256(expr_230, expr_232)

                /// @src 0:2561:2562  "2"
                let expr_234 := 0x02
                /// @src 0:2528:2562  "amount * _computeOraclePrice() * 2"
                let expr_235 := checked_mul_t_uint256(expr_233, convert_t_rational_2_by_1_to_t_uint256(expr_234))

                /// @src 0:2565:2567  "10"
                let expr_236 := 0x0a
                /// @src 0:2528:2567  "amount * _computeOraclePrice() * 2 / 10"
                let expr_237 := checked_div_t_uint256(expr_235, convert_t_rational_10_by_1_to_t_uint256(expr_236))

                /// @src 0:2521:2567  "return amount * _computeOraclePrice() * 2 / 10"
                var__228 := expr_237
                leave

            }
            /// @src 0:566:2812  "contract PuppetPool {..."

            /// @ast-id 249
            /// @src 0:2580:2680  "function eurus_dep0() view external returns (uint256) {..."
            function fun_eurus_dep0_249() -> var__243 {
                /// @src 0:2625:2632  "uint256"
                let zero_t_uint256_56 := zero_value_for_split_t_uint256()
                var__243 := zero_t_uint256_56

                /// @src 0:2651:2672  "_computeOraclePrice()"
                let expr_246 := fun__computeOraclePrice_205()
                /// @src 0:2644:2672  "return _computeOraclePrice()"
                var__243 := expr_246
                leave

            }
            /// @src 0:566:2812  "contract PuppetPool {..."

            /// @ast-id 262
            /// @src 0:2686:2809  "function eurus_dep1(uint256 amount) view external returns (uint256) {..."
            function fun_eurus_dep1_262(var_amount_251) -> var__254 {
                /// @src 0:2745:2752  "uint256"
                let zero_t_uint256_57 := zero_value_for_split_t_uint256()
                var__254 := zero_t_uint256_57

                /// @src 0:2771:2777  "amount"
                let _58 := var_amount_251
                let expr_256 := _58
                /// @src 0:2780:2801  "_computeOraclePrice()"
                let expr_258 := fun__computeOraclePrice_205()
                /// @src 0:2771:2801  "amount * _computeOraclePrice()"
                let expr_259 := checked_mul_t_uint256(expr_256, expr_258)

                /// @src 0:2764:2801  "return amount * _computeOraclePrice()"
                var__254 := expr_259
                leave

            }
            /// @src 0:566:2812  "contract PuppetPool {..."

        }

        data ".metadata" hex"a364697066735822122000776f62d3fdf4c8d10c142079b7ea1a7173545a1559b8a524103f741f88dadb6c6578706572696d656e74616cf564736f6c63430008090041"
    }

}

