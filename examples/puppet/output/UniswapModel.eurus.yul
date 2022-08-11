
/// @use-src 4:"UniswapModel.sol"
object "UniswapModel_1143" {
    code {
        /// @src 4:94:1331  "contract UniswapModel {..."
        mstore(64, memoryguard(128))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        constructor_UniswapModel_1143()

        // adapted by Eurus: remove_post_constructor_datacall
        // let _1 := allocate_unbounded()
        // codecopy(_1, dataoffset("UniswapModel_1143_deployed"), datasize("UniswapModel_1143_deployed"))
        // return(_1, datasize("UniswapModel_1143_deployed"))

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
            revert(0, 0)
        }

        /// @ast-id 993
        /// @src 4:176:193  "constructor () {}"
        function constructor_UniswapModel_1143() {

            /// @src 4:176:193  "constructor () {}"

        }
        /// @src 4:94:1331  "contract UniswapModel {..."

    }
    /// @use-src 4:"UniswapModel.sol"
    object "UniswapModel_1143_deployed" {
        code {
            /// @src 4:94:1331  "contract UniswapModel {..."
            mstore(64, memoryguard(128))

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x7aebab27
                {
                    // swapDVT4ETH(uint256,uint256)

                    external_fun_swapDVT4ETH_1142()
                }

                case 0x83dcf6a5
                {
                    // getETHBalance(uint256)

                    external_fun_getETHBalance_1045()
                }

                case 0xa7be7948
                {
                    // setPoolAddresses(address,address)

                    external_fun_setPoolAddresses_1013()
                }

                case 0xcabaffcf
                {
                    // dvtPool()

                    external_fun_dvtPool_986()
                }

                case 0xf16673a4
                {
                    // ethPool()

                    external_fun_ethPool_989()
                }

                case 0xfadbf78c
                {
                    // getDVTBalance(uint256)

                    external_fun_getDVTBalance_1029()
                }

                default {
                    // adapted by Eurus: hijack_dispatcher_miss
                    eurus_dispatcher_miss(selector)
                }
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

            function external_fun_swapDVT4ETH_1142() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1 :=  abi_decode_tuple_t_uint256t_uint256(4, calldatasize())
                let ret_0 :=  fun_swapDVT4ETH_1142(param_0, param_1)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function abi_decode_tuple_t_uint256(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function external_fun_getETHBalance_1045() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                let ret_0 :=  fun_getETHBalance_1045(param_0)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

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

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function external_fun_setPoolAddresses_1013() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1 :=  abi_decode_tuple_t_addresst_address(4, calldatasize())
                fun_setPoolAddresses_1013(param_0, param_1)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

            }

            function shift_right_unsigned_dynamic(bits, value) -> newValue {
                newValue :=

                shr(bits, value)

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

            /// @ast-id 986
            /// @src 4:123:143  "ERC20 public dvtPool"
            function getter_fun_dvtPool_986() -> ret_address {

                let slot := 0
                let offset := 0

                ret_address := read_from_storage_split_dynamic_t_contract$_ERC20_$236(slot, offset)

            }
            /// @src 4:94:1331  "contract UniswapModel {..."

            function identity(value) -> ret {
                ret := value
            }

            function convert_t_uint160_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(identity(cleanup_t_uint160(value)))
            }

            function convert_t_uint160_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

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

            function external_fun_dvtPool_986() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                let ret_0 :=  getter_fun_dvtPool_986()
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_contract$_ERC20_$236__to_t_address__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            /// @ast-id 989
            /// @src 4:149:169  "ERC20 public ethPool"
            function getter_fun_ethPool_989() -> ret_address {

                let slot := 1
                let offset := 0

                ret_address := read_from_storage_split_dynamic_t_contract$_ERC20_$236(slot, offset)

            }
            /// @src 4:94:1331  "contract UniswapModel {..."

            function external_fun_ethPool_989() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                let ret_0 :=  getter_fun_ethPool_989()
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_contract$_ERC20_$236__to_t_address__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_getDVTBalance_1029() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                let ret_0 :=  fun_getDVTBalance_1029(param_0)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74() {
                // adapted by Eurus: hijack_dispatcher_revert
                eurus_dispatcher_revert()
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

            /// @ast-id 1013
            /// @src 4:199:355  "function setPoolAddresses(address dvtAddress, address ethAddress) external {..."
            function fun_setPoolAddresses_1013(var_dvtAddress_995, var_ethAddress_997) {

                /// @src 4:300:310  "dvtAddress"
                let _1 := var_dvtAddress_995
                let expr_1002 := _1
                /// @src 4:294:311  "ERC20(dvtAddress)"
                let expr_1003_address := convert_t_address_to_t_contract$_ERC20_$236(expr_1002)
                /// @src 4:284:311  "dvtPool = ERC20(dvtAddress)"
                update_storage_value_offset_0t_contract$_ERC20_$236_to_t_contract$_ERC20_$236(0x00, expr_1003_address)
                let expr_1004_address := expr_1003_address
                /// @src 4:337:347  "ethAddress"
                let _2 := var_ethAddress_997
                let expr_1008 := _2
                /// @src 4:331:348  "ERC20(ethAddress)"
                let expr_1009_address := convert_t_address_to_t_contract$_ERC20_$236(expr_1008)
                /// @src 4:321:348  "ethPool = ERC20(ethAddress)"
                update_storage_value_offset_0t_contract$_ERC20_$236_to_t_contract$_ERC20_$236(0x01, expr_1009_address)
                let expr_1010_address := expr_1009_address

            }
            /// @src 4:94:1331  "contract UniswapModel {..."

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

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

            function convert_t_contract$_UniswapModel_$1143_to_t_address(value) -> converted {
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

            /// @ast-id 1029
            /// @src 4:361:481  "function getDVTBalance(uint256) external view returns (uint256) {..."
            function fun_getDVTBalance_1029(var__1015) -> var__1018 {
                /// @src 4:416:423  "uint256"
                let zero_t_uint256_3 := zero_value_for_split_t_uint256()
                var__1018 := zero_t_uint256_3

                /// @src 4:442:449  "dvtPool"
                let _4_address := read_from_storage_split_offset_0_t_contract$_ERC20_$236(0x00)
                let expr_1020_address := _4_address
                /// @src 4:442:459  "dvtPool.balanceOf"
                let expr_1021_address := convert_t_contract$_ERC20_$236_to_t_address(expr_1020_address)
                let expr_1021_functionSelector := 0x70a08231
                /// @src 4:468:472  "this"
                let expr_1024_address := address()
                /// @src 4:460:473  "address(this)"
                let expr_1025 := convert_t_contract$_UniswapModel_$1143_to_t_address(expr_1024_address)
                /// @src 4:442:474  "dvtPool.balanceOf(address(this))"

                // storage for arguments and returned data
                let _5 := allocate_unbounded()
                mstore(_5, shift_left_224(expr_1021_functionSelector))
                let _6 := abi_encode_tuple_t_address__to_t_address__fromStack(add(_5, 4) , expr_1025)

                let _7 := staticcall(gas(), expr_1021_address,  _5, sub(_6, _5), _5, 32)

                if iszero(_7) { revert_forward_1() }

                let expr_1026
                if _7 {

                    let _8 := 32

                    if gt(_8, returndatasize()) {
                        _8 := returndatasize()
                    }

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_5, _8)

                    // decode return parameters from external try-call into retVars
                    expr_1026 :=  abi_decode_tuple_t_uint256_fromMemory(_5, add(_5, _8))
                }
                /// @src 4:435:474  "return dvtPool.balanceOf(address(this))"
                var__1018 := expr_1026
                leave

            }
            /// @src 4:94:1331  "contract UniswapModel {..."

            /// @ast-id 1045
            /// @src 4:487:607  "function getETHBalance(uint256) external view returns (uint256) {..."
            function fun_getETHBalance_1045(var__1031) -> var__1034 {
                /// @src 4:542:549  "uint256"
                let zero_t_uint256_9 := zero_value_for_split_t_uint256()
                var__1034 := zero_t_uint256_9

                /// @src 4:568:575  "ethPool"
                let _10_address := read_from_storage_split_offset_0_t_contract$_ERC20_$236(0x01)
                let expr_1036_address := _10_address
                /// @src 4:568:585  "ethPool.balanceOf"
                let expr_1037_address := convert_t_contract$_ERC20_$236_to_t_address(expr_1036_address)
                let expr_1037_functionSelector := 0x70a08231
                /// @src 4:594:598  "this"
                let expr_1040_address := address()
                /// @src 4:586:599  "address(this)"
                let expr_1041 := convert_t_contract$_UniswapModel_$1143_to_t_address(expr_1040_address)
                /// @src 4:568:600  "ethPool.balanceOf(address(this))"

                // storage for arguments and returned data
                let _11 := allocate_unbounded()
                mstore(_11, shift_left_224(expr_1037_functionSelector))
                let _12 := abi_encode_tuple_t_address__to_t_address__fromStack(add(_11, 4) , expr_1041)

                let _13 := staticcall(gas(), expr_1037_address,  _11, sub(_12, _11), _11, 32)

                if iszero(_13) { revert_forward_1() }

                let expr_1042
                if _13 {

                    let _14 := 32

                    if gt(_14, returndatasize()) {
                        _14 := returndatasize()
                    }

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_11, _14)

                    // decode return parameters from external try-call into retVars
                    expr_1042 :=  abi_decode_tuple_t_uint256_fromMemory(_11, add(_11, _14))
                }
                /// @src 4:561:600  "return ethPool.balanceOf(address(this))"
                var__1034 := expr_1042
                leave

            }
            /// @src 4:94:1331  "contract UniswapModel {..."

            function array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length) -> updated_pos {
                mstore(pos, length)
                updated_pos := add(pos, 0x20)
            }

            function store_literal_in_memory_c1b29f9b061701f635e8c2e636d7926f78b3c9c05d3ad37f3ccc3e071b5e8eeb(memPtr) {

                mstore(add(memPtr, 0), "not enough eth balance")

            }

            function abi_encode_t_stringliteral_c1b29f9b061701f635e8c2e636d7926f78b3c9c05d3ad37f3ccc3e071b5e8eeb_to_t_string_memory_ptr_fromStack(pos) -> end {
                pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 22)
                store_literal_in_memory_c1b29f9b061701f635e8c2e636d7926f78b3c9c05d3ad37f3ccc3e071b5e8eeb(pos)
                end := add(pos, 32)
            }

            function abi_encode_tuple_t_stringliteral_c1b29f9b061701f635e8c2e636d7926f78b3c9c05d3ad37f3ccc3e071b5e8eeb__to_t_string_memory_ptr__fromStack(headStart ) -> tail {
                tail := add(headStart, 32)

                mstore(add(headStart, 0), sub(tail, headStart))
                tail := abi_encode_t_stringliteral_c1b29f9b061701f635e8c2e636d7926f78b3c9c05d3ad37f3ccc3e071b5e8eeb_to_t_string_memory_ptr_fromStack( tail)

            }

            function require_helper_t_stringliteral_c1b29f9b061701f635e8c2e636d7926f78b3c9c05d3ad37f3ccc3e071b5e8eeb(condition ) {
                if iszero(condition) {
                    let memPtr := allocate_unbounded()
                    mstore(memPtr, 0x08c379a000000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple_t_stringliteral_c1b29f9b061701f635e8c2e636d7926f78b3c9c05d3ad37f3ccc3e071b5e8eeb__to_t_string_memory_ptr__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

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

            /// @ast-id 1142
            /// @src 4:639:1328  "function swapDVT4ETH(uint256 pad, uint256 v) external returns (uint256) {..."
            function fun_swapDVT4ETH_1142(var_pad_1047, var_v_1049) -> var__1052 {
                /// @src 4:702:709  "uint256"
                let zero_t_uint256_15 := zero_value_for_split_t_uint256()
                var__1052 := zero_t_uint256_15

                /// @src 4:793:800  "dvtPool"
                let _16_address := read_from_storage_split_offset_0_t_contract$_ERC20_$236(0x00)
                let expr_1056_address := _16_address
                /// @src 4:793:810  "dvtPool.balanceOf"
                let expr_1057_address := convert_t_contract$_ERC20_$236_to_t_address(expr_1056_address)
                let expr_1057_functionSelector := 0x70a08231
                /// @src 4:819:823  "this"
                let expr_1060_address := address()
                /// @src 4:811:824  "address(this)"
                let expr_1061 := convert_t_contract$_UniswapModel_$1143_to_t_address(expr_1060_address)
                /// @src 4:793:825  "dvtPool.balanceOf(address(this))"

                // storage for arguments and returned data
                let _17 := allocate_unbounded()
                mstore(_17, shift_left_224(expr_1057_functionSelector))
                let _18 := abi_encode_tuple_t_address__to_t_address__fromStack(add(_17, 4) , expr_1061)

                let _19 := staticcall(gas(), expr_1057_address,  _17, sub(_18, _17), _17, 32)

                if iszero(_19) { revert_forward_1() }

                let expr_1062
                if _19 {

                    let _20 := 32

                    if gt(_20, returndatasize()) {
                        _20 := returndatasize()
                    }

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_17, _20)

                    // decode return parameters from external try-call into retVars
                    expr_1062 :=  abi_decode_tuple_t_uint256_fromMemory(_17, add(_17, _20))
                }
                /// @src 4:772:825  "uint256 DVTBalance = dvtPool.balanceOf(address(this))"
                let var_DVTBalance_1055 := expr_1062
                /// @src 4:856:863  "ethPool"
                let _21_address := read_from_storage_split_offset_0_t_contract$_ERC20_$236(0x01)
                let expr_1066_address := _21_address
                /// @src 4:856:873  "ethPool.balanceOf"
                let expr_1067_address := convert_t_contract$_ERC20_$236_to_t_address(expr_1066_address)
                let expr_1067_functionSelector := 0x70a08231
                /// @src 4:882:886  "this"
                let expr_1070_address := address()
                /// @src 4:874:887  "address(this)"
                let expr_1071 := convert_t_contract$_UniswapModel_$1143_to_t_address(expr_1070_address)
                /// @src 4:856:888  "ethPool.balanceOf(address(this))"

                // storage for arguments and returned data
                let _22 := allocate_unbounded()
                mstore(_22, shift_left_224(expr_1067_functionSelector))
                let _23 := abi_encode_tuple_t_address__to_t_address__fromStack(add(_22, 4) , expr_1071)

                let _24 := staticcall(gas(), expr_1067_address,  _22, sub(_23, _22), _22, 32)

                if iszero(_24) { revert_forward_1() }

                let expr_1072
                if _24 {

                    let _25 := 32

                    if gt(_25, returndatasize()) {
                        _25 := returndatasize()
                    }

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_22, _25)

                    // decode return parameters from external try-call into retVars
                    expr_1072 :=  abi_decode_tuple_t_uint256_fromMemory(_22, add(_22, _25))
                }
                /// @src 4:835:888  "uint256 ETHBalance = ethPool.balanceOf(address(this))"
                let var_ETHBalance_1065 := expr_1072
                /// @src 4:906:913  "ethPool"
                let _26_address := read_from_storage_split_offset_0_t_contract$_ERC20_$236(0x01)
                let expr_1075_address := _26_address
                /// @src 4:906:923  "ethPool.balanceOf"
                let expr_1076_address := convert_t_contract$_ERC20_$236_to_t_address(expr_1075_address)
                let expr_1076_functionSelector := 0x70a08231
                /// @src 4:924:934  "msg.sender"
                let expr_1078 := caller()
                /// @src 4:906:935  "ethPool.balanceOf(msg.sender)"

                // storage for arguments and returned data
                let _27 := allocate_unbounded()
                mstore(_27, shift_left_224(expr_1076_functionSelector))
                let _28 := abi_encode_tuple_t_address__to_t_address__fromStack(add(_27, 4) , expr_1078)

                let _29 := staticcall(gas(), expr_1076_address,  _27, sub(_28, _27), _27, 32)

                if iszero(_29) { revert_forward_1() }

                let expr_1079
                if _29 {

                    let _30 := 32

                    if gt(_30, returndatasize()) {
                        _30 := returndatasize()
                    }

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_27, _30)

                    // decode return parameters from external try-call into retVars
                    expr_1079 :=  abi_decode_tuple_t_uint256_fromMemory(_27, add(_27, _30))
                }
                /// @src 4:937:938  "v"
                let _31 := var_v_1049
                let expr_1080 := _31
                /// @src 4:906:938  "ethPool.balanceOf(msg.sender)>=v"
                let expr_1081 := iszero(lt(cleanup_t_uint256(expr_1079), cleanup_t_uint256(expr_1080)))
                /// @src 4:898:965  "require(ethPool.balanceOf(msg.sender)>=v, \"not enough eth balance\")"
                require_helper_t_stringliteral_c1b29f9b061701f635e8c2e636d7926f78b3c9c05d3ad37f3ccc3e071b5e8eeb(expr_1081)
                /// @src 4:987:997  "DVTBalance"
                let _32 := var_DVTBalance_1055
                let expr_1087 := _32
                /// @src 4:1000:1010  "ETHBalance"
                let _33 := var_ETHBalance_1065
                let expr_1088 := _33
                /// @src 4:987:1010  "DVTBalance * ETHBalance"
                let expr_1089 := checked_mul_t_uint256(expr_1087, expr_1088)

                /// @src 4:975:1010  "uint256 k = DVTBalance * ETHBalance"
                let var_k_1086 := expr_1089
                /// @src 4:1037:1047  "DVTBalance"
                let _34 := var_DVTBalance_1055
                let expr_1093 := _34
                /// @src 4:1050:1051  "v"
                let _35 := var_v_1049
                let expr_1094 := _35
                /// @src 4:1037:1051  "DVTBalance + v"
                let expr_1095 := checked_add_t_uint256(expr_1093, expr_1094)

                /// @src 4:1020:1051  "uint256 newDVT = DVTBalance + v"
                let var_newDVT_1092 := expr_1095
                /// @src 4:1078:1079  "k"
                let _36 := var_k_1086
                let expr_1099 := _36
                /// @src 4:1082:1088  "newDVT"
                let _37 := var_newDVT_1092
                let expr_1100 := _37
                /// @src 4:1078:1088  "k / newDVT"
                let expr_1101 := checked_div_t_uint256(expr_1099, expr_1100)

                /// @src 4:1061:1088  "uint256 newETH = k / newDVT"
                let var_newETH_1098 := expr_1101
                /// @src 4:1110:1120  "ETHBalance"
                let _38 := var_ETHBalance_1065
                let expr_1105 := _38
                /// @src 4:1123:1129  "newETH"
                let _39 := var_newETH_1098
                let expr_1106 := _39
                /// @src 4:1110:1129  "ETHBalance - newETH"
                let expr_1107 := checked_sub_t_uint256(expr_1105, expr_1106)

                /// @src 4:1098:1129  "uint256 s = ETHBalance - newETH"
                let var_s_1104 := expr_1107
                /// @src 4:1157:1164  "ethPool"
                let _40_address := read_from_storage_split_offset_0_t_contract$_ERC20_$236(0x01)
                let expr_1109_address := _40_address
                /// @src 4:1157:1177  "ethPool.transferFrom"
                let expr_1111_address := convert_t_contract$_ERC20_$236_to_t_address(expr_1109_address)
                let expr_1111_functionSelector := 0x23b872dd
                /// @src 4:1186:1190  "this"
                let expr_1114_address := address()
                /// @src 4:1178:1191  "address(this)"
                let expr_1115 := convert_t_contract$_UniswapModel_$1143_to_t_address(expr_1114_address)
                /// @src 4:1201:1211  "msg.sender"
                let expr_1119 := caller()
                /// @src 4:1193:1212  "address(msg.sender)"
                let expr_1120 := expr_1119
                /// @src 4:1214:1215  "s"
                let _41 := var_s_1104
                let expr_1121 := _41
                /// @src 4:1157:1216  "ethPool.transferFrom(address(this), address(msg.sender), s)"

                // storage for arguments and returned data
                let _42 := allocate_unbounded()
                mstore(_42, shift_left_224(expr_1111_functionSelector))
                let _43 := abi_encode_tuple_t_address_t_address_t_uint256__to_t_address_t_address_t_uint256__fromStack(add(_42, 4) , expr_1115, expr_1120, expr_1121)

                let _44 := call(gas(), expr_1111_address,  0,  _42, sub(_43, _42), _42, 32)

                if iszero(_44) { revert_forward_1() }

                let expr_1122
                if _44 {

                    let _45 := 32

                    if gt(_45, returndatasize()) {
                        _45 := returndatasize()
                    }

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_42, _45)

                    // decode return parameters from external try-call into retVars
                    expr_1122 :=  abi_decode_tuple_t_bool_fromMemory(_42, add(_42, _45))
                }
                /// @src 4:1226:1233  "dvtPool"
                let _46_address := read_from_storage_split_offset_0_t_contract$_ERC20_$236(0x00)
                let expr_1124_address := _46_address
                /// @src 4:1226:1246  "dvtPool.transferFrom"
                let expr_1126_address := convert_t_contract$_ERC20_$236_to_t_address(expr_1124_address)
                let expr_1126_functionSelector := 0x23b872dd
                /// @src 4:1255:1265  "msg.sender"
                let expr_1130 := caller()
                /// @src 4:1247:1266  "address(msg.sender)"
                let expr_1131 := expr_1130
                /// @src 4:1276:1280  "this"
                let expr_1134_address := address()
                /// @src 4:1268:1281  "address(this)"
                let expr_1135 := convert_t_contract$_UniswapModel_$1143_to_t_address(expr_1134_address)
                /// @src 4:1283:1284  "v"
                let _47 := var_v_1049
                let expr_1136 := _47
                /// @src 4:1226:1285  "dvtPool.transferFrom(address(msg.sender), address(this), v)"

                // storage for arguments and returned data
                let _48 := allocate_unbounded()
                mstore(_48, shift_left_224(expr_1126_functionSelector))
                let _49 := abi_encode_tuple_t_address_t_address_t_uint256__to_t_address_t_address_t_uint256__fromStack(add(_48, 4) , expr_1131, expr_1135, expr_1136)

                let _50 := call(gas(), expr_1126_address,  0,  _48, sub(_49, _48), _48, 32)

                if iszero(_50) { revert_forward_1() }

                let expr_1137
                if _50 {

                    let _51 := 32

                    if gt(_51, returndatasize()) {
                        _51 := returndatasize()
                    }

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_48, _51)

                    // decode return parameters from external try-call into retVars
                    expr_1137 :=  abi_decode_tuple_t_bool_fromMemory(_48, add(_48, _51))
                }
                /// @src 4:1320:1321  "s"
                let _52 := var_s_1104
                let expr_1139 := _52
                /// @src 4:1313:1321  "return s"
                var__1052 := expr_1139
                leave

            }
            /// @src 4:94:1331  "contract UniswapModel {..."

        }

        
    }

}

