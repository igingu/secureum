# My answers
“What risk(s) should be considered when reviewing this contract?”
 A. Reentrancy risks
 B. Logic bugs
 C. Front-running risks
 D. Arithmetic risks
- A, B, C, D
- 1 point

“Which of the following statement(s) is/are true?”
 A. No overflow can ever occur in a contract compiled with solc version 0.8
 B. IERC20.decimals returns(uint256) is not a correct ERC20 function according to the ERC20 specification
 C. The contract does not follow Natspec for all the documentation
 D. None of the above
- B, C
- 1 point

“Which of the following is an/are invariant(s) that should hold true? (assuming no bug)”
 A. The contract's ether balance must be strictly equal to the sum of all the balances (in the balances mapping)
 B. For any user, minted[user] <= balances[user] * 10
 C. For any user, token.balanceOf(user) == balances[user]
 D. None of the above
- D
- Correct answer: B
- 0 points

“Which of the following sentence(s) is/are true regarding getBalances?”
 A. getBalances(msg.sender) returns the sender's balance
 B. getBalances reverts if the user's balance is zero
 C. getBalances always returns zero
 D. None of the above
- C
- 1 point

“Which of the following sentence(s) is/are true regarding the balances mapping?”
 A. An attacker can increase their balances (theft) from balances[victim]
 B. An attacker can reset balances[victim]
 C. An attacker can increase their balances to any amount
 D. An attacker cannot compromise the balances mapping
- B
- 1 point

“Which of the following sentence(s) is/are true regarding reentrancies in this contract? ”
 A. nonReentrant protects the contract from reentrancies
 B. A correct reentrancy protection modifier is not needed if withdraw is refactored to follow the CEI pattern
 C. There are no reentrancy risks
 D. None of the above
- B
- 1 point

“The mint function has the following risks (assuming there are no bugs in the other functions)”
 A. The user can generate tokens without having locked ether
 B. An attacker can front-run a call to mint and make it revert
 C. minted[msg.sender] = amount * decimals_factor; should be replaced by minted[msg.sender] = amount / decimals_factor;
 D. None of the above
- D
- Correct answer: A
- 0 points

“The burn and _has_enough_balance functions have the following risks (assuming there are no bugs in the other functions)”
 A. The user can unlock their balance without burning the underlying tokens
 B. An attacker can front-run a call to burn and make it revert
 C. burn should use tx.origin instead of msg.sender to prevent access control issues
 D. None of the above
- B
- 1 point

# Final score: 6/8
This one I did live, and I was place 11/215

# Official write-up of solutions:
https://ventral.digital/posts/2023/5/1/race-17-of-the-secureum-bootcamp-epoch-infinity