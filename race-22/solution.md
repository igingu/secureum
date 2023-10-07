Mint address: 0xc48434a66c95f6bd4c274c4df37cbda05d8141a9

# My answers
“Select the true statement(s) about the above contract:”
— 1 of 8
- Correct answers: C and D
- C because selfdestruct sending ETH doesn't trigger the contract's bytecode, and can happen to any address
- D because withdrawals from beacon chain happen at the protocol level, outside of the EVM. They are gas free and again, do not invoke the contract's bytecode.

“Select the true statement(s) about the above contract:”
— 2 of 8
If calldata is not empty, definitely fallback will be executed.
When calldata is empty, receive is executed. Otherwise, fallback is executed.
- Correct answer: B

“In the above contract, what are some safety checks automatically included by the Solidity compiler?”
— 3 of 8
- Correct answers:
- A because if no payable, sending value causes panic
- B because calldata should be at least 4 bytes + the length of function parameters. If no parameters were there, calldata could have been shorter, if fallback or receive would have existed.
- D/E because Solidity will revert if it can't decode calldata into the parameter types.


“Which of the statement(s) is/are true about the above contract?”
— 4 of 8
Correct answer: D

“Which of the statement(s) is/are true about the above contract when trying to compile using solc 0.8.17 without optimizations?”
— 5 of 8
Correct answer: E

“A developer does some minor changes on the previous contract, resulting in the above contract. Which of the statement(s) is/are true when calling callAndRevert?”
— 6 of 8
Correct answer: E

“Continuing with the same contract, what are the consequences of annotating the assembly block as “memory-safe” ?”
— 7 of 8
Correct answer: E


“Alice and Bob have the exact same Solidity contract. Each one compiles the contract in their machines with the same compiler version and settings (e.g., running solc Example.sol —bin) . Then they compare the resulting outputs. Which of the following statement(s) is/are true?”
— 8 of 8
Correct answer: C, D

# Final score: 5.88, placing 12 from 175.

# Official write-up of solutions:
https://ventral.digital/posts/2023/10/3/race-22-of-the-secureum-bootcamp-epoch-infinity