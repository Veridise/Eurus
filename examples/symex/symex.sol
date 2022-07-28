// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Eurus} from "@Eurus/Eurus.sol";

// How to compile this:
//   solc symex.sol --overwrite @Eurus=??
// supply the actual folder that contains Eurus.sol

// this contract tests basic symbolic utilities from Eurus
contract symex0 is Eurus {

    constructor() {}

    function add(uint256 a, uint256 b) public pure returns (uint256) {
        return a+b;
    }

    // create, pass and return symbolic variables
    function test0() public pure returns (uint256) {
        uint256 sym0 = eurus_symbolic_uint256("sym0");
        uint256 sym1 = eurus_symbolic_uint256("sym1");
        return add(sym0, sym1);
    }

    // use of cex
    function test1() public view {
        uint256 sym0 = eurus_symbolic_uint256("sym0");
        uint256 sym1 = eurus_symbolic_uint256("sym1");
        uint256 res = add(sym0, sym1);
        eurus_assert("test1:assert", res>=100);
    }

    // use of assume + cex
    // this will try to find a counterexample
    function test2() public view {
        uint256 sym0 = eurus_symbolic_uint256("sym0");
        uint256 sym1 = eurus_symbolic_uint256("sym1");
        eurus_assume("test2:assume:0", sym0<=30);
        eurus_assume("test2:assume:1", sym1<=80);
        uint256 res = add(sym0, sym1);
        eurus_assert("test2:assert", res>=100);
    }

    // use of assume + solve
    // this will try to find a solution
    function test3() public view {
        uint256 sym0 = eurus_symbolic_uint256("sym0");
        uint256 sym1 = eurus_symbolic_uint256("sym1");
        eurus_assume("test3:assume:0", sym0<=30);
        eurus_assume("test3:assume:1", sym1<=80);
        uint256 res = add(sym0, sym1);
        rosette_solve("test3:solve", res>=100);
    }

    function test4() public view {
        eurus_says("Hello");
    }

}


// this contract tests whether symbolic hashing is working properly or not
contract symex1 is Eurus {

    uint256 base = 18;

    constructor() {}

    function bigger_than_10(uint256 a) public pure returns (bool) {
        return (a>10);
    }

    function test0() public pure returns (bool) {
        uint256 syma = eurus_symbolic_uint256("syma");
        return bigger_than_10(syma);
    }

    function setBase(bool cond, uint256 _base) public {
        if (cond) { base = _base*2; }
        else { base = _base; }
    }

    function getBase() public returns (uint256) {
        return base;
    }

    // testing for symbolic hash utilities
    // if properly handled, the new base will have an ite structure
    // otherwise it will just be set to value from one branch
    function test1() public {
        bool sym0 = eurus_symbolic_bool("sym0");
        uint256 sym1 = eurus_symbolic_uint256("sym1");
        setBase(sym0, sym1);
    }

}

// this contract tests symbolic variables related to collections
contract symex2 is Eurus {

    mapping (uint256 => uint256) _values;

    constructor() {}

    function setValue(uint256 ind, uint256 val) public {
        _values[ind] = val;
    }

    // if you provide a symbolic ind, then Eurus is probably going to choke
    function getValue(uint256 ind) public returns (uint256) {
        return _values[ind];
    }

    function test0() public returns (uint256) {
        uint256 sym0 = eurus_symbolic_uint256("sym0");
        return getValue(sym0);
    }

}

// contract having symbolic contract variables
contract symex3 is Eurus {
    uint256 somevalue = eurus_symbolic_uint256("somevalue");

    constructor() {}

    function getSomevalue() public view returns (uint256) {
        return somevalue;
    }
}

contract symex4 is Eurus {
    constructor() {}
    function getSender() public returns (address) {
        return msg.sender;
    }
    function testTrueSender() public returns (address) {
        return getSender();
    }
    function testFakeSender(address addr) public returns (address) {
        eurus_prank_once(addr);
        return getSender();
    }
}