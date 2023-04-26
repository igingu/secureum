
# My answers
[Q1] Sensible gas optimization(s) would be
(A) Making MIGRATOR_ROLE state variable constant
(B) Making UNDERLYING state variable constant
(C) Making MIGRATOR_ROLE state variable immutable
(D) Making UNDERLYING state variable immutable
- A, D
- A because MIGRATOR_ROLE can be compile-time constant
- D because UNDERLYING is only set once, at deployment time
- Correct answers: A, D
- 1 point

[Q2] What would a caller with MIGRATOR_ROLE permission be capable of?
(A): Manipulating TokenV1's storage
(B): Deleting TokenV1's stored bytecode
(C): Changing TokenV1's stored bytecode to something different
(D): With the current code it's not possible for anyone to have MIGRATOR_ROLE permission
- A, B
- A because delegatecall would act in the context of TokenV1, so the storage can be manipulated
- B because called msg.sender could be a self-destructing contract, which would selfdestruct TokenV1 
- Correct answers: A, B 
- Important bit from the write-up: **Replacing the bytecode would only be possible if TokenV1 was deployed via CREATE2, allowing for a redeployment at the same address with a different bytecode.**
- 1 point

[Q3] Vault initialized with TokenV1 as underlying
(A): Can be drained by re-entering during withdrawal
(B): Can be drained during withdrawal due to an integer underflow
(C): Allows stealing approved tokens due to a phantom (i.e. missing) function
(D): None of the above
- D, because none applied
- Correct answer: C? I don't think C is right, I have pinged creator
- 0 points

[Q4] If Vault were to use safeTransferFrom instead of transferFrom then
(A): It would be able to safely support tokens that don't revert on error
(B): It would ensure that tokens are only sent to contracts that support handling them
(C): It would introduce a re-entrancy vulnerability due to receive hooks
(D): None of the above
- Didn't manage to write anything
- I should have been able to answer this, safeTransferFrom has only to do with A
- Correct answer: A
- 0 points

[Q5] Who would need the MIGRATOR_ROLE for TokenV2 to function as intended?
(A): The deployer of the TokenV2 contract
(B): The TokenV1 contract
(C): The TokenV2 contract
(D): The PermitModule contract
- C, because ```PERMIT_MODULE.delegatecall(msg.data[4:])``` is a delegatecall, and only ```TOKEN_V1.call(abi.encodePacked(hex"00000000", msg.data, msg.sender))``` is a call
- Correct answer: C
- 1 point

[Q6] With TokenV2 deployed, a Vault initialized with TokenV1 as underlying
(A): Is no longer vulnerable in the depositWithPermit() function
(B): Becomes more vulnerable due to a Double-Entry-Point
(C): Stops functioning because TokenV1 has been replaced
(D): None of the above
- D
- Correct answer: B, because you could sweep all of vault's TokenV2 balance
- 0 points

[Q7] Vault initialized with TokenV2 as underlying
(A): Can be drained by re-entering during withdrawal
(B): Can be drained during withdrawal due to a integer underflow
(C): Is not vulnerable in the depositWithPermit() function
(D): Is vulnerable due to a Double-Entry-Point
- D
- Correct answers: C, D. I didn't know it was vulnerable before
- 0.5 points

[Q8] The PermitModule contract
(A): Acts as a proxy
(B): Acts as an implementation
(C): Allows anyone to manipulate TokenV2's balances
(D): Can be self-destructed by anyone
- A, B
- A because by inheriting TokenV1, it also kind of acts like a proxy, B because it acts like an implementation of TokenV2
- Correct answers: B and D (check D explanation in the write-up, pretty cool)
- 0.5 points

# Final score: 4/8 points
According to https://polygon.nftscan.com/0x5ff36bf09a7dd502ad3aedab418f1c5dfde59c2e?module=NFTs, I would have been on position 27-35

# Official write-up of solutions:
https://ventral.digital/posts/2022/12/6/race-12-of-the-secureum-bootcamp-epoch