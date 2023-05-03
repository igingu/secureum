# My answers
[Q1] InSecureum balanceOf()
(A): May be optimised by caching state variable in local variable
(B): May be optimised by changing state mutability from view to pure
(C): May be optimised by changing its visibility to external
(D): None of the above
- D, because we already access state directly, can't be pure because accesses state, can't be external because is called internally by balanceOfBatch
- 1 point

[Q2] In InSecureum, array lengths mismatch check is missing in
(A): balanceOfBatch()
(B): _safeBatchTransferFrom()
(C): _mintBatch()
(D): _burnBatch()
- A, B, C, D, because none have the length check
- 1 point

[Q3] The security concern(s) with InSecureum _safeTransferFrom() is/are
(A): Incorrect visibility
(B): Susceptibility to an integer underflow
(C): Missing zero-address validation
(D): None of the above
- A, B, C, because ```public```, ```fromBalance = fromBalance - amount;```, and missing validation
- 1 point

[Q4] The security concern(s) with InSecureum _safeBatchTransferFrom() is/are
(A): Missing array lengths mismatch check
(B): Susceptibility to an integer underflow
(C): Incorrect balance update
(D): None of the above
- A, C, because misses check and doesn't update from balance
- 1 point
 
[Q5] The security concern(s) with InSecureum _mintBatch() is/are
(A): Missing array lengths mismatch check
(B): Incorrect event emission
(C): Allows burning of tokens
(D): None of the above
- A, B, because misses check and swaps ids and amounts.
- Correct answers: A, B, C. C also because 0 address check is on sender, not receiver, so can mint to 0 address, but I wouldn't call that burning
- 0.66 points

[Q6] The security concern(s) with InSecureum _burn() is/are
(A): Missing zero-address validation
(B): Susceptibility to an integer underflow
(C): Incorrect balance update
(D): None of the above
- D, because _burn is implemented correctly
- 1 point

[Q7] The security concern(s) with InSecureum _doSafeTransferAcceptanceCheck() is/are
(A): isContract check on incorrect address
(B): Incorrect check on return value
(C): Call to incorrect isContract implementation
(D): None of the above
- B, C, because the check should be ```!=```, and the call to ```isContract``` reaches the ```isContract``` in the contract, not the one from OpenZeppelin Address.sol, which would have been the correct one
- 1 point

[Q8] The security concern(s) with InSecureum isContract() implementation is/are
(A): Incorrect visibility
(B): Incorrect operator in the comparison
(C): Unnecessary because Ethereum only has Contract accounts
(D): None of the above
- B, because operator should have been !=
- 1 point

# Final score: 7.66/8 points - finished after 13:37 minutes
According to https://polygon.nftscan.com/0x5ff36bf09a7dd502ad3aedab418f1c5dfde59c2e?module=NFTs, I would have been on positions 6-7

# Official write-up of solutions:
https://ventral.digital/posts/2022/3/8/secureum-bootcamp-epoch-march-race-5