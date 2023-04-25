# My answers: 
[Q1] The function signature is the first 4 bytes of the keccak hash which
(A): Includes the function name
(B): Includes a comma separated list of parameter types
(C): Includes a comma separated list of return value types
(D): Is generated only for public and external functions'
- A, B, D
- function signature is last_4_bytes(keccak256("transfer(address,uint256)")), and is only generated for public/external functions
- Correct answers: A, B, D
- 1 point
 
[Q2] The Proxy contract is most similar to a
(A): UUPS Proxy
(B): Beacon Proxy
(C): Transparent Proxy
(D): Metamorphic Proxy
- C
- Not A because UUPS Proxy has implementation upgrade functionality inside implementation contract. Not B because a Beacon Proxy would ask another contract for where the implementation is. Not D because it has no connection to [Metamorphic Contract](https://0age.medium.com/the-promise-and-the-peril-of-metamorphic-contracts-9eb8b8413c5e)
- Correct answer: C
- 1 point
 
[Q3] Gas will be saved with the following changes
(A): Skipping initialization of counter variable
(B): Making increase() function external to avoid copying from calldata to memory
(C): Packing multiple implementation addresses into the same storage slot
(D): Moving the calculation of the counter() function's signature hash to a constant
- A, D
- A because initialization with default values consumes useless gas
- D because that way, a computation would be avoided at runtime - this was wrong as the Solidity compiler already knows this and replaces it with a constant, at compile time, so no optimization
- Correct answer: A
- 0 points

[Q4] Calling the increase() function on the Proxy contract
(A): Will revert since the Proxy contract has no increase() function
(B): Will revert for any other caller than the one that deployed the Proxy
(C): Increases the integer value in the Proxy's storage slot located at index 1
(D): Delegate-calls to the zero-address
- B, because onlyOwner is called in Proxy's context, so the owner is Proxy's deployer
- Correct answers: B, C. I forgot to put C as well
- 0.5 points
 
[Q5] Calling the decrease() function on the Proxy contract
(A): Will revert because it was not correctly registered on the proxy
(B): Will succeed and return the value of counter after it was decreased
(C): Will succeed and return the value of counter before it was decreased
(D): Will succeed and return nothing
- A, because I thought that sending calldata to the zero address would revert
- Correct answers: D
- Explanation from write-up: Since no check is made to prevent calls when no matching signature is found in the implementations mapping, a delegate-call will be made to the zero address, and like all calls that are made to addresses that do not have runtime bytecode, this call will succeed without returning anything. The EVM implicitly assumes that all bytecode ends with the STOP opcode, even if the STOP opcode isn't explicitly mentioned in the bytecode itself. So to the EVM an empty bytecode actually always contains one opcode: STOP - the opcode for stopping execution without errors.
- **LESSON TO LEARN** - calling anything on the 0 address would work, as it contains no bytecode, and that is valid
- 0 points
 
[Q6] Due to a storage clash between the Proxy and the Mastercopy contracts
(A): Proxy's implementations would be overwritten by 0 during initialization of the Mastercopy
(B): Proxy's implementations would be overwritten when the counter variable changes
(C): Proxy's implementations variable's storage slot being overwritten causes a DoS
(D): None of the above
- D, because: A is not, because mapping is stored in some other storage index slot, and the slot of the mapping is left empty. Same explanation for B. Same for C
- Correct answer: D
- 1 point
 
[Q7] The Proxy contract
(A): Won't be able to receive any ether when calldatasize is 0 due to a missing receive()
(B): Will be the owner of the Mastercopy contract
(C): Has a storage clash in slot 0 which will cause issues with the current Mastercopy
(D): None of the above
- B, because Mastercopy is deployed by Proxy so Proxy will be the owner (OpenZeppelin Ownable is initialized with msg.sender) 
- Correct answer: B
- 1 point
 
[Q8] The fallback() function's assembly block
(A): Can be marked as "memory-safe" for gas optimizations
(B): Has the result of the delegate-call overwrite the the call parameters in memory
(C): Interferes with the Slot-Hash calculation for the implementations-mapping by overwriting the scratch space
(D): None of the above
- B, C
- B because the ```returndatacopy``` will copy return data starting at the same index where ```calldatacopy``` copied calldata
- C because I thought the question was formed differently: usually, it would interfeer with such calculation, but here the calculation is done before the delegatecalls, so it would be fine
- Correct answer: B
- 0 points

# Final score: 4.5/8 points
According to https://polygon.nftscan.com/0x5ff36bf09a7dd502ad3aedab418f1c5dfde59c2e?module=NFTs, I would have been on positions 3-7

# Official write-up of solutions:
https://ventral.digital/posts/2022/8/29/secureum-bootcamp-epoch-august-race-9