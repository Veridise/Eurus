object "SimpleYulTest0" {
    code {
        constructor_addition(29, 45)

        function constructor_addition(value0, value1) -> retvalue {
            retvalue := add(value0, value1)
        }

    }

    object "SimpleYulTest0_deployed" {
        code {
            function dispatcher_subtraction(value0, value1) -> retvalue {
                retvalue := sub(value0, value1)
            }
        }

        data ".metadata" hex"none"
    }

}