# My answers: 
[Q1] InSecureum implements
(A): Atypical decimals value
(B): Non-standard decreaseAllowance and increaseAllowance
(C): Non-standard transfer
(D): None of the 
- A, B, C 
- A because decimals is 8, instead of the usual 18
- B because:
    - decreaseAllowance checks for >, instead of >=: ```require(currentAllowance > subtractedValue, "ERC20: decreased allowance below zero");```
    - increaseAllowance is standard, but _approve function is different
- C because it misses the _beforeTokenTransfer and _afterTokenTransfer hooks
- Correct answers: A, B - I think the question was misleading. _transfer function does not have the standard implementation
- 0.5 points in worst case


[Q2] In InSecureum
(A): decimals() can have pure state mutability instead of view
(B): _burn() can have external visibility instead of internal
(C): _mint() should have internal visibility instead of external
(D): None of the above
- A, C
- A because it returns a hardcoded value of 8 set at compile-time, doesn't read any smart contract state
- C because one shouldn't be able to mint whenever, it should be an internal function only accessible through external endpoints, allowed to be called only by admins or so on
- Correct answers: A, C
- 1 point

[Q3] InSecureum transferFrom()
(A): Is susceptible to an integer underflow
(B): Has an incorrect allowance check
(C): Has an optimisation indicative of unlimited approvals
(D): None of the above
- A, B, C
- A because ```currentAllowance - amount``` is unchecked
- B because allowance is taken from ```_allowances[_msgSender()][sender]```, not ```_allowances[sender][_msgSender()]``` 
- C because ```if (currentAllowance != type(uint256).max)``` indicates unlimited approval and wouldn't update other storage slots, so optimization
- Correct answers: A, B, C
- 1 point

[Q4] In InSecureum
(A): increaseAllowance is susceptible to an integer overflow
(B): decreaseAllowance is susceptible to an integer overflow
(C): decreaseAllowance does not allow reducing allowance to zero
(D): decreaseAllowance can be optimised with unchecked{}
- A, C
- A because increaseAllowance can be made to overflow, and the transaction will revert
- C because ```require(currentAllowance > subtractedValue, "ERC20: decreased allowance below zero");```
- Correct answers: C, D. For A I think it was an incorrect understanding of wording, I chose A because an overflow can happen but will revert, I think they meant that overflow can't happen because of the revert. decreaseAllowance could have been optimized with unchecked
- 0.5 points

[Q5] InSecureum _transfer()
(A): Is missing a zero-address validation
(B): Is susceptible to an integer overflow
(C): Is susceptible to an integer underflow
(D): None of the above
- D, because none of the others apply
- 1 point

[Q6] InSecureum _mint()
(A): Is missing a zero-address validation
(B): Has an incorrect event emission
(C): Has an incorrect update of account balance
(D): None of the above
- A, C
- A because there is no check that account is not address(0)
- C because ``` _balances[account] = amount;``` does = instead of +=
- Correct answers: A, C
- 1 point

[Q7] InSecureum _burn()
(A): Is missing a zero-address validation
(B): Has an incorrect event emission
(C): Has an incorrect update of account balance
(D): None of the above
- B, because it should be ```emit Transfer(account, address(0), amount);```
- 1 point

[Q8] InSecureum _approve()
(A): Is missing a zero-address validation
(B): Has incorrect error messages
(C): Has an incorrect update of allowance
(D): None of the above
- B, C
- B, because error messages here should be reversed: 
```
require(spender != address(0), "ERC20: approve from the zero address");
require(owner != address(0), "ERC20: approve to the zero address");
```
- C, because ```_allowances[owner][spender] += amount;``` should use = instead of +=

# Final score: 7/8 points
According to https://polygon.nftscan.com/0x5ff36bf09a7dd502ad3aedab418f1c5dfde59c2e?module=NFTs, I would have been on position 12

# Official write-up of solutions:
https://ventral.digital/posts/2022/2/9/secureum-bootcamp-february-race-4