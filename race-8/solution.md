# My answers
[Q1] Which of the following is/are true?
(A): NFT ownership is tracked by _ownerOf
(B): NFT balance is tracked by _balanceOf
(C): NFT approvals are tracked by getApproved
(D): NFT operator can transfer all of owner’s NFTs
- A, B, C, D
- 1 point

[Q2] InSecureumERC721 recognizes the following role(s)
(A): Owner
(B): Spender (Approved address)
(C): Operator
(D): None of the above
 - A, B, C
 - 1 point

[Q3] The security concern(s) addressed explicitly in _mint include
(A): Prevent minting to zero address
(B): Prevent reminting of NFTs
(C): Transparency by emitting event
(D): None of the above
- A, B, C
- 1 point
 
[Q4] The security concerns in _burn include
(A): Anyone can arbitrarily burn NFTs
(B): Potential integer underflow because of unchecked
(C): Incorrect emission of event
(D): None of the above
- A
- 1 point
 
[Q5] The security concern(s) addressed explicitly in _safeMint include
(A): Validating if the recipient is an EOA
(B): Ensuring that the recipient can only be an EOA
(C): Validating if the recipient is an ERC721 aware contract
(D): None of the above
- A, C
- 1 point
 
[Q6] Function approve
(A): Allows the NFT owner to approve a spender
(B): Allows the NFT spender to approve an operator
(C): Allows the NFT operator to approve a spender
(D): None of the above
- A, C
- 1 point
 
[Q7] Function setApprovalForAll
(A): Approves msg.sender to manage operator’s NFTs
(B): Gives everyone approval to manage msg.sender’s NFTs
(C): Revokes everyone’s approvals to manage msg.sender’s NFTs
(D): None of the above
- D
- 1 point

[Q8] The security concern(s) in transferFrom include
(A): Allowing the msg.sender to transfer any NFT
(B): NFTs potentially stuck in recipient contracts
(C): Potential integer underflow
(D): None of the above
- B
- Correct answers: A, B, C
- 0.33 points
 
# Final score: 7.33/8 points - finished after 8 minutes
According to https://polygon.nftscan.com/0x5ff36bf09a7dd502ad3aedab418f1c5dfde59c2e?module=NFTs, I would have been on position 3

# Official write-up of solutions:
https://ventral.digital/posts/2022/7/25/secureum-bootcamp-epoch-july-race-8