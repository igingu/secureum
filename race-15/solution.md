# My answers
[Q1] What is/are the correct implementation(s) of the nonReentrant() modifier?  
(A): 
require (reentrancy_lock == 1); 
       reentrancy_lock = 0;
        _;
       reentrancy_lock = 1;

(B): 
require (reentrancy_lock == 0); 
       reentrancy_lock = 1;
        _;
       reentrancy_lock = 0;

(C): 
require (reentrancy_lock == 1); 
       reentrancy_lock = 1;
        _;
       reentrancy_lock = 0;

(D): 
require (reentrancy_lock == 0); 
       reentrancy_lock = 2;
       _;
       reentrancy_lock = 0;
- B, D because they would both work
- Correct answers: B, D
- 1 point

[Q2] Who can claim fees using claimFees()?
(A): Only the owner, due to onlyOwner modifier
(B): The owner 
(C): Anyone who can trick owner into signing an arbitrary transaction
(D): No one 
- B, C
- B because owner submitting transaction would pass tx.origin == owner
- C because owner doing any call into a contract on the blockchain, and that contract calling claimFees, would also pass tx.origin == owner. Shouldn't use tx.origin
- Correct answers: B, C
- 1 point

[Q3] In buyEth(), we put an unchecked block on “current_eth -= amount”:
(A): Because current_eth is uint
(B): Because the compiler is protecting us from overflows
(C): Only if we add a prior check:
    require(current_eth > amount);
(D): Only if we add a prior check:
    require(current_eth >= amount);
- B, because ```(bool success, ) = msg.sender.call{value: amount}("");``` would revert
- Correct answer: D, because address(this).balance >= current_eth => ```(bool success, ) = msg.sender.call{value: amount}("");``` might not revert even if current_eth < amount
- 0 points

[Q4] In buyEth(), are there any reentrancy concerns assuming the nonReentrant modifier is implemented correctly? 
(A): No, because it has the nonReentrant modifier
(B): No, and even without the modifier you can't exploit any issue 
(C): Yes, there is a cross-contract reentrancy concern via Seller 
(D): None of the above
- C, because external calls are made to unknown token contracts before the token_balance is updated, and token_balance is used to determine ```getEthPrice```
- Correct answer: C
- 1 point

[Q5] What will happen when calling buyEth() via SimpleDexProxy?
(A): buyEth() will be called and successfully executed 
(B): You can’t call a function that way; it must be called directly
(C): buyEth() will be called but ETH won't be transferred
(D): Transaction will be reverted
- D, because SimpleDexProxy has no payable funcgtion to receive ETH
- Correct answer: D. They have a different explanation - no way the SimpleDexProxy to give allowance, so the transferFrom in buyEth doesn't revert
- 1 point

[Q6] In buyEth():
(A): If amount is less than 100, it will lead to an incorrect calculation of fee
(B): If token_balance is already at its MAX_UINT256, it will result in overflow and won't revert
(C): If token_amount is > MAX_UINT64, it will result in a casting issue
(D): None of the above
- A, C
- A, because of ```amount / 100```
- C, because of ```uint64(token_amount)```
- Correct answers: A, C
- 1 point


[Q7] Can getEthPrice() return zero?
(A): Yes, if the owner initializes the contract with more ETH than token_balance
(B)  Yes, a carefully crafted buyEth() transaction can result in getEthPrice() returning zero
(C): Yes, once all the ETH are sold
(D): No, there is no issue
- A, B
- A, because of the constructor
- B, because of reentrancy during buyEth - getEthPrice
- Correct answer: A, becasue buyEth - getEthPrice reentrancy would just increase eth price, not decrease it
- 0 points

[Q8] Which of the following invariants (written in propositional logic) hold on a correct implementation of the code?
(A): this.balance == current_eth <=> token.balanceOf(this) == token_balance
(B): this.balance >= current_eth && token.balanceOf(this) >= token_balance
(C): this.balance <= token.balanceOf(this) &&  token.balanceOf(this) <= token_balance
(D): this.balance >= current_eth || token.balanceOf(this)  >= token_balance
- B, because we could send eth or token to the contrract directly, without the current_eth and token_balance updating
- Correct answers: B, D, because D would also hold but you wouldn't want it like that. Pretty trick question
- 0.5 points

# Final score: 5.5/8 points
According to https://polygon.nftscan.com/0x5ff36bf09a7dd502ad3aedab418f1c5dfde59c2e?module=NFTs, I would have been on position 36-59
# Official write-up of solutions:
https://ventral.digital/posts/2023/2/27/race-15-of-the-secureum-bootcamp-epoch-infinity