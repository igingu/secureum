# My answers
Q1 Solidity language is
 A) Statically typed
 B) Object-oriented
 C) Supports inheritance
 D) Supports inline assembly
- A, B, C, D
- Correct answers: A, B, C, D
- 1 point

Q2 Which of the following is/are correct?
 A) A Solidity file with pragma solidity ^0.6.5; can be compiled with compiler version 0.6.6

 B) A Solidity file with pragma solidity 0.6.5; can only be compiled with compiler version 0.6.5

 C) A Solidity file with pragma solidity ^0.6.5; can be compiled with compiler version 0.7.0

 D) A Solidity file with pragma solidity >0.6.5 <0.7.0; can be compiled with compiler version 0.7.0
- A, B
- Correct answers: A, B
- 1 point

Q3 Which of the following is/are true?
 A) Constant state variables can be initialized within a constructor
 B) Immutable state variables are allocated a storage slot
 C) Gas costs for constant and immutable variables is lower
 D) Only value types can be immutable
- A, C, D
- Correct answers: C, D. A is not because ```For constant variables, the value has to be a constant at compile time and it has to be assigned where the variable is declared.```
- During contest I would have put C/D, so 1 point

Q4 Solidity functions
 A) Can be declared only inside contracts
 B) Can have named return variables
 C) Can have unnamed parameters
 D) Can be recursive
- A, B, C, D
- Correct answers: B, C, D, because Solidity can have free functions, not declared inside contracts
- During contest I would have put B/C/D, so 1 point

Q5 Function visibility
 A) Goes from private-internal-external-public in decreasing restrictive order (i.e. private being the most restrictive)
 B) Goes from internal-private-external-public in decreasing restrictive order (i.e. internal being the most restrictive)
 C) May be omitted to default to internal in the latest 0.8.0+ compiler versions
 D) None of the above
- A
- Correct answer: A
- 1 point

Q6 Function foo() uses block.number. Which of the following is/are always true about foo()?
 A) It should be marked as pure
 B) It should be marked as view
 C) It should be marked as payable
 D) Cannot determine mutability based only on this information
- D
- 1 point

Q7 Which of the following is/are true about events?
 A) Events are meant for off-chain applications
 B) Events can be accessed only by the emitting contract
 C) Indexing event parameters creates searchable topics
 D) A maximum of three events can have indexed parameters
- A, C
- 1 point

Q8 A contract can receive Ether via
 A) msg.value to payable functions
 B) selfdestruct destination
 C) coinbase transaction
 D) receive() or fallback() functions
- A, B
- Correct answers: C, D as well, because you can put smart contract address as coinbase beneficiary, and receive and fallback can be made payable
- 0.5 points

Q9 receive() and fallback() functions
 A) Can rely only on 2300 gas in the worst case
 B) May receive Ether with payable mutability
 C) Are mandatory for all contracts
 D) Must have external visibility
- B, D
- Correct answers: A, B, D
- 0.66 points

Q10 Which of the below are value types?
 A) Address
 B) Enum
 C) Struct
 D) Contract
- A, B, D
- 1 point

Q11 The default value of
 A) Bool is false
 B) Address is 0
 C) Statically-sized array depends on the underlying type
 D) Enum is its first member
- A, B, D
- Correct answers, A, B, D and C, because each value in statically sized array is defaulted differently based on the type
- 0.75 points

Q12 Address types
 A) Can always receive Ether
 B) Have members for balance, call, code
 C) Can be converted to uint160 or contract types
 D) Can be added and subtracted
- B, C
- 1 point

Q13 transfer and send primitives
 A) Are used for Ether transfers
 B) Trigger the receive() or fallback() functions of address
 C) Always return a value to be checked
 D) Provide only 2300 gas
- A, C, D
- Correct answers: A, B, D
- 0.66 points

Q14 Which of the following is/are true for call/delegatecall/staticcall primitives?
 A) They are used to call contracts
 B) They only revert without returning success/failure
 C) Delegatecall retains the msg.sender and msg.value of caller contract
 D) Staticcall reverts if the called contract reads contract state of caller
- A, C
- 1 points

Q15 If we have an array then its data location can be
 A) memory and its persistence/scope will be the function of declaration
 B) storage and its persistence/scope will be the entire contract
 C) calldata and it will only be readable
 D) None of the above
- A, B, C
- 1 point

Q16 The impact of data location of reference types on assignments is
 A) storage assigned to storage (local variable) makes a copy
 B) memory assigned to memory makes a copy
 C) memory assigned to storage creates a reference
 D) None of the above
- B
- Correct answer: D
- 1 point

Q17 Which of the following is/are valid control structure(s) in Solidity (excluding YUL)?
 A) if
 B) else
 C) elif
 D) switch
- A, B, D
- Correct answer: A, B
- During contest I would have put A, B, so 1 point

Q18 The gas left in the current transaction can be obtained with
 A) tx.gas()
 B) gasleft()
 C) msg.gas()
 D) block.gaslimit()
- B
- 1 point

Q19 Which of the following is/are valid function specifier(s)?
 A) internal
 B) pure
 C) payable
 D) immutable
- A, B, C
- 1 point

Q20 Integer overflows/underflows in Solidity
 A) Are never possible because of the language design
 B) Are possible but prevented by compiler added checks (version dependent)
 C) Are possible but prevented by correctly using certain safe math libraries
 D) Are possible without any mitigation whatsoever
- B
- Correct answers: B and C. I didn't put C because SafeMath is no longer needed now
- 0.5 points

Q21 Arrays in Solidity
 A) Can be fixed size or dynamic
 B) Are zero indexed
 C) Have push, pop and length members
 D) None of the above
- A, B, C
- 1 point

Q22 Structs in Solidity
 A) Are user-defined type
 B) Are reference type
 C) Can contain or be contained in arrays and mappings
 D) None of the above
- A, B, C
- 1 point

Q23 Which of the following is true about mapping types in mapping(_KeyType => _ValueType)?
 A) _KeyType can be any value or reference type
 B) _ValueType can be any value or reference type
 C) Can only have storage (not memory) as data location
 D) Can be iterated over natively (i.e. without implementing another data structure)
- B, C
- 1 point

Q24 if a = 1 then which of the following is/are true?
 A) a += 1 makes the value of a = 2
 B) b = ++a makes the value of b = 1
 C) a -= 1 makes the value of a = 1
 D) b = a-- makes the value of b = 1
- A, D
- 1 point

Q25 delete varName; has which of the following effects?
 A) varName becomes 0 if varName is an integer
 B) varName becomes true if varName is a boolean
 C) No effect if varName is a mapping
 D) Resets all struct members to their default values irrespective of their types
- A, D
- Correct answers: A, C, because delete mapping doesn't delete entries in the mapping
- 0.5 points

Q26 Conversions in Solidity have the following behavior
 A) Implicit conversions are never allowed
 B) Explicit conversion of uint16 to uint8 removes higher-order bits
 C) Explicit conversion of uint16 to uint32 adds lower-order padding
 D) Explicit conversions are checked by compiler for safety
- B, D
- Correct answer: B. Explicit conversion bypasses security features of the compiler, doesn't make them less restrictive
- 0 points

Q27 If the previous block number was 1000 on Ethereum mainnet, which of the following is/are true?
 A) block.number is 1001
 B) blockhash(1) returns 0
 C) block.chainID returns 1
 D) block.timestamp returns the number of seconds since last block
- A, C
- Correcgt answer: B as well, because blockhash takes as parameter the blocknumber, not the offset, and returns 0 for blocknumber >= currentBlock - 256
- 0.66 points

Q28 User from EOA A calls Contract C1 which makes an external call (CALL opcode) to Contract C2. Which of the following is/are true?
 A) tx.origin in C2 returns A’s address
 B) msg.sender in C2 returns A’s address
 C) msg.sender in C1 returns A’s address
 D) msg.value in C2 returns amount of Wei sent from A
- A, C, D
- Correct answers: A, C
- 0.5 points

Q29 For error handling
 A) require() is meant to be used for input validation
 B) require() has a mandatory error message string
 C) assert() is meant to be used to check invariants
 D) revert() will abort and revert state changes
- A, C, D
- 1 point

Q30 The following is/are true about ecrecover primitive
 A) Takes a message hash and ECDSA signature values as inputs
 B) Recovers and returns the public key of the signature
 C) Is susceptible to malleable signatures
 D) None of the above
- A, C
- 1 point

Q31 When Contract A attempts to make a delegatecall to Contract B but a prior transaction to Contract B has executed a selfdestruct
 A) The delegatecall reverts
 B) The delegatecall returns a failure
 C) The delegatecall returns a success
 D) This scenario is not practically possible
- C
- 1 point

Q32 In Solidity, selfdestruct(address)
 A) Destroys the contract whose address is given as argument
 B) Destroys the contract executing the selfdestruct
 C) Sends address’s balance to the calling contract
 D) Sends executing contract’s balance to the address
- B, D
- 1 point

# Final score: 27.7/32 - finished in 12 minutes

# Official write-up of solutions:
https://ventral.digital/posts/2021/10/24/secureum-bootcamp-solidity-101-quiz