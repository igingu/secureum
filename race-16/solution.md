# My answers: 
[Q1] Which of the following is an explanation of why flashLoan() could revert?
(A): The transaction reverts because a user requested to borrow more than maxFlashLoan()
(B): The transaction reverts because the receiver’s onFlashLoan() did not return CALLBACK_SUCCESS
(C): The transaction reverts because the user returned more than retAmt funds
(D): The transaction reverts because a user tried to spend more funds than their allowance in onFlashLoan()
- A, B, D
- A because of 
```
uint256 oldBal = IERC20(token).balanceOf(address(this));
require(amount <= oldBal, "Too many funds requested");
```
- B because of 
```
require(
    receiver.onFlashLoan(msg.sender, token, amount, fee, data) == CALLBACK_SUCCESS,
    "Callback failed"
);
```
- D because normal ERC20 implementation would revert if transferFrom spends more than allowance
- Correct answers: A, B, D
- 1 point

[Q2] If the FlashLoan contract were safe, which of the following invariants should hold at the end of any given transaction for some ERC20 token t? Note: old(expr) evaluates expr at the beginning of the transaction.
(A): t.balanceOf(address(this)) >= old(t.balanceOf(address(this)))
(B): t.balanceOf(address(this)) == old(t.balanceOf(address(this)))
(C): t.balanceOf(address(this)) > old(t.balanceOf(address(this)))
(D): t.balanceOf(address(this)) == old(t.balanceOf(address(this))) + fee
- A, because at least ```t.balanceOf(address(this)) == old(t.balanceOf(address(this)))``` should hold, but nothing interdicts > from being valid, so ```t.balanceOf(address(this)) >= old(t.balanceOf(address(this)))```
- Correct answer: A
- 1 point

[Q3] Which of the following tokens would be unsafe for the above contract to loan as doing so could result in theft?
(A): ERC223
(B): ERC677
(C): ERC777
(D): ERC1155 
- I didn't put any answer as a potential exploit could be done with callbacks on msg.sender, the contract that receives the flashloan. [ERC223](https://github.com/Dexaran/ERC223-token-standard), [ERC677](https://github.com/ethereum/EIPs/issues/677) and [ERC1155](https://eips.ethereum.org/EIPS/eip-1155) only have receiver callbacks.
- Correct answer: C, because [ERC777](https://eips.ethereum.org/EIPS/eip-777) implements sender callbacks. 
- 0 points

[Q4] Which external call made by flashLoan() could result in theft if the token(s) identified in the previous question  were to be used?
(A): onFlashLoan()
(B): balanceOf()
(C): transferFrom()
(D): approve() 
- I didn't put any answer, as I didn't have any answer to Q3 either
- Correct answer: C, because sender callbacks would allow msg.sender to reenter, since it would be called from transferFrom => tokensToSend
- 0 points

[Q5] What is the purpose of the fee in the FlashLoan contract as is?
(A): To increase the size of available flashloans over time
(B): To pay the owner of the flashloan contract
(C): To pay those who staked their funds to be flashloaned
(D): It has no purpose
- B, C
- B because it is to pay the owner
- C I thought the question would be more generic, as you could have a staking contract where rewards would come from flashloan fees
- Correct answer: A, because in the current context, the available flashloan amount would just increase, and owner or stakers don't exist so wouldn't be able to take it out
- 0 points

[Q6] Which of the following describes the behavior of maxFlashLoan for a standard ERC20 token over time?
(A): Strictly-increasing
(B): Non-decreasing
(C): Constant
(D): None of the above
- B, because if ```feeLoan``` returns 0, the maxFlashLoan amount would stay the same. Otherwise, it would increase
- Correct answer: B
- 1 point

[Q7] For some arbitrary ERC20 token t, which of the following accurately describes the FlashLoan contract's balance of t after a successful (i.e. non-reverting) call to flashLoan() (where t is the token requested for the flashloan)?
(A): The FlashLoan contract's balance of token t will INCREASE OR STAY THE SAME
(B): The FlashLoan contract's balance of token t will DECREASE OR STAY THE SAME
(C): The FlashLoan contract's balance of token t will STAY THE SAME
(D): None of the above
- A, because I thought we refer to a correctly implemented ERC20 token, although that was not one of the assumption, the wording was "arbitrary"
- Correct answer: D, since ERC20 token could be a bogus implementation and ```flashLoan``` could hypothetically finish even with ERC20 bogus implementation
- 0 points

[Q8] Which of the following are guaranteed to hold after a successful (i.e., non-reverting) execution of flashLoan(), assuming the token for which the flashloan is requested uses OpenZeppelin’s Standard ERC20 implementation?
(A): The receiver’s balance of “token” increases
(B): The funds that the FlashLoan contract has approved the receiver to spend has either stayed the same or decreased
(C): The sum of all flashloans granted by the FlashLoan contract is less than the maxFlashLoan amount
(D): The token balance of any contract/user other than the FlashLoan contract, the caller of the flashLoan(), and the “receiver” contract will remain the same as before the call to flashLoan()
- B, because A is definitely not because balance doesn't have to increase. C is not, because maxFlashLoan is not related to sum of all flash loans so far. D is not because onFlashLoan() could be anything, altering other balances as well
- Correct answer: B
- 1 point

# Final score: 4/8
According to https://polygon.nftscan.com/0x5ff36bf09a7dd502ad3aedab418f1c5dfde59c2e?module=NFTs, I would have been on position 38

# Official write-up of solutions:
https://ventral.digital/posts/2023/4/1/race-16-of-the-secureum-bootcamp-epoch-infinity