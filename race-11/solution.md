# My answers

[Q1] Which statements are true in withdraw()?
(A) Can be successfully executed when contract is paused
(B) User can withdraw only after _minDepositLockTime elapsed since last withdrawal
(C) Follows checks-effects-interaction pattern best practice
(D) User can withdraw more than deposited
- D, because user can retrieve any amount, even if > _userBalances[msg.sender]
- Correct answer: D
- 1 point

[Q2] Which mitigations are applicable to withdraw()?
(A): Transferred amount should be minimum of amount and _userBalances[msg.sender]
(B): Move if/else block before safeTransferFrom
(C): Require amount to be <= user’s balance deposited earlier
(D): Remove if/else block and add _userBalances[msg.sender] -= amount before safeTransferFrom
- A, B, C, D
- All of them because they all would make the code safer
- Correct answers: A, C, D - they didn't consider B because it wouldn't be checks-effects-interactions still? 
- 2/3 points

[Q3] The security concern(s) in pause() is/are:
(A): Does not emit an event
(B): Access control is not strict enough
(C): Will always revert
(D): None of the above
- D
- Correct answer: A. They consider not emitting an event as a security concern, I did not know that
- 0 points

[Q4] Which statement(s) is/are true for unpause()?
A: Will unpause deposits and withdrawals
B: Will unpause withdrawals only
C: Anyone can successfully call the function
D: None of the above
- B, because only withdraw is guarded by paused modifier
- Correct answers: B, C. Anyone can unpause because anyone can change the governance address to theirs and unpause
- 0.5 points

[Q5] Which statement(s) is/are true in depositFor()?
(A): Can be executed when contract is paused
(B): Allows a user to deposit for another user
(C): Allows a user to fund the deposit for another user
(D): None of the above
- A, B
- A because it is not guarded by paused modifier, B because it deposits for another user
- Correct answers: A, B
- 1 point

[Q6] The issue(s) in depositFor() is/are:
(A): Cannot be paused for emergency
(B): Exploitable re-entrancy attack
(C): User withdrawals can be delayed indefinitely via DoS attack
(D): None of the above
- A because doesn't have paused modifier
- Correct answer: A, C, because one could call depositFor(user, 0) and just increase the _userLastDeposit indefinetly
- 0.5 points

[Q7] Which of the following statement(s) is/are true?
(A): Withdraw event is emitted with incorrect amount
(B): Withdraw event is emitted with correct user
(C): Deposit event is always emitted incorrectly
(D): Deposit event is emitted with incorrect user
- B, D
- B because user is correct, D because emits msg.sender instead of user
- Correct answers: B, D
- 1 point

[Q8] Potential gas optimization(s) is/are:
(A): Use immutable for all variables assigned in constructor
(B): Use immutable for _token, _operator and _minDepositLockTime
(C): Use unchecked
(D): None of the above
- B because governance is changeable, C because there are places where unchecked can be used
- Correct ansers: B, C
- 1 point

# Final score: 5.66/8 points
According to https://polygon.nftscan.com/0x5ff36bf09a7dd502ad3aedab418f1c5dfde59c2e?module=NFTs, I would have been on position 43-52

# Official write-up of solutions:
https://ventral.digital/posts/2022/10/31/race-11-of-the-secureum-bootcamp-epoch