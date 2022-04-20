object "SimpleYulTest1" {
    code {
        constructor_addition(29, 45)

        function constructor_addition(value0, value1) -> retvalue {
            retvalue := add(value0, value1)
        }

    }

    object "SimpleYulTest1_deployed" {
        code {

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0xb178c2db
                {
                    // dispatcher_subtraction(uint256,uint256)
                    let param_0, param_1 :=  abi_decode_tuple_t_uint256t_uint256(4, calldatasize())
                    let ret_0 :=  dispatcher_subtraction(param_0, param_1)
                    eurus_print(ret_0)
                }

                default {}
            }

            function dispatcher_subtraction(value0, value1) -> retvalue {
                retvalue := sub(value0, value1)
            }

            function shift_right_224_unsigned(value) -> newValue {
                newValue := shr(224, value)
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

            function abi_decode_t_uint256(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_uint256(value)
            }

            function validator_revert_t_uint256(value) {
                if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
            }

            function cleanup_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() {
                revert(0, 0)
            }
            
        }

        data ".metadata" hex"none"
    }

}