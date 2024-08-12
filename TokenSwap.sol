// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract TokenSwap {
    IERC20 public token1;
    IERC20 public token2;

    constructor(address _token1, address _token2) {
        token1 = IERC20(_token1);
        token2 = IERC20(_token2);
    }

    function swap(uint256 _amount) public {
        require(token1.transferFrom(msg.sender, address(this), _amount), "Transfer failed");
        require(token2.transfer(msg.sender, _amount), "Transfer failed");
    }
}
