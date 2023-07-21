# My answers
“The deployment concern(s) here for different EVM-compatible chains is/are:”
— 1 of 8
 A. receive method behavior might be undefined
 B. The presence of ecrecover precompile is potentially dangerous
 C. Not all opcodes in the bytecode are guaranteed to be supported
 D. None of the above
- D
- Correct answer: C, because it was talking about EVM-compatibility, not equivalence.
- 0 points


“The security concern(s) in WalletFactory is/are:”
— 2 of 8
 A. ETH funds may get stuck in it forever
 B. The deploy method is not marked as payable
 C. No access control on wallet deployment
 D. Deployment may silently fail
- A, D
- 1 point


“Design flaw(s) of Wallet is/are:”
— 3 of 8
 A. Missing wallet owner role and appropriate access control
 B. Inability to rescue stuck tokens
 C. Assembly usage is unsafe for the Yul IR pipeline
 D. Calling a payable method in a for-loop
- A
- 1 point

“The security concern(s) with hashing of transaction parameter in execute is/are:”
— 4 of 8
 A. Cross-contract replay attacks
 B. Cross-chain replay attacks
 C. keccak256 hash collision attacks
 D. Reentrancy attacks
- A, B, C, D
- Correct answer: B
- 0 points

“If the hashed payload in execute were to exclude a nonce, the security concern(s) with ecrecover would be:”
— 5 of 8
 A. Signature malleability by flipping the s or v values
 B. Signature malleability by using compact signatures
 C. Signature malleability by hash collisions
 D. Forcefully reverting transactions
- B, D
- Correct answer: A
- 0 points

“The security concern(s) with Wallet is/are:”
— 6 of 8
 A. Ether sent to the contract will be stuck forever
 B. Anyone can execute arbitrary calls
 C. Anyone can steal the contract ETH balance
 D. None of the above
- B, C
- 1 point

“The nonce best practice(s) not followed correctly is/are:”
— 7 of 8
 A. Nonce is not incremented before the low-level call
 B. Nonce is not guaranteed to be included in the signature
 C. Nonce is not incremented correctly on transaction execution
 D. None of the above
- A, C
- 1 point


“The security concern(s) with Wallet contract related to ERC721 tokens is/are:”
— 8 of 8
 A. There is no way to get ERC721 tokens out of the contract
 B. Failure to receive ERC721 tokens depending on the transfer method
 C. Failure to receive any ERC721 tokens
 D. Unauthorized burning of ERC721 tokens
- B, D
- 1 point

# Final score: 5/8
This one I did live, and I was place 25/213

# Official write-up of solutions:
https://ventral.digital/posts/2023/7/3/race-19-of-the-secureum-bootcamp-epoch-infinity