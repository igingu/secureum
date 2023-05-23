# My answers
[Q1] The mint price of an InSecureumApe is
(A): 0.0008 ETH
(B): 0.008 ETH
(C): 0.08 ETH
(D): 0.8 ETH
- D
- 1 point

[Q2] The security concern(s) with InSecureumApe access control is/are
(A): Owner can arbitrarily pause public minting of InSecureumApes
(B): Owner can arbitrarily mint InSecureumApes
(C): Single-step ownership change
(D): Missing event emits in and time-delayed effects of owner functions
- A, B, C, D
- 1 point
 
[Q3] The security concern(s) with InSecureumApe constructor is/are
(A): Missing sanity/threshold check on maxNftSupply
(B): Missing sanity/threshold check on saleStart
(C): Potential integer overflow
(D): None of the above
- A, B
- Correct answers: A, B, C. C because Solidity used is ^0.7.0, which doesn't have automatic overflow checks.
- 0.66 points
 
[Q4] The total number of InSecureumApes that can ever be minted is
(A): maxApePurchase
(B): MAX_APES
(C): MAX_APES + 30
(D): type(uint256).max
- D
- 1 point
 
[Q5] The public minting of InSecureumApes
(A): Must be paid the exact amount in Ether
(B): May be performed 19 NFTs at a time
(C): Uses _safeMint to prevent locked/stuck NFTs
(D): None of the above
- B, C
- 1 point
 
[Q6] The security concern(s) with InSecureumApe is/are
(A): Use of a floating pragma and an older compiler version
(B): Oracle price manipulation
(C): Reentrancy allowing bypass of maxApePurchase check
(D): None of the above
- A, C
- 1 point
 
[Q7] The starting index determination
(A): Is meant to randomize NFT reveal post-mint
(B): Can be triggered by the owner at any time
(C): May be triggered only 9 days after sale start
(D): Accounts for the fact that EVM only stores previous 256 block hashes
- B, D
- Correct answers: A, B, D. I do not agree with A, as we can't determine intention from the code
- 0.66 points

[Q8] Potential gas optimization(s) in InSecureumApe is/are
(A): Caching of storage variables
(B): Avoiding initializations of variables to default values of their types
(C): Use of immutables
(D): None of the above
- A, B, C
- 1 point

# Final score: 7.33/8 points - finished after 11 minutes
According to https://polygon.nftscan.com/0x5ff36bf09a7dd502ad3aedab418f1c5dfde59c2e?module=NFTs, I would have been on positions 6-8

# Official write-up of solutions:
https://ventral.digital/posts/2022/07/secureum-bootcamp-epoch-june-race-7