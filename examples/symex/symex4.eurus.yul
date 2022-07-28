
/// @use-src 0:".//Eurus.sol", 1:"symex/symex.sol"
object "symex4_376" {
    code {
        /// @src 1:3602:3962  "contract symex4 is Eurus {..."
        mstore(64, memoryguard(128))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        constructor_symex4_376()

        // adapted by Eurus: remove_post_constructor_datacall
        // let _1 := allocate_unbounded()
        // codecopy(_1, dataoffset("symex4_376_deployed"), datasize("symex4_376_deployed"))
        // return(_1, datasize("symex4_376_deployed"))

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
            revert(0, 0)
        }

        /// @ast-id 342
        /// @src 1:3633:3649  "constructor() {}"
        function constructor_symex4_376() {

            /// @src 1:3633:3649  "constructor() {}"
            constructor_Eurus_1291()

        }
        /// @src 1:3602:3962  "contract symex4 is Eurus {..."

        /// @ast-id 382
        /// @src 0:80:96  "constructor() {}"
        function constructor_Eurus_1291() {

            /// @src 0:80:96  "constructor() {}"

        }
        /// @src 1:3602:3962  "contract symex4 is Eurus {..."

    }
    /// @use-src 0:".//Eurus.sol", 1:"symex/symex.sol"
    object "symex4_376_deployed" {
        code {
            /// @src 1:3602:3962  "contract symex4 is Eurus {..."
            mstore(64, memoryguard(128))

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x5e01eb5a
                {
                    // getSender()

                    external_fun_getSender_351()
                }

                case 0x66f01106
                {
                    // testTrueSender()

                    external_fun_testTrueSender_360()
                }

                case 0xb2039a04
                {
                    // testFakeSender(address)

                    external_fun_testFakeSender_375()
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

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

            }

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

            function external_fun_getSender_351() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                let ret_0 :=  fun_getSender_351()
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_testTrueSender_360() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                let ret_0 :=  fun_testTrueSender_360()
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() {
                revert(0, 0)
            }

            function validator_revert_t_address(value) {
                if iszero(eq(value, cleanup_t_address(value))) { revert(0, 0) }
            }

            function abi_decode_t_address(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_address(value)
            }

            function abi_decode_tuple_t_address(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            function external_fun_testFakeSender_375() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                let ret_0 :=  fun_testFakeSender_375(param_0)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74() {
                // adapted by Eurus: hijack_dispatcher_revert
                eurus_dispatcher_revert()
            }

            function zero_value_for_split_t_address() -> ret {
                ret := 0
            }

            /// @ast-id 351
            /// @src 1:3654:3734  "function getSender() public returns (address) {..."
            function fun_getSender_351() -> var__345 {
                /// @src 1:3691:3698  "address"
                let zero_t_address_1 := zero_value_for_split_t_address()
                var__345 := zero_t_address_1

                /// @src 1:3717:3727  "msg.sender"
                let expr_348 := caller()
                /// @src 1:3710:3727  "return msg.sender"
                var__345 := expr_348
                leave

            }
            /// @src 1:3602:3962  "contract symex4 is Eurus {..."

            /// @ast-id 360
            /// @src 1:3739:3825  "function testTrueSender() public returns (address) {..."
            function fun_testTrueSender_360() -> var__354 {
                /// @src 1:3781:3788  "address"
                let zero_t_address_2 := zero_value_for_split_t_address()
                var__354 := zero_t_address_2

                /// @src 1:3807:3818  "getSender()"
                let expr_357 := fun_getSender_351()
                /// @src 1:3800:3818  "return getSender()"
                var__354 := expr_357
                leave

            }
            /// @src 1:3602:3962  "contract symex4 is Eurus {..."

            /// @ast-id 375
            /// @src 1:3830:3960  "function testFakeSender(address addr) public returns (address) {..."
            function fun_testFakeSender_375(var_addr_362) -> var__365 {
                /// @src 1:3884:3891  "address"
                let zero_t_address_3 := zero_value_for_split_t_address()
                var__365 := zero_t_address_3

                /// @src 1:3920:3924  "addr"
                let _4 := var_addr_362
                let expr_368 := _4
                fun_eurus_prank_once_392(expr_368)
                /// @src 1:3942:3953  "getSender()"
                let expr_372 := fun_getSender_351()
                /// @src 1:3935:3953  "return getSender()"
                var__365 := expr_372
                leave

            }
            /// @src 1:3602:3962  "contract symex4 is Eurus {..."

            function array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length) -> updated_pos {
                mstore(pos, length)
                updated_pos := add(pos, 0x20)
            }

            function store_literal_in_memory_046e3b60602e4c9ae035a6752d3453a5f0b8da88167fb304fd5bb28922e092b0(memPtr) {

                mstore(add(memPtr, 0), "eurus_prank_once")

            }

            function abi_encode_t_stringliteral_046e3b60602e4c9ae035a6752d3453a5f0b8da88167fb304fd5bb28922e092b0_to_t_string_memory_ptr_fromStack(pos) -> end {
                pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 16)
                store_literal_in_memory_046e3b60602e4c9ae035a6752d3453a5f0b8da88167fb304fd5bb28922e092b0(pos)
                end := add(pos, 32)
            }

            function abi_encode_tuple_t_stringliteral_046e3b60602e4c9ae035a6752d3453a5f0b8da88167fb304fd5bb28922e092b0__to_t_string_memory_ptr__fromStack(headStart ) -> tail {
                tail := add(headStart, 32)

                mstore(add(headStart, 0), sub(tail, headStart))
                tail := abi_encode_t_stringliteral_046e3b60602e4c9ae035a6752d3453a5f0b8da88167fb304fd5bb28922e092b0_to_t_string_memory_ptr_fromStack( tail)

            }

            /// @ast-id 392
            /// @src 0:171:256  "function eurus_prank_once(address addr) internal pure { revert(\"eurus_prank_once\"); }"
            function fun_eurus_prank_once_392(var_addr_384) {
                    // adapted by Eurus: hijack_eurus_prank_once
                    eurus_prank_once(var_addr_384)
            }
            /// @src 1:3602:3962  "contract symex4 is Eurus {..."

        }

        
    }

}

