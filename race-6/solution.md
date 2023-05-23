# My answers
[Q1] The security concern(s) with InSecureumLand is/are
(A): Single-step ownership change
(B): Incorrectly implemented KYC check using Merkle proofs
(C): Missing time-delayed change of critical parameters
(D): Accidentally sent Ether gets locked in contract
- A, C
- 1 point
 
[Q2] The security concern(s) with InSecureumLand setOperator() is/are
(A): Missing zero-address validation
(B): Missing event emission
(C): Incorrect modifier
(D): None of the above
- A, B
- 1 point

[Q3] The security concern(s) with InSecureumLand mintLands() is/are
(A): Minting could exceed max supply
(B): Minting could exceed maxMintPerTx
(C): Minting could exceed maxMintPerAddress
(D): None of the above
- A, B
- Correct answer: A
- I disagree, as a smart contract calling `mintLands` in a loop would exceed maxMintPerTx
- 0 points

[Q4] Missing threshold check(s) on parameter(s) is/are a concern in
(A): mintLands
(B): startPublicSale
(C): contributorsClaimLand
(D): None of the above
- D
- Correct answers: B, C
- 0 points
 
[Q5] The security concern(s) with InSecureumLand contributors claim functions is/are
(A): Anyone can call startContributorsClaimPeriod
(B): Anyone can call stopContributorsClaimPeriod
(C): Anyone can call contributorsClaimLand
(D): None of the above
- D
- Correct answer: C
- 0 points
 
[Q6] The security concern(s) with InSecureumLand random number usage is/are
(A): It depends on miner-influenceable block.timestamp
(B): It depends on miner-influenceable blockhash
(C): It depends on deprecated Chainlink VRF v1
(D): None of the above
- C
- 1 point
 
[Q7] The documentation/readability concern(s) with InSecureumLand is/are
(A): Stale comments
(B): Missing NatSpec
(C): Minimal inlined comments
(D): None of the above
- A, B, C
- Write-up says only B and C, but there are stale comments as well: "// Alpha/Beta Claim Methods"
- 1 point
 
[Q8] Potential gas optimization(s) (after appropriate security considerations) in InSecureumLand is/are
(A): Removing nonReentrant modifier if mint addresses are known to be EOA
(B): Using _mint instead of _safeMint if mint addresses are known to be EOA
(C): Using unchecked in for loop increments
(D): None of the above
- A, B, C
- 1 point

# Final score: 5/8 points - finished after 14.5 minutes
According to https://polygon.nftscan.com/0x5ff36bf09a7dd502ad3aedab418f1c5dfde59c2e?module=NFTs, I would have been on positions 34-38
# Official write-up of solutions:
https://ventral.digital/posts/2022/5/16/secureum-bootcamp-epoch-may-race-6