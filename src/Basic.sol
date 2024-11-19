// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface IERC20 {
    function balanceOf(address) external view returns (uint256);
}

contract Basic {

    // We expect this to cause a crash as we're rawdogging the precompile
    function doACall() public {
        address(0x0a).call("");
    }

    // We don't expect this to cause a crash because the compiler should prevent us from calling it
    // but it crashes HEVM
    function doACall() public {
        uint256 res = IERC20(address(0x0a)).balanceOf(address(this));
        res + 1;
    }

    // Safe, we can actually get the code size
    function doACall() public {
        uint256 size = address(0x0a).code.length;
        size + 1;
    }
}
