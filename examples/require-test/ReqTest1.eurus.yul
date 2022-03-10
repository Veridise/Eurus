/*=====================================================*
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *=====================================================*/


/// @use-src 0:"examples/require-test/ReqTest1.sol"
object "ReqTest1_31" {
    code {
        /// @src 0:58:279  "contract ReqTest1 {..."
        mstore(64, memoryguard(128))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        constructor_ReqTest1_31()

        // adapted by Eurus: remove_post_constructor_datacall
        // let _1 := allocate_unbounded()
        // codecopy(_1, dataoffset("ReqTest1_31_deployed"), datasize("ReqTest1_31_deployed"))
        // return(_1, datasize("ReqTest1_31_deployed"))

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
            revert(0, 0)
        }

        /// @ast-id 5
        /// @src 0:83:99  "constructor() {}"
        function constructor_ReqTest1_31() {

            /// @src 0:83:99  "constructor() {}"

        }
        /// @src 0:58:279  "contract ReqTest1 {..."

    }
    /// @use-src 0:"examples/require-test/ReqTest1.sol"
    object "ReqTest1_31_deployed" {
        code {
            /// @src 0:58:279  "contract ReqTest1 {..."
            mstore(64, memoryguard(128))

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x5ab83be2
                {
                    // assert_gt1(uint256)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    fun_assert_gt1_30(param_0)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xda9ed4f2
                {
                    // require_gt1(uint256)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    fun_require_gt1_18(param_0)
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

            function abi_decode_tuple_t_uint256(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74() {
                revert(0, 0)
            }

            function cleanup_t_rational_1_by_1(value) -> cleaned {
                cleaned := value
            }

            function identity(value) -> ret {
                ret := value
            }

            function convert_t_rational_1_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_1_by_1(value)))
            }

            function array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length) -> updated_pos {
                mstore(pos, length)
                updated_pos := add(pos, 0x20)
            }

            function store_literal_in_memory_5b3b10c33995ad8c7a18755c4b6540296e298ebf20c6e61824efc499dbc3265b(memPtr) {

                mstore(add(memPtr, 0), "gt1 violation")

            }

            function abi_encode_t_stringliteral_5b3b10c33995ad8c7a18755c4b6540296e298ebf20c6e61824efc499dbc3265b_to_t_string_memory_ptr_fromStack(pos) -> end {
                pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 13)
                store_literal_in_memory_5b3b10c33995ad8c7a18755c4b6540296e298ebf20c6e61824efc499dbc3265b(pos)
                end := add(pos, 32)
            }

            function abi_encode_tuple_t_stringliteral_5b3b10c33995ad8c7a18755c4b6540296e298ebf20c6e61824efc499dbc3265b__to_t_string_memory_ptr__fromStack(headStart ) -> tail {
                tail := add(headStart, 32)

                mstore(add(headStart, 0), sub(tail, headStart))
                tail := abi_encode_t_stringliteral_5b3b10c33995ad8c7a18755c4b6540296e298ebf20c6e61824efc499dbc3265b_to_t_string_memory_ptr_fromStack( tail)

            }

            function require_helper_t_stringliteral_5b3b10c33995ad8c7a18755c4b6540296e298ebf20c6e61824efc499dbc3265b(condition ) {
                if iszero(condition) {
                    let memPtr := allocate_unbounded()
                    mstore(memPtr, 0x08c379a000000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple_t_stringliteral_5b3b10c33995ad8c7a18755c4b6540296e298ebf20c6e61824efc499dbc3265b__to_t_string_memory_ptr__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            /// @ast-id 18
            /// @src 0:109:199  "function require_gt1(uint256 a) public pure {..."
            function fun_require_gt1_18(var_a_7) {

                /// @src 0:171:172  "a"
                let _1 := var_a_7
                let expr_11 := _1
                /// @src 0:173:174  "1"
                let expr_12 := 0x01
                /// @src 0:171:174  "a>1"
                let expr_13 := gt(cleanup_t_uint256(expr_11), convert_t_rational_1_by_1_to_t_uint256(expr_12))
                /// @src 0:163:192  "require(a>1, \"gt1 violation\")"
                require_helper_t_stringliteral_5b3b10c33995ad8c7a18755c4b6540296e298ebf20c6e61824efc499dbc3265b(expr_13)

            }
            /// @src 0:58:279  "contract ReqTest1 {..."

            function panic_error_0x01() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x01)
                revert(0, 0x24)
            }

            function assert_helper(condition) {
                if iszero(condition) { panic_error_0x01() }
            }

            /// @ast-id 30
            /// @src 0:205:276  "function assert_gt1(uint256 a) public pure {..."
            function fun_assert_gt1_30(var_a_20) {

                /// @src 0:265:266  "a"
                let _2 := var_a_20
                let expr_24 := _2
                /// @src 0:267:268  "1"
                let expr_25 := 0x01
                /// @src 0:265:268  "a>1"
                let expr_26 := gt(cleanup_t_uint256(expr_24), convert_t_rational_1_by_1_to_t_uint256(expr_25))
                /// @src 0:258:269  "assert(a>1)"
                assert_helper(expr_26)

            }
            /// @src 0:58:279  "contract ReqTest1 {..."

        }

        data ".metadata" hex"a3646970667358221220b59bff2c755ed0bf5f323461fc5cc549f75b7821a0bb4b1ac66b650c67d846036c6578706572696d656e74616cf564736f6c634300080b0041"
    }

}

