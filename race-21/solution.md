# My answers
“Which of the following statement(s) is/are true about the burry() function? ”
— 1 of 8
 A. The function always reverts when an out of bounds index (idx) is passed
 B. The function always reverts when localBunnies[idx].rabies is not Rabies.Symptomatic
 C. The function always reverts when less than 7 days have passed since the Rabbit was minted
 D. None of the above
- Correct answer: A
- 1 point

“clones-with-immutable-args are used to deploy ResearchLabs. Which of the following statement(s) about this pattern is/are true?”
— 2 of 8
 A. Arguments originating from the proxy to the implementation are immutable
 B. All arguments passed to the implementation are immutable
 C. Gas costs are lower when cloning versus deploying new implementations
 D. The implementation can be selfdestruct’ed by a malicious caller
- Correct answers: A, C, D
- 1 point

“The adopt() function has a random calculation. Which of the following statement(s), if any, about the source of randomness is/are true?”
— 3 of 8
 A. By using Flashbots a caller can guarantee that Bunny.rabies == Rabies.None
 B. There is an error present that can be corrected by hashing randomSeed before using it
 C. Integer overflow introduces unexpected behavior in this function
 D. None of the above
- Correct answer: D
- 1 point

“Which of the following statement(s) is/are true about the adopt() function?”
— 4 of 8
 A. Minting does not take place unless precisely ADOPTION_PRICE is paid in lidoToken
 B. lidoToken is a known token and is immutable in this contract, therefore transferFrom is safe to use
 C. In some but not all cases the burry() function can cause the adopt() function to be DOS’d
 D. Duplicate bunnies array entries will be produced if they burn their Rabbits NFT using the Rabbits ERC721 contract directly instead of using the RabidRabbits.burry() function
- My answer: D
- Correct answer: C
- 0 points

“TrulyRandomOracleMock.oracleResult() calls calculateResult() passing a struct in memory. calculateResult() attempts to modify the memory struct and does not return a value. Finally, revealResearchResult() writes the entropy struct to storage; this is going to:”
— 5 of 8
 A. Silently fail to update the newEntropy struct and will store the original
 B. Correctly update and then store the newEntropy struct
 C. Revert at runtime
 D. Fail at compile time
- My answer: A
- Correct answer: B
- 0 points

“Which of the following statement(s) about the constructor is/are true?”
— 6 of 8
 A. Gas can be saved by not double casting lidoToken = IERC20(_lidoToken)
 B. Gas can be saved by making rabbitToken immutable
 C. Gas can be saved by storing cloneArgsTarget as bytes
 D. _lidoToken as an argument helps in deploying on multiple networks
- Correct answers: B, D
- 1 point

“Which of the following statement(s) is/are true about the burry() function? ”
— 7 of 8
 A. A user can DOS the burry() function for their idx if they burn their Rabbits NFT using the Rabbits ERC721 contract directly instead of using the RabidRabbits.burry() function
 B. The Bunny.researchLabs array is correctly reset for the deleted idx
 C. The entire burry() function can be DOS’d resulting in all calls to this function failing
 D. None of the above
- Correct answers: A, B, C
- 1 point

“Which of the following statement(s) is/are true about ResearchLab.revealResearchResult() and the functions it interacts with?”
— 8 of 8
 A. The Solidity compiler will fail to compile
 B. The storage for entropy is updated
 C. The storage for researchEndeavors[idx] is updated
 D. None of the above
- Correct answer: B
- 1 point

# Final score: 6/8
This one I did live, and I was place 3/208

# Official write-up of solutions:
https://ventral.digital/posts/2023/9/5/race-21-of-the-secureum-bootcamp-epoch-infinity
