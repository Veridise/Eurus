
/// @use-src 0:".//Eurus.sol", 1:"symex/symex.sol"
object "symex0_173" {
    code {
        /// @src 1:277:1826  "contract symex0 is Eurus {..."
        mstore(64, memoryguard(128))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        constructor_symex0_173()

        let _1 := allocate_unbounded()
        codecopy(_1, dataoffset("symex0_173_deployed"), datasize("symex0_173_deployed"))

        return(_1, datasize("symex0_173_deployed"))

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
            revert(0, 0)
        }

        /// @ast-id 9
        /// @src 1:309:325  "constructor() {}"
        function constructor_symex0_173() {

            /// @src 1:309:325  "constructor() {}"
            constructor_Eurus_1291()

        }
        /// @src 1:277:1826  "contract symex0 is Eurus {..."

        /// @ast-id 382
        /// @src 0:80:96  "constructor() {}"
        function constructor_Eurus_1291() {

            /// @src 0:80:96  "constructor() {}"

        }
        /// @src 1:277:1826  "contract symex0 is Eurus {..."

    }
    /// @use-src 0:".//Eurus.sol", 1:"symex/symex.sol"
    object "symex0_173_deployed" {
        code {
            /// @src 1:277:1826  "contract symex0 is Eurus {..."
            mstore(64, memoryguard(128))

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x0a8e8e01
                {
                    // test3()

                    external_fun_test3_164()
                }

                case 0x66e41cb7
                {
                    // test2()

                    external_fun_test2_120()
                }

                case 0x6b59084d
                {
                    // test1()

                    external_fun_test1_76()
                }

                case 0x771602f7
                {
                    // add(uint256,uint256)

                    external_fun_add_23()
                }

                case 0x77ff24f4
                {
                    // test0()

                    external_fun_test0_46()
                }

                case 0x8f0d282d
                {
                    // test4()

                    external_fun_test4_172()
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

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function external_fun_test3_164() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                fun_test3_164()
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_test2_120() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                fun_test2_120()
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_test1_76() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                fun_test1_76()
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
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

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple_t_uint256__to_t_uint256__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

            }

            function external_fun_add_23() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0, param_1 :=  abi_decode_tuple_t_uint256t_uint256(4, calldatasize())
                let ret_0 :=  fun_add_23(param_0, param_1)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_test0_46() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                let ret_0 :=  fun_test0_46()
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_test4_172() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                fun_test4_172()
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74() {
                revert(0, 0)
            }

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

            function panic_error_0x11() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x11)
                revert(0, 0x24)
            }

            function checked_add_t_uint256(x, y) -> sum {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                // overflow, if x > (maxValue - y)
                if gt(x, sub(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, y)) { panic_error_0x11() }

                sum := add(x, y)
            }

            /// @ast-id 23
            /// @src 1:331:423  "function add(uint256 a, uint256 b) public pure returns (uint256) {..."
            function fun_add_23(var_a_11, var_b_13) -> var__16 {
                /// @src 1:387:394  "uint256"
                let zero_t_uint256_1 := zero_value_for_split_t_uint256()
                var__16 := zero_t_uint256_1

                /// @src 1:413:414  "a"
                let _2 := var_a_11
                let expr_18 := _2
                /// @src 1:415:416  "b"
                let _3 := var_b_13
                let expr_19 := _3
                /// @src 1:413:416  "a+b"
                let expr_20 := checked_add_t_uint256(expr_18, expr_19)

                /// @src 1:406:416  "return a+b"
                var__16 := expr_20
                leave

            }
            /// @src 1:277:1826  "contract symex0 is Eurus {..."

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

            /// @ast-id 46
            /// @src 1:479:675  "function test0() public pure returns (uint256) {..."
            function fun_test0_46() -> var__26 {
                /// @src 1:517:524  "uint256"
                let zero_t_uint256_4 := zero_value_for_split_t_uint256()
                var__26 := zero_t_uint256_4

                /// @src 1:551:581  "eurus_symbolic_uint256(\"sym0\")"
                let _5_mpos := convert_t_stringliteral_fda3a92554e84fea8dc568bb5df0c00f3ec63fd891725bdc84348b2c7b6486d4_to_t_string_memory_ptr()
                let expr_32 := fun_eurus_symbolic_uint256_428(_5_mpos)
                /// @src 1:536:581  "uint256 sym0 = eurus_symbolic_uint256(\"sym0\")"
                let var_sym0_29 := expr_32
                /// @src 1:606:636  "eurus_symbolic_uint256(\"sym1\")"
                let _6_mpos := convert_t_stringliteral_0517bfe7ec02c8b9f34bb2170b1679aee421a911c4bde0f0169705e470b476f5_to_t_string_memory_ptr()
                let expr_38 := fun_eurus_symbolic_uint256_428(_6_mpos)
                /// @src 1:591:636  "uint256 sym1 = eurus_symbolic_uint256(\"sym1\")"
                let var_sym1_35 := expr_38
                /// @src 1:657:661  "sym0"
                let _7 := var_sym0_29
                let expr_41 := _7
                /// @src 1:663:667  "sym1"
                let _8 := var_sym1_35
                let expr_42 := _8
                /// @src 1:653:668  "add(sym0, sym1)"
                let expr_43 := fun_add_23(expr_41, expr_42)
                /// @src 1:646:668  "return add(sym0, sym1)"
                var__26 := expr_43
                leave

            }
            /// @src 1:277:1826  "contract symex0 is Eurus {..."

            function cleanup_t_rational_100_by_1(value) -> cleaned {
                cleaned := value
            }

            function identity(value) -> ret {
                ret := value
            }

            function convert_t_rational_100_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_100_by_1(value)))
            }

            function store_literal_in_memory_f3d67ab1e5900596b127944b0937f52e9572afe8eb649329243d81ebe9aa868b(memPtr) {

                mstore(add(memPtr, 0), "test1:assert")

            }

            function copy_literal_to_memory_f3d67ab1e5900596b127944b0937f52e9572afe8eb649329243d81ebe9aa868b() -> memPtr {
                memPtr := allocate_memory_array_t_string_memory_ptr(12)
                store_literal_in_memory_f3d67ab1e5900596b127944b0937f52e9572afe8eb649329243d81ebe9aa868b(add(memPtr, 32))
            }

            function convert_t_stringliteral_f3d67ab1e5900596b127944b0937f52e9572afe8eb649329243d81ebe9aa868b_to_t_string_memory_ptr() -> converted {
                converted := copy_literal_to_memory_f3d67ab1e5900596b127944b0937f52e9572afe8eb649329243d81ebe9aa868b()
            }

            /// @ast-id 76
            /// @src 1:699:932  "function test1() public view {..."
            function fun_test1_76() {

                /// @src 1:753:783  "eurus_symbolic_uint256(\"sym0\")"
                let _9_mpos := convert_t_stringliteral_fda3a92554e84fea8dc568bb5df0c00f3ec63fd891725bdc84348b2c7b6486d4_to_t_string_memory_ptr()
                let expr_53 := fun_eurus_symbolic_uint256_428(_9_mpos)
                /// @src 1:738:783  "uint256 sym0 = eurus_symbolic_uint256(\"sym0\")"
                let var_sym0_50 := expr_53
                /// @src 1:808:838  "eurus_symbolic_uint256(\"sym1\")"
                let _10_mpos := convert_t_stringliteral_0517bfe7ec02c8b9f34bb2170b1679aee421a911c4bde0f0169705e470b476f5_to_t_string_memory_ptr()
                let expr_59 := fun_eurus_symbolic_uint256_428(_10_mpos)
                /// @src 1:793:838  "uint256 sym1 = eurus_symbolic_uint256(\"sym1\")"
                let var_sym1_56 := expr_59
                /// @src 1:866:870  "sym0"
                let _11 := var_sym0_50
                let expr_64 := _11
                /// @src 1:872:876  "sym1"
                let _12 := var_sym1_56
                let expr_65 := _12
                /// @src 1:862:877  "add(sym0, sym1)"
                let expr_66 := fun_add_23(expr_64, expr_65)
                /// @src 1:848:877  "uint256 res = add(sym0, sym1)"
                let var_res_62 := expr_66
                /// @src 1:916:919  "res"
                let _13 := var_res_62
                let expr_70 := _13
                /// @src 1:921:924  "100"
                let expr_71 := 0x64
                /// @src 1:916:924  "res>=100"
                let expr_72 := iszero(lt(cleanup_t_uint256(expr_70), convert_t_rational_100_by_1_to_t_uint256(expr_71)))
                /// @src 1:887:925  "eurus_assert(\"test1:assert\", res>=100)"
                let _14_mpos := convert_t_stringliteral_f3d67ab1e5900596b127944b0937f52e9572afe8eb649329243d81ebe9aa868b_to_t_string_memory_ptr()
                fun_eurus_assert_1232(_14_mpos, expr_72)

            }
            /// @src 1:277:1826  "contract symex0 is Eurus {..."

            function cleanup_t_rational_30_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_30_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_30_by_1(value)))
            }

            function store_literal_in_memory_2decb13b38163ab67552f21edb028b88be5227f11f3b1a995acda197d62dc21d(memPtr) {

                mstore(add(memPtr, 0), "test2:assume:0")

            }

            function copy_literal_to_memory_2decb13b38163ab67552f21edb028b88be5227f11f3b1a995acda197d62dc21d() -> memPtr {
                memPtr := allocate_memory_array_t_string_memory_ptr(14)
                store_literal_in_memory_2decb13b38163ab67552f21edb028b88be5227f11f3b1a995acda197d62dc21d(add(memPtr, 32))
            }

            function convert_t_stringliteral_2decb13b38163ab67552f21edb028b88be5227f11f3b1a995acda197d62dc21d_to_t_string_memory_ptr() -> converted {
                converted := copy_literal_to_memory_2decb13b38163ab67552f21edb028b88be5227f11f3b1a995acda197d62dc21d()
            }

            function cleanup_t_rational_80_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_80_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_80_by_1(value)))
            }

            function store_literal_in_memory_92bb8fac0dda9cc81531bad53c01c5731376a71149f9b895491b172f44806bd7(memPtr) {

                mstore(add(memPtr, 0), "test2:assume:1")

            }

            function copy_literal_to_memory_92bb8fac0dda9cc81531bad53c01c5731376a71149f9b895491b172f44806bd7() -> memPtr {
                memPtr := allocate_memory_array_t_string_memory_ptr(14)
                store_literal_in_memory_92bb8fac0dda9cc81531bad53c01c5731376a71149f9b895491b172f44806bd7(add(memPtr, 32))
            }

            function convert_t_stringliteral_92bb8fac0dda9cc81531bad53c01c5731376a71149f9b895491b172f44806bd7_to_t_string_memory_ptr() -> converted {
                converted := copy_literal_to_memory_92bb8fac0dda9cc81531bad53c01c5731376a71149f9b895491b172f44806bd7()
            }

            function store_literal_in_memory_352387c11ae5aa4560ebe326995998c866a40bd1014082a449b96dc0376efcfd(memPtr) {

                mstore(add(memPtr, 0), "test2:assert")

            }

            function copy_literal_to_memory_352387c11ae5aa4560ebe326995998c866a40bd1014082a449b96dc0376efcfd() -> memPtr {
                memPtr := allocate_memory_array_t_string_memory_ptr(12)
                store_literal_in_memory_352387c11ae5aa4560ebe326995998c866a40bd1014082a449b96dc0376efcfd(add(memPtr, 32))
            }

            function convert_t_stringliteral_352387c11ae5aa4560ebe326995998c866a40bd1014082a449b96dc0376efcfd_to_t_string_memory_ptr() -> converted {
                converted := copy_literal_to_memory_352387c11ae5aa4560ebe326995998c866a40bd1014082a449b96dc0376efcfd()
            }

            /// @ast-id 120
            /// @src 1:1011:1344  "function test2() public view {..."
            function fun_test2_120() {

                /// @src 1:1065:1095  "eurus_symbolic_uint256(\"sym0\")"
                let _15_mpos := convert_t_stringliteral_fda3a92554e84fea8dc568bb5df0c00f3ec63fd891725bdc84348b2c7b6486d4_to_t_string_memory_ptr()
                let expr_83 := fun_eurus_symbolic_uint256_428(_15_mpos)
                /// @src 1:1050:1095  "uint256 sym0 = eurus_symbolic_uint256(\"sym0\")"
                let var_sym0_80 := expr_83
                /// @src 1:1120:1150  "eurus_symbolic_uint256(\"sym1\")"
                let _16_mpos := convert_t_stringliteral_0517bfe7ec02c8b9f34bb2170b1679aee421a911c4bde0f0169705e470b476f5_to_t_string_memory_ptr()
                let expr_89 := fun_eurus_symbolic_uint256_428(_16_mpos)
                /// @src 1:1105:1150  "uint256 sym1 = eurus_symbolic_uint256(\"sym1\")"
                let var_sym1_86 := expr_89
                /// @src 1:1191:1195  "sym0"
                let _17 := var_sym0_80
                let expr_93 := _17
                /// @src 1:1197:1199  "30"
                let expr_94 := 0x1e
                /// @src 1:1191:1199  "sym0<=30"
                let expr_95 := iszero(gt(cleanup_t_uint256(expr_93), convert_t_rational_30_by_1_to_t_uint256(expr_94)))
                /// @src 1:1160:1200  "eurus_assume(\"test2:assume:0\", sym0<=30)"
                let _18_mpos := convert_t_stringliteral_2decb13b38163ab67552f21edb028b88be5227f11f3b1a995acda197d62dc21d_to_t_string_memory_ptr()
                fun_eurus_assume_1220(_18_mpos, expr_95)
                /// @src 1:1241:1245  "sym1"
                let _19 := var_sym1_86
                let expr_100 := _19
                /// @src 1:1247:1249  "80"
                let expr_101 := 0x50
                /// @src 1:1241:1249  "sym1<=80"
                let expr_102 := iszero(gt(cleanup_t_uint256(expr_100), convert_t_rational_80_by_1_to_t_uint256(expr_101)))
                /// @src 1:1210:1250  "eurus_assume(\"test2:assume:1\", sym1<=80)"
                let _20_mpos := convert_t_stringliteral_92bb8fac0dda9cc81531bad53c01c5731376a71149f9b895491b172f44806bd7_to_t_string_memory_ptr()
                fun_eurus_assume_1220(_20_mpos, expr_102)
                /// @src 1:1278:1282  "sym0"
                let _21 := var_sym0_80
                let expr_108 := _21
                /// @src 1:1284:1288  "sym1"
                let _22 := var_sym1_86
                let expr_109 := _22
                /// @src 1:1274:1289  "add(sym0, sym1)"
                let expr_110 := fun_add_23(expr_108, expr_109)
                /// @src 1:1260:1289  "uint256 res = add(sym0, sym1)"
                let var_res_106 := expr_110
                /// @src 1:1328:1331  "res"
                let _23 := var_res_106
                let expr_114 := _23
                /// @src 1:1333:1336  "100"
                let expr_115 := 0x64
                /// @src 1:1328:1336  "res>=100"
                let expr_116 := iszero(lt(cleanup_t_uint256(expr_114), convert_t_rational_100_by_1_to_t_uint256(expr_115)))
                /// @src 1:1299:1337  "eurus_assert(\"test2:assert\", res>=100)"
                let _24_mpos := convert_t_stringliteral_352387c11ae5aa4560ebe326995998c866a40bd1014082a449b96dc0376efcfd_to_t_string_memory_ptr()
                fun_eurus_assert_1232(_24_mpos, expr_116)

            }
            /// @src 1:277:1826  "contract symex0 is Eurus {..."

            function store_literal_in_memory_ad414fb2b29a0b00fcc5cfeba2c800b640da9c7493f8874a1f1baaf4097b24e0(memPtr) {

                mstore(add(memPtr, 0), "test3:assume:0")

            }

            function copy_literal_to_memory_ad414fb2b29a0b00fcc5cfeba2c800b640da9c7493f8874a1f1baaf4097b24e0() -> memPtr {
                memPtr := allocate_memory_array_t_string_memory_ptr(14)
                store_literal_in_memory_ad414fb2b29a0b00fcc5cfeba2c800b640da9c7493f8874a1f1baaf4097b24e0(add(memPtr, 32))
            }

            function convert_t_stringliteral_ad414fb2b29a0b00fcc5cfeba2c800b640da9c7493f8874a1f1baaf4097b24e0_to_t_string_memory_ptr() -> converted {
                converted := copy_literal_to_memory_ad414fb2b29a0b00fcc5cfeba2c800b640da9c7493f8874a1f1baaf4097b24e0()
            }

            function store_literal_in_memory_4d4aade97160d5b590a5ced2a02867276717143ade2428e545f430c8cc898012(memPtr) {

                mstore(add(memPtr, 0), "test3:assume:1")

            }

            function copy_literal_to_memory_4d4aade97160d5b590a5ced2a02867276717143ade2428e545f430c8cc898012() -> memPtr {
                memPtr := allocate_memory_array_t_string_memory_ptr(14)
                store_literal_in_memory_4d4aade97160d5b590a5ced2a02867276717143ade2428e545f430c8cc898012(add(memPtr, 32))
            }

            function convert_t_stringliteral_4d4aade97160d5b590a5ced2a02867276717143ade2428e545f430c8cc898012_to_t_string_memory_ptr() -> converted {
                converted := copy_literal_to_memory_4d4aade97160d5b590a5ced2a02867276717143ade2428e545f430c8cc898012()
            }

            function store_literal_in_memory_d5e72d87d2a32ecf2cd69cd05db0cb25b71884af9942afa02f319965cd1cfc62(memPtr) {

                mstore(add(memPtr, 0), "test3:solve")

            }

            function copy_literal_to_memory_d5e72d87d2a32ecf2cd69cd05db0cb25b71884af9942afa02f319965cd1cfc62() -> memPtr {
                memPtr := allocate_memory_array_t_string_memory_ptr(11)
                store_literal_in_memory_d5e72d87d2a32ecf2cd69cd05db0cb25b71884af9942afa02f319965cd1cfc62(add(memPtr, 32))
            }

            function convert_t_stringliteral_d5e72d87d2a32ecf2cd69cd05db0cb25b71884af9942afa02f319965cd1cfc62_to_t_string_memory_ptr() -> converted {
                converted := copy_literal_to_memory_d5e72d87d2a32ecf2cd69cd05db0cb25b71884af9942afa02f319965cd1cfc62()
            }

            /// @ast-id 164
            /// @src 1:1419:1752  "function test3() public view {..."
            function fun_test3_164() {

                /// @src 1:1473:1503  "eurus_symbolic_uint256(\"sym0\")"
                let _25_mpos := convert_t_stringliteral_fda3a92554e84fea8dc568bb5df0c00f3ec63fd891725bdc84348b2c7b6486d4_to_t_string_memory_ptr()
                let expr_127 := fun_eurus_symbolic_uint256_428(_25_mpos)
                /// @src 1:1458:1503  "uint256 sym0 = eurus_symbolic_uint256(\"sym0\")"
                let var_sym0_124 := expr_127
                /// @src 1:1528:1558  "eurus_symbolic_uint256(\"sym1\")"
                let _26_mpos := convert_t_stringliteral_0517bfe7ec02c8b9f34bb2170b1679aee421a911c4bde0f0169705e470b476f5_to_t_string_memory_ptr()
                let expr_133 := fun_eurus_symbolic_uint256_428(_26_mpos)
                /// @src 1:1513:1558  "uint256 sym1 = eurus_symbolic_uint256(\"sym1\")"
                let var_sym1_130 := expr_133
                /// @src 1:1599:1603  "sym0"
                let _27 := var_sym0_124
                let expr_137 := _27
                /// @src 1:1605:1607  "30"
                let expr_138 := 0x1e
                /// @src 1:1599:1607  "sym0<=30"
                let expr_139 := iszero(gt(cleanup_t_uint256(expr_137), convert_t_rational_30_by_1_to_t_uint256(expr_138)))
                /// @src 1:1568:1608  "eurus_assume(\"test3:assume:0\", sym0<=30)"
                let _28_mpos := convert_t_stringliteral_ad414fb2b29a0b00fcc5cfeba2c800b640da9c7493f8874a1f1baaf4097b24e0_to_t_string_memory_ptr()
                fun_eurus_assume_1220(_28_mpos, expr_139)
                /// @src 1:1649:1653  "sym1"
                let _29 := var_sym1_130
                let expr_144 := _29
                /// @src 1:1655:1657  "80"
                let expr_145 := 0x50
                /// @src 1:1649:1657  "sym1<=80"
                let expr_146 := iszero(gt(cleanup_t_uint256(expr_144), convert_t_rational_80_by_1_to_t_uint256(expr_145)))
                /// @src 1:1618:1658  "eurus_assume(\"test3:assume:1\", sym1<=80)"
                let _30_mpos := convert_t_stringliteral_4d4aade97160d5b590a5ced2a02867276717143ade2428e545f430c8cc898012_to_t_string_memory_ptr()
                fun_eurus_assume_1220(_30_mpos, expr_146)
                /// @src 1:1686:1690  "sym0"
                let _31 := var_sym0_124
                let expr_152 := _31
                /// @src 1:1692:1696  "sym1"
                let _32 := var_sym1_130
                let expr_153 := _32
                /// @src 1:1682:1697  "add(sym0, sym1)"
                let expr_154 := fun_add_23(expr_152, expr_153)
                /// @src 1:1668:1697  "uint256 res = add(sym0, sym1)"
                let var_res_150 := expr_154
                /// @src 1:1736:1739  "res"
                let _33 := var_res_150
                let expr_158 := _33
                /// @src 1:1741:1744  "100"
                let expr_159 := 0x64
                /// @src 1:1736:1744  "res>=100"
                let expr_160 := iszero(lt(cleanup_t_uint256(expr_158), convert_t_rational_100_by_1_to_t_uint256(expr_159)))
                /// @src 1:1707:1745  "rosette_solve(\"test3:solve\", res>=100)"
                let _34_mpos := convert_t_stringliteral_d5e72d87d2a32ecf2cd69cd05db0cb25b71884af9942afa02f319965cd1cfc62_to_t_string_memory_ptr()
                fun_rosette_solve_1290(_34_mpos, expr_160)

            }
            /// @src 1:277:1826  "contract symex0 is Eurus {..."

            function store_literal_in_memory_06b3dfaec148fb1bb2b066f10ec285e7c9bf402ab32aa78a5d38e34566810cd2(memPtr) {

                mstore(add(memPtr, 0), "Hello")

            }

            function copy_literal_to_memory_06b3dfaec148fb1bb2b066f10ec285e7c9bf402ab32aa78a5d38e34566810cd2() -> memPtr {
                memPtr := allocate_memory_array_t_string_memory_ptr(5)
                store_literal_in_memory_06b3dfaec148fb1bb2b066f10ec285e7c9bf402ab32aa78a5d38e34566810cd2(add(memPtr, 32))
            }

            function convert_t_stringliteral_06b3dfaec148fb1bb2b066f10ec285e7c9bf402ab32aa78a5d38e34566810cd2_to_t_string_memory_ptr() -> converted {
                converted := copy_literal_to_memory_06b3dfaec148fb1bb2b066f10ec285e7c9bf402ab32aa78a5d38e34566810cd2()
            }

            /// @ast-id 172
            /// @src 1:1758:1823  "function test4() public view {..."
            function fun_test4_172() {

                /// @src 1:1797:1816  "eurus_says(\"Hello\")"
                let _35_mpos := convert_t_stringliteral_06b3dfaec148fb1bb2b066f10ec285e7c9bf402ab32aa78a5d38e34566810cd2_to_t_string_memory_ptr()
                fun_eurus_says_1242(_35_mpos)

            }
            /// @src 1:277:1826  "contract symex0 is Eurus {..."

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

            /// @ast-id 428
            /// @src 0:601:700  "function eurus_symbolic_uint256(string memory tag) internal pure returns (uint256) { revert(tag); }"
            function fun_eurus_symbolic_uint256_428(var_tag_418_mpos) -> var__421 {
                /// @src 0:675:682  "uint256"
                let zero_t_uint256_36 := zero_value_for_split_t_uint256()
                var__421 := zero_t_uint256_36

                /// @src 0:693:696  "tag"
                let _37_mpos := var_tag_418_mpos
                let expr_424_mpos := _37_mpos
                /// @src 0:686:697  "revert(tag)"
                {
                    let _38 := allocate_unbounded()
                    mstore(_38, 3963877391197344453575983046348115674221700746820753546331534351508065746944)
                    let _39 := abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack(add(_38, 4) , expr_424_mpos)
                    revert(_38, sub(_39, _38))
                }
            }
            /// @src 1:277:1826  "contract symex0 is Eurus {..."

            /// @ast-id 1220
            /// @src 0:7459:7541  "function eurus_assume(string memory tag, bool cond) internal pure { revert(tag); }"
            function fun_eurus_assume_1220(var_tag_1210_mpos, var_cond_1212) {

                /// @src 0:7534:7537  "tag"
                let _40_mpos := var_tag_1210_mpos
                let expr_1216_mpos := _40_mpos
                /// @src 0:7527:7538  "revert(tag)"
                {
                    let _41 := allocate_unbounded()
                    mstore(_41, 3963877391197344453575983046348115674221700746820753546331534351508065746944)
                    let _42 := abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack(add(_41, 4) , expr_1216_mpos)
                    revert(_41, sub(_42, _41))
                }
            }
            /// @src 1:277:1826  "contract symex0 is Eurus {..."

            /// @ast-id 1232
            /// @src 0:7675:7757  "function eurus_assert(string memory tag, bool cond) internal pure { revert(tag); }"
            function fun_eurus_assert_1232(var_tag_1222_mpos, var_cond_1224) {

                /// @src 0:7750:7753  "tag"
                let _43_mpos := var_tag_1222_mpos
                let expr_1228_mpos := _43_mpos
                /// @src 0:7743:7754  "revert(tag)"
                {
                    let _44 := allocate_unbounded()
                    mstore(_44, 3963877391197344453575983046348115674221700746820753546331534351508065746944)
                    let _45 := abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack(add(_44, 4) , expr_1228_mpos)
                    revert(_44, sub(_45, _44))
                }
            }
            /// @src 1:277:1826  "contract symex0 is Eurus {..."

            /// @ast-id 1242
            /// @src 0:7793:7862  "function eurus_says(string memory tag) internal pure { revert(tag); }"
            function fun_eurus_says_1242(var_tag_1234_mpos) {

                /// @src 0:7855:7858  "tag"
                let _46_mpos := var_tag_1234_mpos
                let expr_1238_mpos := _46_mpos
                /// @src 0:7848:7859  "revert(tag)"
                {
                    let _47 := allocate_unbounded()
                    mstore(_47, 3963877391197344453575983046348115674221700746820753546331534351508065746944)
                    let _48 := abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack(add(_47, 4) , expr_1238_mpos)
                    revert(_47, sub(_48, _47))
                }
            }
            /// @src 1:277:1826  "contract symex0 is Eurus {..."

            /// @ast-id 1290
            /// @src 0:8265:8348  "function rosette_solve(string memory tag, bool cond) internal pure { revert(tag); }"
            function fun_rosette_solve_1290(var_tag_1280_mpos, var_cond_1282) {

                /// @src 0:8341:8344  "tag"
                let _49_mpos := var_tag_1280_mpos
                let expr_1286_mpos := _49_mpos
                /// @src 0:8334:8345  "revert(tag)"
                {
                    let _50 := allocate_unbounded()
                    mstore(_50, 3963877391197344453575983046348115674221700746820753546331534351508065746944)
                    let _51 := abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack(add(_50, 4) , expr_1286_mpos)
                    revert(_50, sub(_51, _50))
                }
            }
            /// @src 1:277:1826  "contract symex0 is Eurus {..."

        }

        data ".metadata" hex"a2646970667358221220915b1b1e7f8d148f7499abb0a009060aeccb1a45b3b4eeb332fb1408b906469b64736f6c634300080e0033"
    }

}

