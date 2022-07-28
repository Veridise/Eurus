// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Eurus {

    constructor() {}

    // set the msg.sender to addr for the upcoming function for ONCE
    function eurus_prank_once(address addr) internal pure { revert("eurus_prank_once"); }

    // symbolic address (not supported for now)
    function eurus_symbolic_address(string memory tag) internal pure returns (address) { revert(tag); }

    // symbolic bool: uint256 in YUL
    function eurus_symbolic_bool(string memory tag) internal pure returns (bool) { revert(tag); }

    // symbolic uint series: all in YUL are bv256
    function eurus_symbolic_uint256(string memory tag) internal pure returns (uint256) { revert(tag); }
    function eurus_symbolic_uint248(string memory tag) internal pure returns (uint248) { revert(tag); }
    function eurus_symbolic_uint240(string memory tag) internal pure returns (uint240) { revert(tag); }
    function eurus_symbolic_uint232(string memory tag) internal pure returns (uint232) { revert(tag); }
    function eurus_symbolic_uint224(string memory tag) internal pure returns (uint224) { revert(tag); }
    function eurus_symbolic_uint216(string memory tag) internal pure returns (uint216) { revert(tag); }
    function eurus_symbolic_uint208(string memory tag) internal pure returns (uint208) { revert(tag); }
    function eurus_symbolic_uint200(string memory tag) internal pure returns (uint200) { revert(tag); }
    function eurus_symbolic_uint192(string memory tag) internal pure returns (uint192) { revert(tag); }
    function eurus_symbolic_uint184(string memory tag) internal pure returns (uint184) { revert(tag); }
    function eurus_symbolic_uint176(string memory tag) internal pure returns (uint176) { revert(tag); }
    function eurus_symbolic_uint168(string memory tag) internal pure returns (uint168) { revert(tag); }
    function eurus_symbolic_uint160(string memory tag) internal pure returns (uint160) { revert(tag); }
    function eurus_symbolic_uint152(string memory tag) internal pure returns (uint152) { revert(tag); }
    function eurus_symbolic_uint144(string memory tag) internal pure returns (uint144) { revert(tag); }
    function eurus_symbolic_uint136(string memory tag) internal pure returns (uint136) { revert(tag); }
    function eurus_symbolic_uint128(string memory tag) internal pure returns (uint128) { revert(tag); }
    function eurus_symbolic_uint120(string memory tag) internal pure returns (uint120) { revert(tag); }
    function eurus_symbolic_uint112(string memory tag) internal pure returns (uint112) { revert(tag); }
    function eurus_symbolic_uint104(string memory tag) internal pure returns (uint104) { revert(tag); }
    function eurus_symbolic_uint96(string memory tag) internal pure returns (uint96) { revert(tag); }
    function eurus_symbolic_uint88(string memory tag) internal pure returns (uint88) { revert(tag); }
    function eurus_symbolic_uint80(string memory tag) internal pure returns (uint80) { revert(tag); }
    function eurus_symbolic_uint72(string memory tag) internal pure returns (uint72) { revert(tag); }
    function eurus_symbolic_uint64(string memory tag) internal pure returns (uint64) { revert(tag); }
    function eurus_symbolic_uint56(string memory tag) internal pure returns (uint56) { revert(tag); }
    function eurus_symbolic_uint48(string memory tag) internal pure returns (uint48) { revert(tag); }
    function eurus_symbolic_uint40(string memory tag) internal pure returns (uint40) { revert(tag); }
    function eurus_symbolic_uint32(string memory tag) internal pure returns (uint32) { revert(tag); }
    function eurus_symbolic_uint24(string memory tag) internal pure returns (uint24) { revert(tag); }
    function eurus_symbolic_uint16(string memory tag) internal pure returns (uint16) { revert(tag); }
    function eurus_symbolic_uint8(string memory tag) internal pure returns (uint8) { revert(tag); }
    function eurus_symbolic_uint(string memory tag) internal pure returns (uint) { revert(tag); }

    // symbolic int series: all in YUL are bv256
    function eurus_symbolic_int256(string memory tag) internal pure returns (int256) { revert(tag); }
    function eurus_symbolic_int248(string memory tag) internal pure returns (int248) { revert(tag); }
    function eurus_symbolic_int240(string memory tag) internal pure returns (int240) { revert(tag); }
    function eurus_symbolic_int232(string memory tag) internal pure returns (int232) { revert(tag); }
    function eurus_symbolic_int224(string memory tag) internal pure returns (int224) { revert(tag); }
    function eurus_symbolic_int216(string memory tag) internal pure returns (int216) { revert(tag); }
    function eurus_symbolic_int208(string memory tag) internal pure returns (int208) { revert(tag); }
    function eurus_symbolic_int200(string memory tag) internal pure returns (int200) { revert(tag); }
    function eurus_symbolic_int192(string memory tag) internal pure returns (int192) { revert(tag); }
    function eurus_symbolic_int184(string memory tag) internal pure returns (int184) { revert(tag); }
    function eurus_symbolic_int176(string memory tag) internal pure returns (int176) { revert(tag); }
    function eurus_symbolic_int168(string memory tag) internal pure returns (int168) { revert(tag); }
    function eurus_symbolic_int160(string memory tag) internal pure returns (int160) { revert(tag); }
    function eurus_symbolic_int152(string memory tag) internal pure returns (int152) { revert(tag); }
    function eurus_symbolic_int144(string memory tag) internal pure returns (int144) { revert(tag); }
    function eurus_symbolic_int136(string memory tag) internal pure returns (int136) { revert(tag); }
    function eurus_symbolic_int128(string memory tag) internal pure returns (int128) { revert(tag); }
    function eurus_symbolic_int120(string memory tag) internal pure returns (int120) { revert(tag); }
    function eurus_symbolic_int112(string memory tag) internal pure returns (int112) { revert(tag); }
    function eurus_symbolic_int104(string memory tag) internal pure returns (int104) { revert(tag); }
    function eurus_symbolic_int96(string memory tag) internal pure returns (int96) { revert(tag); }
    function eurus_symbolic_int88(string memory tag) internal pure returns (int88) { revert(tag); }
    function eurus_symbolic_int80(string memory tag) internal pure returns (int80) { revert(tag); }
    function eurus_symbolic_int72(string memory tag) internal pure returns (int72) { revert(tag); }
    function eurus_symbolic_int64(string memory tag) internal pure returns (int64) { revert(tag); }
    function eurus_symbolic_int56(string memory tag) internal pure returns (int56) { revert(tag); }
    function eurus_symbolic_int48(string memory tag) internal pure returns (int48) { revert(tag); }
    function eurus_symbolic_int40(string memory tag) internal pure returns (int40) { revert(tag); }
    function eurus_symbolic_int32(string memory tag) internal pure returns (int32) { revert(tag); }
    function eurus_symbolic_int24(string memory tag) internal pure returns (int24) { revert(tag); }
    function eurus_symbolic_int16(string memory tag) internal pure returns (int16) { revert(tag); }
    function eurus_symbolic_int8(string memory tag) internal pure returns (int8) { revert(tag); }
    function eurus_symbolic_int(string memory tag) internal pure returns (int) { revert(tag); }


    // same as rosette's assume: adding cond to verification conditions
    function eurus_assume(string memory tag, bool cond) internal pure { revert(tag); }

    // solving for a counterexample, i.e., (solve (! cond))
    // (optional) if no counterexample is found, add cond to assume
    function eurus_assert(string memory tag, bool cond) internal pure { revert(tag); }

    // simply print something
    function eurus_says(string memory tag) internal pure { revert(tag); }

    // rosette debugging utilities
    function rosette_assume(string memory tag, bool cond) internal pure { revert(tag); } // rosette's assume
    function rosette_assert(string memory tag, bool cond) internal pure { revert(tag); } // rosette's assert
    function rosette_cex(string memory tag, bool cond) internal pure { revert(tag); } // solve for a counter example, that is, (solve (! cond))
    function rosette_solve(string memory tag, bool cond) internal pure { revert(tag); } // solve for a solution, that is, (solve cond)
    
}
