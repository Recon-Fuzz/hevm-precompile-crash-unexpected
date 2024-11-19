// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

import {BaseSetup} from "@chimera/BaseSetup.sol";
import "src/Basic.sol";

abstract contract Setup is BaseSetup {
    Basic basic;

    function setup() internal virtual override {
        basic = new Basic();
    }
}
