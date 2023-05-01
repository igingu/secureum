# My answers
“deposit() can revert:”
- 1 of 8
A. If insufficient ETH was sent with the call
B. If the caller has insufficient WETH balance
C. With the "cap exceeded" error
D. If called internally
- B, C
- B because of ```WETH.transferFrom(msg.sender, address(this), amount);```
- C because of ```require((totalContributions += amount) <= TOTAL_CONTRIBUTION_CAP, "cap exceeded");```
- Correct answers: A, B. A because ```WETH.deposit{value: amount}();``` can revert, C because computation would revert with overflow as totalContributions and TOTAL_CONTRIBUTION_CAP are both uint72
- 0.5 points

"What issues pertain to the deposit() function?”
— 2 of 8
 A. Funds can be drained through re-entrancy
 B. Accounting mismatch if user specifies amount > msg.value
 C. Accounting mismatch if user specifies amount < msg.value
 D. totalContributionCap isn't enforced on an individual level
- C, because of ```WETH.deposit{value: amount}();```
- Correct answer: C
- 1 point

“Which of the following is/are true about withdraw()?”
— 3 of 8
 A. Funds can be drained through re-entrancy
 B. Funds can be drained due to improper amount accounting in deposit()
 C. Assuming a sufficiently high gas limit, the function reverts from the recipient (caller) consuming all forwarded gas
 D. May revert with "failed to transfer ETH"
- D, because ```require(success, "failed to transfer ETH");```, and the rest were false
- Correct answer: D
- 1 point

“Which of the following parameters are correctly emitted in the ContributorsUpdated() event?”
— 4 of 8
 A. newContributor
 B. oldNumContributors
 C. newNumContributors
 D. None of the above.
- A, because I thought an old contributor should be emitted as new ocntributor if they deposit after withdrawing everything
- Correct answer, A, but because of other reasons - see write-up
- 1 point

“The vault deployer can pause the following functions:”
— 5 of 8
 A. deposit()
 B. withdraw()
 C. requestAllowance()
 D. None of the above
- D, because pause functionality is not externally exposed
- Correct answer: D
- 1 point

“What is the largest possible allowance given to the controller?”
— 6 of 8
 A. 40% of totalContributionCap
 B. 60% of totalContributionCap
 C. 100% of totalContributionCap
 D. Unbounded
- D, because I thought safeApprove would increase the allowance
- Correct answer: C, because you can approve as much as totalContributions, which can be at most as totalContributionCap
- 0 points

“The requestAllowance() implementation would have failed after the 1st call for tokens that only allow zero to non-zero allowances. Which of the following mitigations do NOT work? ”
— 7 of 8
 A. safeApprove(0) followed by safeApprove(type(uint256).max)
 B. safeIncreaseAllowance(type(uint256).max)
 C. safeIncreaseAllowance(0) followed by safeIncreaseAllowance(type(uint256).max)
 D. safeDecreaseAllowance(0) followed by safeApprove(type(uint256).max)
- B, C, D, because they only increase/decrease by 0, not set to 0
- Correct answers: B, C, D
- 1 point


“Which of the following gas optimizations are relevant in reducing runtime gas costs for the vault contract?”
— 8 of 8
 A. Changing ALLOWANCE_CAP type from immutable to constant, ie. uint256 public constant ALLOWANCE_CAP = 40 * uint256(TOTAL_CONTRIBUTION_CAP) / 100;
 B. Increase number of solc runs (assuming default was 200 runs)
 C. Renaming functions so that the most used functions have smaller method IDs
 D. Use unchecked math in withdraw()
 - A, C? I don't remember
 - Correct answers: B, C. Higher number of solc runs increases deployment but decreases runtime. D is not because unchecked couldn't have been used, and A is not because immutable is also replaced at deploy-time
 - 0.5 points

Adding up now, it seems I got 6 points, but contest reported 5, so I probably don't remember correctly what answers I gave.

# Final score: 5/8
This one I did live, and I was place 10/230

# Official write-up of solutions:
https://ventral.digital/posts/2023/5/1/race-17-of-the-secureum-bootcamp-epoch-infinity