pragma solidity ^0.8.13;

import "./ERC20.sol";
import "./UniswapModel.sol";
import "./PuppetPool.sol";

contract Eurus {
    function eurus_assume(string memory msg, bool cond) public view {
        revert(msg);
    }

    function eurus_assert(string memory msg, bool cond) public view {
        revert(msg);
    }

    function eurus_synthesize(string memory msg, bool cond) public view {
        revert(msg);
    }

    function eurus_attack(string memory msg, bool cond) public view {
        revert(msg);
    }

    function eurus_prank_once(address sender) public view {
        revert("eurus_prank_once");
    }

    function eurus_symbolic_uint256(string memory id) internal view returns (uint256) {
        revert(id);
    }
}

abstract contract Harness is Eurus {
    ERC20 tgtToken;
    ERC20 ethToken;
    UniswapModel uniswap;
    PuppetPool pool;
    address owner;

    constructor() {
        tgtToken = ERC20(address(1));
        ethToken = ERC20(address(2));
        uniswap = UniswapModel(address(3));
        pool = PuppetPool(address(4));
        owner = address(5);
        uint256 value = 0;
        address sender = address(this);
        value = 0;
        eurus_prank_once(sender);
        (bool success81, ) = address(uniswap).call(abi.encodeWithSelector(hex"a7be7948", address(tgtToken), address(ethToken)));
        eurus_assume("msg365", success81);
        value = 0;
        eurus_prank_once(sender);
        (bool success111, ) = address(pool).call(abi.encodeWithSelector(hex"8597600f", address(ethToken), address(tgtToken), address(uniswap)));
        eurus_assume("msg361", success111);
        value = 0;
        eurus_prank_once(sender);
        (bool success135, ) = address(tgtToken).call(abi.encodeWithSelector(hex"dac3bd85", owner, 1000000));
        eurus_assume("msg357", success135);
        value = 0;
        eurus_prank_once(sender);
        (bool success159, ) = address(ethToken).call(abi.encodeWithSelector(hex"dac3bd85", owner, 1000000));
        eurus_assume("msg353", success159);
        sender = owner;
        value = 0;
        eurus_prank_once(sender);
        (bool success190, ) = address(tgtToken).call(abi.encodeWithSelector(hex"a9059cbb", address(pool), 100000));
        eurus_assume("msg349", success190 && true);
        sender = owner;
        value = 0;
        eurus_prank_once(sender);
        (bool success222, ) = address(tgtToken).call(abi.encodeWithSelector(hex"a9059cbb", address(uniswap), 10));
        eurus_assume("msg345", success222 && true);
        sender = owner;
        value = 0;
        eurus_prank_once(sender);
        (bool success254, ) = address(ethToken).call(abi.encodeWithSelector(hex"a9059cbb", address(uniswap), 10));
        eurus_assume("msg341", success254 && true);
        sender = owner;
        value = 0;
        eurus_prank_once(sender);
        (bool success289, ) = address(tgtToken).call(abi.encodeWithSelector(hex"a9059cbb", address(this), 1000));
        eurus_assume("msg333", success289 && true);
        sender = owner;
        value = 0;
        eurus_prank_once(sender);
        (bool success324, ) = address(ethToken).call(abi.encodeWithSelector(hex"a9059cbb", address(this), 25));
        eurus_assume("msg337", success324 && true);
    }

    function attack() virtual public;

    function harness465() public {
        uint256 value = 0;
        address sender = address(this);
        value = 0;
        eurus_prank_once(sender);
        (bool success400, ) = address(this).call(abi.encodeWithSelector(hex"9e5faafc"));
        eurus_prank_once(sender);
        eurus_attack("msg458", success400 && (tgtToken.balanceOf(address(pool)) == 0));
    }
}
