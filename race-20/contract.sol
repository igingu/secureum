// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/// @notice Efficient library for creating string representations of integers.
/// @author Solmate (https://github.com/Rari-Capital/solmate/blob/v7/src/utils/LibString.sol)
library LibString {
    function toString(uint256 n) internal pure returns (string memory str) {
        if (n == 0) return "0"; // Otherwise it'd output an empty string for 0.

        assembly {
            let k := 78 // Start with the max length a uint256 string could be.

            // We'll store our string at the first chunk of free memory.
            str := mload(0x40)

            // The length of our string will start off at the max of 78.
            mstore(str, k)
            // Update the free memory pointer to prevent overriding our string.
            // Add 128 to the str pointer instead of 78 because we want to maintain
            // the Solidity convention of keeping the free memory pointer word aligned.
            mstore(0x40, add(str, 128))

            // We'll populate the string from right to left.
            // prettier-ignore
            for {} n {} {
                // The ASCII digit offset for '0' is 48.
                let char := add(48, mod(n, 10))

                // Write the current character into str.
                mstore(add(str, k), char)

                k := sub(k, 1)
                n := div(n, 10)
            }

            // Shift the pointer to the start of the string.
            str := add(str, k)

            // Set the length of the string to the correct value.
            mstore(str, sub(78, k))
        }
    }
}


import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

abstract contract Proxy is ReentrancyGuard {
   function _delegate(address implementation) nonReentrant internal virtual {
       assembly ("memory-safe") {
           // Copy msg.data. We take full control of memory in this inline assembly
           // block because it will not return to Solidity code. We overwrite the
           // Solidity scratch pad at memory position 0.
           calldatacopy(0, 0, calldatasize())

           // Call the implementation.
           // out and outsize are 0 because we don't know the size yet.
           let result := delegatecall(gas(), implementation, 0, calldatasize(), 0, 0)

           // Copy the returned data.
           returndatacopy(0, 0, returndatasize())

           switch result
           // delegatecall returns 0 on error.
           case 0 {
               revert(0, returndatasize())
           }
           default {
               return(0, returndatasize())
           }
       }
   }
}