# My answers
Q1 Which of the following is/are true about abstract contracts and interfaces?
 A) Abstract contracts have at least one function undefined
 B) Interfaces can have some functions defined
 C) Unimplemented functions in abstract contracts need to be declared virtual
 D) All functions are implicitly virtual in interfaces
- A, C, D
- 1 point

Q2 Libraries are contracts
 A) That cannot have state variables
 B) That cannot be inherited
 C) That always require a delegatecall
 D) That are not meant to receive Ether
- D
- Corrent answer: A, B, D
- 0.33 points

Q3 Storage layout
 A) Refers to the layout of state variables in storage
 B) Is organized in 256-byte slots
 C) Is packed for value types that use less than 32 bytes
 D) Always starts on a new slot for reference types
- A, C, D
- 1 point

Q4 For contract A {uint256 i; bool b1; bool b2; address a1;} the number of storage slots used is
 A) 4
 B) 3
 C) 2
 D) 1
- C
- 1 point

Q5 Which of the following is/are generally true about storage layouts?
 A) The number of slots used for a contract depends on the ordering of state variable declarations
 B) The slots for struct elements are consecutive
 C) The slot s for dynamic array contains the length with individual elements stored consecutively in slots starting at keccak256(s)
 D) The slot s for mapping is empty with individual values stored consecutively in slots starting at keccak(h(k).s), where k is the first key and h is a hash function that depends on type of k
- A, B, C, D
- Correct answers: A, B, C
- 1 point

Q6 EVM memory
 A) Is linear and byte-addressable
 B) Is reserved by Solidity until 0x7f
 C) Can be accessed in bytes using MLOAD8/MSTORE8
 D) Is non-volatile or persistent
- A, B
- 1 point

Q7 EVM inline assembly has
 A) Its own language called Yul
 B) Safety checks just like Solidity
 C) Access to all variables in the contract and function where present
 D) References to variables as their addresses not values
- A, D
- Correct answers: A, C, D
- 0.66 points

Q8 Zero address check is typically recommended because
 A) The use of zero address for transfers will trigger an EVM exception
 B) Ether/tokens sent to zero address will be inaccessible
 C) Ether/tokens sent to zero address can be accessed by anyone
 D) Address 0 is the Ethereum Masternode account and is forbidden for access
- B
- 1 point

Q9 ERC20 transferFrom(address sender, address recipient, uint256 amount) (that follows the ERC20 spec strictly)
 A) Transfers token amount from sender to recipient
 B) sender must have given caller (msg.sender) approval for at least amount or more
 C) Deducts amount from sender’s allowance
 D) Deducts amount from caller’s (msg.sender’s) allowance
- A, B, D
- 1 point

Q10 OpenZeppelin SafeERC20 is generally considered safer to use than ERC20 because
 A) It adds integer overflow/underflow checks
 B) It adds return value/data checks
 C) It adds pause/unpause capability
 D) It adds race-condition checks
- B
- 1 point

Q11 OpenZeppelin ERC20Pausable
 A) Adds ability to pause token transfers
 B) Adds ability to pause token minting and burning
 C) Provides modifiers whenPaused and whenNotPaused
 D) None of the above
- A, B, C
- Correct answers: A, B, but C is also correct, also modifiers come from Pausable not ERC20Pausable, but ERC20Pausable inherits Pausable
- 0 points

Q12 OpenZeppelin ERC721
 A) Implements the NFT standard
 B) safeTransferFrom(..) checks for zero-addresses
 C) approve(..) is susceptible to race-condition just like ERC20
 D) setApprovalForAll(address operator, bool _approved) approves/removes operator for all of caller’s tokens
- A, B, D
- 1 point

Q13 ERC777 may be considered as an improved version of ERC20 because
 A) Hooks allow reacting to token mint/burn/transfer
 B) It can help avoid separate approve and transferFrom transactions
 C) It can help prevent tokens getting stuck in contracts
 D) It removes reentrancy risk
- A, C
- Correct answers: A, B, C. B because by transfering funds to contract A, A can already respond to them in an atomic transaction.
- 0.66 points

Q14 The OpenZeppelin library that provides onlyOwner modifier
 A) Is Ownable
 B) Provides role based access control
 C) Provides a function to renounce ownership
 D) None of the above
- A, C
- 1 point

Q15 OpenZeppelin’s (role-based) AccessControl library
 A) Provides support only for two specific roles: Owner and User
 B) Provides support for different roles with different authorization levels
 C) Provides support for granting and revoking roles
 D) None the above
- B, C
- 1 point

Q16 If OpenZeppelin’s isContract(address) returns false for an address then
 A) Address is guaranteed to not be a contract
 B) Codesize at address is 0 at time of invocation
 C) Both A & B
 D) Neither A nor B
- B
- 1 point

Q17 CREATE2
 A) Deploys two contracts proxy and implementation concurrently
 B) Deploys contract at an address that can be predetermined
 C) Uses a salt and contract creationCode
 D) None of the above
- B, C
- 1 point

Q18 OpenZeppelin ECDSA
 A) Implements functions for signature creation & verification
 B) Is susceptible to signature malleability
 C) Both A & B
 D) Neither A nor B
- C
- Correct answer: D
- 0 points

Q19 OpenZeppelin SafeMath
 A) Prevents integer overflows/underflows at compile-time
 B) Is not required if using Solidity compiler version >= 0.8.0
 C) Both A & B
 D) Neither A nor B
- B
- 1 point

Q20 OpenZeppelin’s proxy implementations
 A) Typically have a proxy contract and an implementation contract
 B) Use delegatecall's from proxy to implementation
 C) Cannot support upgradeable proxies
 D) None of the above
- A, B
- 1 point

Q21 Proxied contracts
 A) Should use constructors in implementation contract to initialize the proxy’s state variables
 B) Should use an external/public initialize() function
 C) Should have their initialize() function called only once
 D) All of the above
- B, C
- 1 point

Q22 Dappsys provides
 A) A proxy implementation
 B) A floating-point implementation with wad & ray
 C) A flexible authorization implementation
 D) All of the above
- D
- Correct answers: A, C
- 0 points

Q23 WETH is
 A) An ERC20 pre-compile for Wrapped Ether built into Ethereum protocol
 B) Warp Ether for super-fast Ether transfers
 C) Wrapped Ether to convert Ether into an ERC721 NFT
 D) None of the above
- D
- 1 point

Q24 Name collision error with inheritance happens when the following pairs have the same name within a contract
 A) Function & modifier
 B) Function & event
 C) Function & function
 D) Event & modifier
- C
- Correct answers: A, B, C
- 0.3 points

Q25 Which of the following is/are not allowed?
 A) Function overriding
 B) Function overloading
 C) Modifier overloading
 D) Modifier overriding
- D
- Correct answer: C
- 0 points

Q26 Solidity supports
 A) Multiple inheritance
 B) Polymorphism
 C) Contract overloading
 D) Function overloading
- A, B, D
- 1 point

Q27 Which of the following EVM instruction(s) do(es) not touch EVM storage?
 A) SLOAD
 B) MSTORE8
 C) SSTORE
 D) SWAP
- C, D
- Correct answer: B, D
- 0.5 points

Q28 Which of the following is/are true about Solidity compiler 0.8.0?
 A) ABI coder v2 is made the default
 B) No opt-out primitives for default checked arithmetic
 C) Failing assert returns the gas left instead of consuming all gas
 D) Exponentiation is made right associative
- A
- Correct answers: A, C, D
- 0.3 points

Q29 OpenZeppelin SafeCast
 A) Prevents underflows while downcasting
 B) Prevents overflows while downcasting
 C) Prevents underflows while upcasting
 D) Prevents overflows while upcasting
- B
- 1 point

Q30 OpenZeppelin’s ReentrancyGuard library mitigates reentrancy risk in a contract
 A) For all its functions by simply deriving/inheriting from it
 B) Only for functions that apply the nonReentrant modifier
 C) By enforcing a checks-effects-interactions pattern in its functions
 D) None of the above
- B
- 1 point

Q31 Assuming all contracts C1, C2 and C3 define explicit constructors in contract C1 is C2, C3 {…} and both C2 and C3 don’t inherit contracts, the number & order of constructor(s) executed is/are
 A) One, that of C1
 B) Three, in the order C2, C3, C1
 C) One, that of C3
 D) Three, in the order C1, C2, C3
 - B
 - 1 point

Q32 Which of the following is/are true for a function f that has a modifier m?
 A) Function f cannot have another modifier because every function can have at most one modifier
 B) Function f's code is inlined at the point of _ within modifier m
 C) Function f reverts if _ is not executed in the modifier m
 D) None of the above
- B
- 1 point

# Final score: 24.8/32 - finished in 12 minutes

# Official write-up of solutions:
https://ventral.digital/posts/2021/10/30/secureum-bootcamp-solidity-201-quiz