
/// @use-src 0:".//Eurus.sol", 1:"symex/symex.sol"
object "symex1_263" {
    code {
        /// @src 1:1904:2779  "contract symex1 is Eurus {..."
        mstore(64, memoryguard(128))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        constructor_symex1_263()

        let _1 := allocate_unbounded()
        codecopy(_1, dataoffset("symex1_263_deployed"), datasize("symex1_263_deployed"))

        return(_1, datasize("symex1_263_deployed"))

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
            revert(0, 0)
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

        function cleanup_t_rational_18_by_1(value) -> cleaned {
            cleaned := value
        }

        function cleanup_t_uint256(value) -> cleaned {
            cleaned := value
        }

        function identity(value) -> ret {
            ret := value
        }

        function convert_t_rational_18_by_1_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint256(identity(cleanup_t_rational_18_by_1(value)))
        }

        function prepare_store_t_uint256(value) -> ret {
            ret := value
        }

        function update_storage_value_offset_0t_rational_18_by_1_to_t_uint256(slot, value_0) {
            let convertedValue_0 := convert_t_rational_18_by_1_to_t_uint256(value_0)
            sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
        }

        /// @ast-id 182
        /// @src 1:1960:1976  "constructor() {}"
        function constructor_symex1_263() {

            /// @src 1:1960:1976  "constructor() {}"
            constructor_Eurus_1291()
            /// @src 1:1951:1953  "18"
            let expr_177 := 0x12
            update_storage_value_offset_0t_rational_18_by_1_to_t_uint256(0x00, expr_177)

        }
        /// @src 1:1904:2779  "contract symex1 is Eurus {..."

        /// @ast-id 382
        /// @src 0:80:96  "constructor() {}"
        function constructor_Eurus_1291() {

            /// @src 0:80:96  "constructor() {}"

        }
        /// @src 1:1904:2779  "contract symex1 is Eurus {..."

    }
    /// @use-src 0:".//Eurus.sol", 1:"symex/symex.sol"
    object "symex1_263_deployed" {
        code {
            /// @src 1:1904:2779  "contract symex1 is Eurus {..."
            mstore(64, memoryguard(128))

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x42ae0973
                {
                    // setBase(bool,uint256)

                    external_fun_setBase_233()
                }

                case 0x6b59084d
                {
                    // test1()

                    external_fun_test1_262()
                }

                case 0x77ff24f4
                {
                    // test0()

                    external_fun_test0_211()
                }

                case 0x7ea2b297
                {
                    // bigger_than_10(uint256)

                    external_fun_bigger_than_10_195()
                }

                case 0xd104a136
                {
                    // getBase()

                    external_fun_getBase_241()
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

            function cleanup_t_bool(value) -> cleaned {
                cleaned := iszero(iszero(value))
            }

            function validator_revert_t_bool(value) {
                if iszero(eq(value, cleanup_t_bool(value))) { revert(0, 0) }
            }

            function abi_decode_t_bool(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_bool(value)
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

            function abi_decode_tuple_t_boolt_uint256(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_bool(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 32

                    value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function external_fun_setBase_233() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1 :=  abi_decode_tuple_t_boolt_uint256(4, calldatasize())
                fun_setBase_233(param_0, param_1)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

            }

            function external_fun_test1_262() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                fun_test1_262()
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function abi_encode_t_bool_to_t_bool_fromStack(value, pos) {
                mstore(pos, cleanup_t_bool(value))
            }

            function abi_encode_tuple_t_bool__to_t_bool__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_bool_to_t_bool_fromStack(value0,  add(headStart, 0))

            }

            function external_fun_test0_211() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                let ret_0 :=  fun_test0_211()
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function abi_decode_tuple_t_uint256(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function external_fun_bigger_than_10_195() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                let ret_0 :=  fun_bigger_than_10_195(param_0)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple_t_uint256__to_t_uint256__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

            }

            function external_fun_getBase_241() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                let ret_0 :=  fun_getBase_241()
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

            function cleanup_t_rational_10_by_1(value) -> cleaned {
                cleaned := value
            }

            function identity(value) -> ret {
                ret := value
            }

            function convert_t_rational_10_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_10_by_1(value)))
            }

            /// @ast-id 195
            /// @src 1:1982:2074  "function bigger_than_10(uint256 a) public pure returns (bool) {..."
            function fun_bigger_than_10_195(var_a_184) -> var__187 {
                /// @src 1:2038:2042  "bool"
                let zero_t_bool_1 := zero_value_for_split_t_bool()
                var__187 := zero_t_bool_1

                /// @src 1:2062:2063  "a"
                let _2 := var_a_184
                let expr_189 := _2
                /// @src 1:2064:2066  "10"
                let expr_190 := 0x0a
                /// @src 1:2062:2066  "a>10"
                let expr_191 := gt(cleanup_t_uint256(expr_189), convert_t_rational_10_by_1_to_t_uint256(expr_190))
                /// @src 1:2061:2067  "(a>10)"
                let expr_192 := expr_191
                /// @src 1:2054:2067  "return (a>10)"
                var__187 := expr_192
                leave

            }
            /// @src 1:1904:2779  "contract symex1 is Eurus {..."

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

            function array_allocation_size_t_string_memory_ptr(length) -> size {
                // Make sure we can allocate memory without overflow
                if gt(length, 0xffffffffffffffff) { panic_error_0x41() }

                size := round_up_to_mul_of_32(length)

                // add length slot
                size := add(size, 0x20)

            }

            function allocate_memory_array_t_string_memory_ptr(length) -> memPtr {
                let allocSize := array_allocation_size_t_string_memory_ptr(length)
                memPtr := allocate_memory(allocSize)

                mstore(memPtr, length)

            }

            function store_literal_in_memory_b56c3cd0ae450707fef38e8a92310fbf9531972839da7b3665de934e9713e35d(memPtr) {

                mstore(add(memPtr, 0), "syma")

            }

            function copy_literal_to_memory_b56c3cd0ae450707fef38e8a92310fbf9531972839da7b3665de934e9713e35d() -> memPtr {
                memPtr := allocate_memory_array_t_string_memory_ptr(4)
                store_literal_in_memory_b56c3cd0ae450707fef38e8a92310fbf9531972839da7b3665de934e9713e35d(add(memPtr, 32))
            }

            function convert_t_stringliteral_b56c3cd0ae450707fef38e8a92310fbf9531972839da7b3665de934e9713e35d_to_t_string_memory_ptr() -> converted {
                converted := copy_literal_to_memory_b56c3cd0ae450707fef38e8a92310fbf9531972839da7b3665de934e9713e35d()
            }

            /// @ast-id 211
            /// @src 1:2080:2223  "function test0() public pure returns (bool) {..."
            function fun_test0_211() -> var__198 {
                /// @src 1:2118:2122  "bool"
                let zero_t_bool_3 := zero_value_for_split_t_bool()
                var__198 := zero_t_bool_3

                /// @src 1:2149:2179  "eurus_symbolic_uint256(\"syma\")"
                let _4_mpos := convert_t_stringliteral_b56c3cd0ae450707fef38e8a92310fbf9531972839da7b3665de934e9713e35d_to_t_string_memory_ptr()
                let expr_204 := fun_eurus_symbolic_uint256_428(_4_mpos)
                /// @src 1:2134:2179  "uint256 syma = eurus_symbolic_uint256(\"syma\")"
                let var_syma_201 := expr_204
                /// @src 1:2211:2215  "syma"
                let _5 := var_syma_201
                let expr_207 := _5
                /// @src 1:2196:2216  "bigger_than_10(syma)"
                let expr_208 := fun_bigger_than_10_195(expr_207)
                /// @src 1:2189:2216  "return bigger_than_10(syma)"
                var__198 := expr_208
                leave

            }
            /// @src 1:1904:2779  "contract symex1 is Eurus {..."

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

            function cleanup_t_rational_2_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_2_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_2_by_1(value)))
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

            /// @ast-id 233
            /// @src 1:2229:2355  "function setBase(bool cond, uint256 _base) public {..."
            function fun_setBase_233(var_cond_213, var__base_215) {

                /// @src 1:2293:2297  "cond"
                let _6 := var_cond_213
                let expr_218 := _6
                /// @src 1:2289:2349  "if (cond) { base = _base*2; }..."
                switch expr_218
                case 0 {
                    /// @src 1:2341:2346  "_base"
                    let _7 := var__base_215
                    let expr_227 := _7
                    /// @src 1:2334:2346  "base = _base"
                    update_storage_value_offset_0t_uint256_to_t_uint256(0x00, expr_227)
                    let expr_228 := expr_227
                    /// @src 1:2289:2349  "if (cond) { base = _base*2; }..."
                }
                default {
                    /// @src 1:2308:2313  "_base"
                    let _8 := var__base_215
                    let expr_220 := _8
                    /// @src 1:2314:2315  "2"
                    let expr_221 := 0x02
                    /// @src 1:2308:2315  "_base*2"
                    let expr_222 := checked_mul_t_uint256(expr_220, convert_t_rational_2_by_1_to_t_uint256(expr_221))

                    /// @src 1:2301:2315  "base = _base*2"
                    update_storage_value_offset_0t_uint256_to_t_uint256(0x00, expr_222)
                    let expr_223 := expr_222
                    /// @src 1:2289:2349  "if (cond) { base = _base*2; }..."
                }

            }
            /// @src 1:1904:2779  "contract symex1 is Eurus {..."

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

            function shift_right_0_unsigned(value) -> newValue {
                newValue :=

                shr(0, value)

            }

            function cleanup_from_storage_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function read_from_storage_split_offset_0_t_uint256(slot) -> value {
                value := extract_from_storage_value_offset_0t_uint256(sload(slot))

            }

            /// @ast-id 241
            /// @src 1:2361:2433  "function getBase() public returns (uint256) {..."
            function fun_getBase_241() -> var__236 {
                /// @src 1:2396:2403  "uint256"
                let zero_t_uint256_9 := zero_value_for_split_t_uint256()
                var__236 := zero_t_uint256_9

                /// @src 1:2422:2426  "base"
                let _10 := read_from_storage_split_offset_0_t_uint256(0x00)
                let expr_238 := _10
                /// @src 1:2415:2426  "return base"
                var__236 := expr_238
                leave

            }
            /// @src 1:1904:2779  "contract symex1 is Eurus {..."

            function store_literal_in_memory_fda3a92554e84fea8dc568bb5df0c00f3ec63fd891725bdc84348b2c7b6486d4(memPtr) {

                mstore(add(memPtr, 0), "sym0")

            }

            function copy_literal_to_memory_fda3a92554e84fea8dc568bb5df0c00f3ec63fd891725bdc84348b2c7b6486d4() -> memPtr {
                memPtr := allocate_memory_array_t_string_memory_ptr(4)
                store_literal_in_memory_fda3a92554e84fea8dc568bb5df0c00f3ec63fd891725bdc84348b2c7b6486d4(add(memPtr, 32))
            }

            function convert_t_stringliteral_fda3a92554e84fea8dc568bb5df0c00f3ec63fd891725bdc84348b2c7b6486d4_to_t_string_memory_ptr() -> converted {
                converted := copy_literal_to_memory_fda3a92554e84fea8dc568bb5df0c00f3ec63fd891725bdc84348b2c7b6486d4()
            }

            function store_literal_in_memory_0517bfe7ec02c8b9f34bb2170b1679aee421a911c4bde0f0169705e470b476f5(memPtr) {

                mstore(add(memPtr, 0), "sym1")

            }

            function copy_literal_to_memory_0517bfe7ec02c8b9f34bb2170b1679aee421a911c4bde0f0169705e470b476f5() -> memPtr {
                memPtr := allocate_memory_array_t_string_memory_ptr(4)
                store_literal_in_memory_0517bfe7ec02c8b9f34bb2170b1679aee421a911c4bde0f0169705e470b476f5(add(memPtr, 32))
            }

            function convert_t_stringliteral_0517bfe7ec02c8b9f34bb2170b1679aee421a911c4bde0f0169705e470b476f5_to_t_string_memory_ptr() -> converted {
                converted := copy_literal_to_memory_0517bfe7ec02c8b9f34bb2170b1679aee421a911c4bde0f0169705e470b476f5()
            }

            /// @ast-id 262
            /// @src 1:2612:2776  "function test1() public {..."
            function fun_test1_262() {

                /// @src 1:2658:2685  "eurus_symbolic_bool(\"sym0\")"
                let _11_mpos := convert_t_stringliteral_fda3a92554e84fea8dc568bb5df0c00f3ec63fd891725bdc84348b2c7b6486d4_to_t_string_memory_ptr()
                let expr_248 := fun_eurus_symbolic_bool_416(_11_mpos)
                /// @src 1:2646:2685  "bool sym0 = eurus_symbolic_bool(\"sym0\")"
                let var_sym0_245 := expr_248
                /// @src 1:2710:2740  "eurus_symbolic_uint256(\"sym1\")"
                let _12_mpos := convert_t_stringliteral_0517bfe7ec02c8b9f34bb2170b1679aee421a911c4bde0f0169705e470b476f5_to_t_string_memory_ptr()
                let expr_254 := fun_eurus_symbolic_uint256_428(_12_mpos)
                /// @src 1:2695:2740  "uint256 sym1 = eurus_symbolic_uint256(\"sym1\")"
                let var_sym1_251 := expr_254
                /// @src 1:2758:2762  "sym0"
                let _13 := var_sym0_245
                let expr_257 := _13
                /// @src 1:2764:2768  "sym1"
                let _14 := var_sym1_251
                let expr_258 := _14
                fun_setBase_233(expr_257, expr_258)

            }
            /// @src 1:1904:2779  "contract symex1 is Eurus {..."

            function array_length_t_string_memory_ptr(value) -> length {

                length := mload(value)

            }

            function array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length) -> updated_pos {
                mstore(pos, length)
                updated_pos := add(pos, 0x20)
            }

            function copy_memory_to_memory(src, dst, length) {
                let i := 0
                for { } lt(i, length) { i := add(i, 32) }
                {
                    mstore(add(dst, i), mload(add(src, i)))
                }
                if gt(i, length)
                {
                    // clear end
                    mstore(add(dst, length), 0)
                }
            }

            function abi_encode_t_string_memory_ptr_to_t_string_memory_ptr_fromStack(value, pos) -> end {
                let length := array_length_t_string_memory_ptr(value)
                pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length)
                copy_memory_to_memory(add(value, 0x20), pos, length)
                end := add(pos, round_up_to_mul_of_32(length))
            }

            function abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                mstore(add(headStart, 0), sub(tail, headStart))
                tail := abi_encode_t_string_memory_ptr_to_t_string_memory_ptr_fromStack(value0,  tail)

            }

            /// @ast-id 416
            /// @src 0:452:545  "function eurus_symbolic_bool(string memory tag) internal pure returns (bool) { revert(tag); }"
            function fun_eurus_symbolic_bool_416(var_tag_406_mpos) -> var__409 {
                /// @src 0:523:527  "bool"
                let zero_t_bool_15 := zero_value_for_split_t_bool()
                var__409 := zero_t_bool_15

                /// @src 0:538:541  "tag"
                let _16_mpos := var_tag_406_mpos
                let expr_412_mpos := _16_mpos
                /// @src 0:531:542  "revert(tag)"
                {
                    let _17 := allocate_unbounded()
                    mstore(_17, 3963877391197344453575983046348115674221700746820753546331534351508065746944)
                    let _18 := abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack(add(_17, 4) , expr_412_mpos)
                    revert(_17, sub(_18, _17))
                }
            }
            /// @src 1:1904:2779  "contract symex1 is Eurus {..."

            /// @ast-id 428
            /// @src 0:601:700  "function eurus_symbolic_uint256(string memory tag) internal pure returns (uint256) { revert(tag); }"
            function fun_eurus_symbolic_uint256_428(var_tag_418_mpos) -> var__421 {
                /// @src 0:675:682  "uint256"
                let zero_t_uint256_19 := zero_value_for_split_t_uint256()
                var__421 := zero_t_uint256_19

                /// @src 0:693:696  "tag"
                let _20_mpos := var_tag_418_mpos
                let expr_424_mpos := _20_mpos
                /// @src 0:686:697  "revert(tag)"
                {
                    let _21 := allocate_unbounded()
                    mstore(_21, 3963877391197344453575983046348115674221700746820753546331534351508065746944)
                    let _22 := abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack(add(_21, 4) , expr_424_mpos)
                    revert(_21, sub(_22, _21))
                }
            }
            /// @src 1:1904:2779  "contract symex1 is Eurus {..."

        }

        data ".metadata" hex"a2646970667358221220b4d1c0062ca15c6aa962fd03490f3fad626b6438a90f43ea1aeec66fbb29955564736f6c634300080e0033"
    }

}

