# My answers
[Q1] In transferFrom(), unchecked is not used in the allowance subtraction:
(A): To save gas
(B): To avoid unauthorized transfers
(C): To avoid reentrancy
(D): None of the above
- B, because if trying to transfer more than allowed, would revert
- Correct answer: B
- 1 point

[Q2] In transfer() and transferFrom(), the use of unchecked would not be desired:
(A): When the token uses large number of decimals
(B): When the token uses small number of decimals
(C): At all times
(D): At no times
- D, because function can not overflow because the balances can't exceed the totalSupply, and the totalSupply is always checked
- Correct answer: D
- 1 point

[Q3] In name() and symbol(), the returned values are incorrect because:
(A): The string encoding is too short
(B): Inline assembly return does not leave the function
(C): MSTORE does not fill all bytes until 0x5f and function may return junk at the end
(D): The code always reverts
- C, because it sounded most plausible
- Remix was showing "string: CERC", which should only be "CERC", but that is how Remix was showing it
- Correct answer: C
- 1 point

[Q4] To correct name(), one could make the following change(s):
(A): 
assembly {
          mstore(0x20, 0x20)
          mstore(0x48, 0x0843616c6c6261636b)
          return(0x20, 0x60)
       }

(B): 
function name() external pure returns (string memory n) { n = "Callback"; }

(C): 
return "Callback";

(D): None of the above
- D, because even though intuitively they all seemed correct, putting them in Remix would return "string n Callback". I figured out only later that that's just how Remix shows things, the return value was correct
- Correct answers: A, B, C
- 0 points

**NOTE TO HOW FUNCTION POINTERS WORK**: The function pointer is external, therefore it has an address and a selector, which are used to make an external call.

[Q5] The concern(s) with the check in notify() is/are:
(A): Selector 0x00000000 is the fallback function
(B): Selector 0x00000000 is the receive function
(C): Selector 0x00000000 is possible in which case a valid callback would not be called
(D): Selector can never be 0x00000000, so the check is useless
- D, because I didn't know and took a guess
- Correct answer: C, because callbacks[who].address is actually the function selector. Fallback and receive don't have selectors, but 0x00000000 selector can be valid
- 0 points

[Q6] The concern(s) with the call in notify() is/are:
(A): The call always reverts
(B): The passed function pointer is internal and therefore not accessible via an external call
(C): One should always use try/catch in external calls
(D): The called contract may not have the called function selector thus falling through to fallback or reverting the transfer
- B because I didn't know and took a guess
- Correct answer: D, because There are no checks that the selector exists in the given address when a callback is registered. 
- 0 points

[Q7] Potential change(s) to notify() to mitigate further security concern(s) is/are:
(A): Enforce the callback call to use delegatecall
(B): Enforce the callback call to use staticcall
(C): Send Ether to the called contract
(D): Make the call in inline assembly
- A, because I thought the callback was supposed to run on the same contract, but it would actually create major exploits of any kind
- Correc answer: B, because staticcall doesn't allow any further changes
- 0 points

[Q8] How can the contract be exploited for loss-of-funds via notify callback reentrancy?
(A): During the callback, while being the sender of a transfer, repeat the transfer
(B): During the callback, while being the recipient of a transfer, call transfer again in the token contract sending the tokens back to the original sender
(C): During the callback, while being the recipient of a transfer, burn the received tokens
(D): This cannot happen in this contract
- D, because there are no hooks and ERC20 respects checks effects interactions
- Correct answer: D
- 1 point

# Final score: 4/8 points
According to https://polygon.nftscan.com/0x5ff36bf09a7dd502ad3aedab418f1c5dfde59c2e?module=NFTs, I would have been on position 24-28

# Official write-up of solutions:
https://ventral.digital/posts/2023/1/3/race-13-of-the-secureum-bootcamp-epoch