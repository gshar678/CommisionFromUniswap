// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

interface ISwap {

  function swapExactTokensForTokens( 
  uint amountIn,
  uint amountOutMin,
  address[] calldata path,
  address to,
  uint deadline) external view returns (uint[] memory amounts);

  function swapTokensForExactTokens( uint amountOut,
  uint amountInMax,
  address[] calldata path,
  address to,
  uint deadline) external view returns (uint[] memory amounts);

}

contract ExchangeWithCommision {

  address private constant UNISWAP_V2_ROUTER = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;

  function swapExactTokensForTokensWithCommision ( 
  uint amountIn,
  uint amountOutMin,
  address[] calldata path,
  address to,
  uint deadline) external payable
 
 {

    require(msg.value == amountIn);

    payable(address(this)).transfer(amountOutMin*1/100);   

    ISwap(UNISWAP_V2_ROUTER).swapExactTokensForTokens(amountIn, amountOutMin, path, to, deadline);
 }

  
 function swapTokensForExactTokensWithCommision (
  uint amountOut,
  uint amountInMax,
  address[] calldata path,
  address to,
  uint deadline

  ) external payable
 
 {
       require(msg.value == amountInMax);

       payable(address(this)).transfer(amountOut*1/100);

       ISwap(UNISWAP_V2_ROUTER).swapTokensForExactTokens(amountOut, amountInMax, path, to, deadline);
 }


 }
