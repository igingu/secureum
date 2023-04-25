# My answers
[Q1] Which statements are true in Test1()?
(A): The function does not use all supplied extra data
(B): The function can revert due to an underflow
(C): The function can revert due to an overflow
(D): The function accesses memory which it should not
- A, C
- A, because function only uses last 64 bytes
- C, because ```n + abi.decode(msg.data[msg.data.length-64:], (uint))``` (n + some arbitrary uint256) can overflow
- Correct answers: A, B, C - ```msg.data.length-64``` could underflow - I caught this in Q2, but didn't think to put it here as well
- 2/3 points
 
[Q2] Which statements are true in Test2()?
(A): Result of encodePacked is deterministic
(B): abi.decode always succeeds
(C): It calls function Test1() without any problem
(D): It should use uint256 instead of uint
- A, C
- A because encodePacked is used on constant values => constant result
- C because it correctly concatenates the function selector and any amount of data afterwards, so that it is more than 64 bytes
- Correct answers: A, C
- 1 point
 
[Q3] Which statements are true in NextBookNonce()?
(A): wrap and unwrap cost additional gas
(B): It is safe to use unchecked
(C): There is  something suspicious about  the increment value
(D): It could have used x.nonce++
- B, C
- B because we would have to iterate (2 ^ 256 - 1) / 3 times in order for it to overflow, which won't ever happen
- C because increment is by 3, not 1
- Correct answers: B, C
- 1 point
 
[Q4] Which statements are true in Test3()?
A: bookIndex.nonce is incremented in the loop
B: bookIndex.nonce cannot be incremented because NextBookNonce is pure
C: i++ can be made unchecked
D: memory can be changed to storage without any other changes
- A, C
- A because structs are reference types so even if it's of type memory, the increment is kept
- C because i can be unchecked in for loop
- Correct answers: A, C
- 1 point

[Q5] Which statements are true In Test4()?
(A): The function always reverts with ZeroAddress()
(B): The function always reverts with ZeroAmount()
(C): The function never reverts with ZeroAddress()
(D): The function never reverts with ZeroAmount()
- C, D
- C and D because the error will be (1 | 2 == 3), which will never be == 1 or == 2
- Correct answers: C, D
- 1 point

 
[Q6] Which statements are true in Test5()?
(A): modifier checkInvariants will pause the contract if too much is minted
(B): modifier checkInvariants will never pause the contract
(C): modifier checkInvariants will always pause the contract
(D): There are more efficient ways to handle the require
- A, D
- D because the require can be made to only use the totalMinted and numMinted, without the paused
- I thought A as well because pausing would happen, but because pausing could happen, contract could revert, so then checkInvariants won't actually pause the contract
- Correct answer: B, D
 
[Q7] Which statements are true about the owner?
(A): The owner is initialized
(B): The owner is not initialized
(C): The owner cannot be changed
(D): The owner can be changed
- A, D
- A because Ownable initializes automatically in constructor, D because Ownable has ownership transfer
- Correct answers: A, D
- 1 point
 
[Q8] Which statements are true In Test5() and related functions?
(A): pause is unsafe
(B): unpause is unsafe
(C): The emit is done right
(D): The emit is done wrong
- A, D
- A because pause is not guarded by onlyOwner, D because emit arguments are reversed
- Correct answer: A, D
- 1 point

# Final score: 7.33/8 points
According to https://polygon.nftscan.com/0x5ff36bf09a7dd502ad3aedab418f1c5dfde59c2e?module=NFTs, I would have been on position 1

# Official write-up of solutions:
https://ventral.digital/posts/2022/10/3/secureum-bootcamp-epoch-october-race-10