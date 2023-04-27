# My answers
[Q1] Lending platforms have a few options to configure when it comes to adding new tokens as collateral. For example, you’ll have to set up an oracle for the price of the collateral, and you have to configure a margin requirement. The security concern with using the given collateral configuration is:
(A): The periodic fee parameter is static
(B): The collateral ratio of loans is too low
(C): USDC should not be used as collateral for loans
(D): None of the above
- D, because I thought none applied
- Correct answer: B, although I didn't quite understand why
- 0 points


[Q2] Assuming payFees() is periodically called by a function, which iteratively calls payFees() of all collateral contracts, the security concern(s) is/are:
(A): Collateral tokens can define their own fee rewards and have the protocol pay too much fees
(B): There could be many lenders
(C): payFees() might re-enter the contract, paying all fees again
(D): You can deposit at any point during the period
- B, because many lenders would DoS
- Correct answers: B, D. D as well because the contract doesn't have any state to record for how much time users have kept funds for borrowing, so payFees could be sandwiched just to receive fees.
- 0.5 points

modifier noETH {
  require(balanceOf(this) == 0);
  _;
}

[Q3] The developers want to prevent people from accidentally sending ETH instead of WETH and have implemented a noETH modifier, as defined above, and annotated the deposit function with it. They have also not implemented a receive function. Which of the following statements is true?
(A): Developers can either use the modifier or achieve the same effect by omitting the payable keyword on deposit function
(B): Developers should use the modifier because it achieves a different effect from omitting the payable keyword on deposit function
(C): Developers should remove the modifier but achieve the required effect by omitting the payable keyword on deposit function
(D): None of the above
- A, C, because I didn't read the modifier correctly: it wasn't about msg.value == 0, but balanceOf(this) == 0.
- Correct answers: C
- 0 points

modifier checkedPool{
  address pool;
  assembly { 
let size := calldatasize()
      pool := calldataload(sub(size, 32))
  }
  require(isValid(pool));
  _;
}

function isValid(pool) internal {...}
function somePoolOperation(...., address pool) public checkedPool { ... }
function anotherPoolOperation(...., address pool) public checkedPool { ... }

[Q4] Developers have used assembly to make their code a bit less repetitive. They use it to annotate a bunch of functions that have as their last argument a pool address. Unfortunately they made a mistake. Which of the following options fixes the bug?
(A): Replace the modifier with require(isValid(pool)); in every function with the modifier
(B): Make all functions using checkedPool external
(C): Everything is fine; this code has no problems
(D): None of the above
- C
- Correct answer: A, because: A caller can send more data than defined in the function's signature and the ABI decoding would work just fine while ignoring the extra data.
- 0 points

[Q5] The lending protocol has also built in a liquidation function to be called in the case of under-collateralization. Anyone can call the function and be rewarded for calling it by taking a small percentage of the liquidation. The liquidation function has a vulnerability  which can be exploited because: 
(A): The lender can open a position with a low amount of collateral and the fee payout reverts
(B): The lender can make the position “unliquidatable” with reentrancy
(C): The lender can liquidate other positions with his callback and make more money
(D): The liquidator can take the full collateral amount with reentrancy
- B, because I considered that lender could intentionally revert in ```address(lender).call(abi.encodePacked(Lender.onLiquidation.selector));```. I was luckily right, because even if they reverted, call would just return false which wouldn't revert this transaction. Correct explanation is in write-up
- Correct answer: B
- 1 point

[Q6] Assume that the vulnerability referenced in the previous question has been fixed by changing the line with the Liquidation event emission to emit Liquidation(lender, oldDeposit). The protocol team has built a bot that monitors and liquidates under-collateralized positions automatically. Even though the bot does not monitor the mempool, it simulates the full transaction and, if successful, sends transactions with the exact amount to be able to execute the function + 100000 gas for minimal execution in the onLiquidation() callback. Which of these attacks can be executed in a harmful way towards the protocol? 
(A): An attacker can liquidate positions, reenter the contract and steal tokens
(B): The liquidated lender can monitor the mempool and frontrun the protocol bot with a deposit, griefing it
(C): The lender can make their position “unliquidatable” by consuming all the gas provided in the callback
(D): The liquidated lender can tokenize the extra gas in the callback and make a profit
- D, I guessed
- Correct answer: B, read in write-up
- 0 points

[Q7] In the context of Questions 5 and 6, someone built a MEV frontrunner bot that is exploiting liquidations in different protocols. It monitors the mempool for collateral contracts deployed from the lending factory and simulates transactions in a mainnet fork within Foundry to check whether it should attack them. The logic behind the bot is that it checks only the token’s “Transfer” events for its success conditions. More precisely, it checks if there is liquidity in an AMM to exchange to ETH and make sure it turns a profit at the end. If so, it sends a Flashbot bundle to make a profit by frontrunning the liquidator. Knowing the factory for this new contract is permissionless, how could you extract assets out of this bot? 
(A): Open a position with a low collateral amount to grief the bot
(B): Build a similar bot that frontruns this one
(C): Deploy a collateral contract with your own custom token and seed an AMM pool with some ETH and this token, tricking the bot
(D): There is no way to do it 
- A, I guessed
- Correct answer: C, was referring to the salmonella attack, read write-up
- 0 points

[Q8] The protocol implemented a function to transfer collateral from lender A to lender B with a signature from A, as shown above. Is there a way you can break it?
(A): Lender B can get more than the intended amount from lender A (assuming there is more than double the amount in A’s account)
(B): Lender A can pretend to transfer to lender B but then steal amount from him
(C): Lender A can grief lender B by sending a malformed signature (assuming the S parameter is correct)
(D): Lender B can steal from another lender C, by submitting a malformed signature.
- B
- Correct answer: A, because of replaying the signature
- 0 points

# Final score: 1.5/8 points
According to https://polygon.nftscan.com/0x5ff36bf09a7dd502ad3aedab418f1c5dfde59c2e?module=NFTs, I would have been on position 151-162

# Official write-up of solutions:
https://ventral.digital/posts/2023/1/30/race-14-of-the-secureum-bootcamp-epoch-infinity