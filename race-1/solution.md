# My answers:
Q1 Ethereum Virtual Machine is a
 A) Register-based virtual machine
 B) Stack-based virtual machine
 C) Heap-based virtual machine
 D) Stackless virtual machine
- B, because it operates on a stack, pushing and poppint values
- Correct answer: B

Q2 The length of addresses on Ethereum is
 A) 256 bits
 B) 20 bytes
 C) Depends on Externally-Owned-Account or Contract address
 D) Configurable
- B, because it is fixed size, 20 bytes addresses
- Correct answer: B

Q3 The types of accounts on Ethereum are
 A) All Accounts are the same
 B) Permissioned Accounts and Permissionless Accounts
 C) Externally-Owned-Accounts and Contract Accounts
 D) User Accounts and Admin Accounts
- C, because an account is either a contract with balance and bytecode, or an EOA with balance and governing PK
- Correct answer: C

Q4 The difference(s) between Bitcoin and Ethereum is/are
 A) The underlying tokens: Bitcoin vs Ether
 B) Smart contract support
 C) UTXO vs Accounts
 D) Nakamoto Consensus
- A because obvious, B because Ethereum supports smart contracts, C because Bitcoin doesn't have accounts and each transaction is a combination of previous UTXOs, D because consensus mechanisms are different
- Correct answers: A, B, C, because Ethereum used to use Nakamoto Consensus as well

Q5 Ethereum smart contracts do not run into halting problem because
 A) EVM is not Turing Complete
 B) EVM is Turing Complete
 C) EVM is Turing Complete but is bounded by gas sent in transaction
 D) EVM is Turing Complete but is bounded by the stack depth
- C, because that is why gas was introduced, to results in limited execution transactions
- Correct answer: C

Q6 Ethereum nodes talk to each other via
 A) Peer-to-Peer network
 B) Client-Server network
 C) Satellite network
 D) None of the above
- A, because Ethereum is a decentralized, p2p network
- Correct answer: A

Q7 A nonce is present in
 A) Ethereum transaction
 B) Ethereum account
 C) Both A & B
 D) Neither A nor B
- C, because Ethereum accounts have nonces, and transactions also have nonces, which should match the ones in the accounts
- Correct answer: C

Q8 The gas tracking website https://etherscan.io/gastracker says that Low gas cost is 40 wei This affects
 A) The transaction gasPrice
 B) The transaction gasLimit
 C) The transaction value
 D) Both B & C
- A, because increased low gas price would impact the gas price you submit when sending a transaction
- Correct answer: A

Q9 The number of transactions in a Ethereum block depend on
 A) Nothing. It is a constant.
 B) Gas used by transactions
 C) Block gas limit
 D) Block difficulty
- B, C - number of transactions is limited by how much gas can fit in a block, and how much gas each transaction uses
- Correct answers: B, C

Q10 Miners are responsible for setting
 A) Transaction gas price
 B) Block gas limit
 C) Both A & B
 D) Neither A nor B
- D, because A is set by EOA, B is set at protocol level
- Correct answer: B
- I think this was a trick question, as there is a hardcap of 30M gas in the protocol layer, but up to that, I think miners can set a block gas limit <= 15M?

Q11 User A sends transaction T1 from address A1 with gasPrice G1 and later transaction T2 from address A2 with gasPrice G2
 A) T1 will be always included in an earlier block than T2
 B) Inclusion/Ordering of these transactions depends only on gas prices G1 and G2
 C) Inclusion/Ordering of these transactions depends only on network congestion
 D) Inclusion/Ordering of these transactions depends on miners
- B, D, because it depends both on gas prices for honest miners, but also on miners because they can pick and choose which transactions to include
- Correct answer: D. B is wrong because it doesn't only depend on gas prices G1 and G2, but the dependency on gas prices is a result of the dependency on miners

Q12 Which of the following statements is/are true about gas?
 A) Unused gas is returned to the transaction destination account
 B) Gas used by the transaction is credited to the beneficiary address in block header
 C) Unused gas is credited to the beneficiary address in block header
 D) Both A & B
- B, because unused gas is credited back to the EOA that initiated the transaction
- Correct answer: B

Q13 Which of the following EVM components is/are non-volatile across transactions?
 A) Stack
 B) Memory
 C) Storage
 D) Calldata
- C, because all others are erased after each transaction
- Correct answer: C

Q14 Which of the following operation(s) touch(es) storage?
 A) SWAP
 B) SLOAD
 C) DUP
 D) PUSH
- B, because SWAP, DUP and PUSH only work on the stack. SLOAD loads from storage.
- Correct answer: B

Q15 Which of the following statement(s) is/are false?
 A) EVM can get the block number only of the current block
 B) EVM can get the block hash only of the current block
 C) EVM can get the account balance only of the current account
 D) EVM can get the code hash only of the current account
- B, C, D, because EVM can get block hash of any block >= currentblock - 256, account balance of any account, code hash of any account
- Correct answers: B, C, D

Q16 Which of the following information cannot be obtained in the EVM?
 A) Block difficulty
 B) Transaction logs
 C) Balance of an account
 D) Block hash of any block
- B, D. B because logs are only something for off-chain. D because blockhash only returns non-zero when block >= currentblock - 256
- Correct answers: B, D

Q17 Which call instruction could be used to allow modifying the caller account’s state?
 A) CALL
 B) CALLCODE
 C) DELEGATECALL
 D) STATICALL
- C, because delegatecall works in current caller's context
- Correct answers: B, C. 
- Both CALLCODE and DELEGATECALL execute in the context of the caller, so both were correct. Difference is that in DELEGATECALL, msg.sender is EOA, while in CALLCODE, msg.sender becomes the contract that does CALLCODE

Q18 The most gas-expensive operation is
 A) SLOAD
 B) SSTORE
 C) CREATE
 D) SELFDESTRUCT
- C, because creating a contract implies storing a lot of data, more than an SSTORE
- Correct answer: C

Q19 Transaction T1 attempts to write to storage values S1 and S2 of contract C. Transaction T2 attempts to read the same storage values S1 and S2. However, T1 reverts due an exception after writing S1 but before writing S2. Which of the following is/are true?
 A) T2 reads the value of S1 updated by T1
 B) T2 reads the value of S1 prior to T1’s attempted update
 C) T2 also reverts because of the dependency on T1
 D) This scenario is not possible
- B, because transactions are atomic. If T1 reverted, S1 was not updated.
- Correct answer: B

Q20 Ethereum’s threat model is characterised by
 A) Trusted miners and users
 B) Trusted users, untrusted miners
 C) Trusted miners, untrusted users
 D) Everyone is untrusted
- D, because it works without trust in neither users nor miners
- Correct answer: D

Q21 The number of modified Merkle-Patricia trees in an Ethereum block is
 A) One
 B) Three
 C) Three plus number of contract accounts
 D) Three plus number of transactions included in the block
- I did not know here
- Correct answer: C, because of 54 on https://secureum.substack.com/p/ethereum-101

Q22 EVM is not a von Neumann architecture because
 A) It was co-founded by Vitalik Buterin, not John von Neumann
 B) Program instructions are stored separately from data
 C) Program instructions are stored in a ROM not RAM
 D) It is quasi Turing complete
- D, because of intuition
- Correct answer: B

Q23 EVM stores
 A) Most significant byte in the smallest memory address
 B) Most significant byte in the largest memory address
 C) In Big-endian order
 D) In Little-endian order
- D
- Correct answers: A, C, because EVM uses big-endian

Q24 Miners are incentivized to validate and create new blocks by
 A) Block rewards
 B) Altruism
 C) Transaction fees
 D) Their belief in decentralization
- A, C, because they receive both block rewards and tx fees
- Correct answers: A, C

Q25 Hardfork on Ethereum
 A) Has never happened
 B) Happened only once after the DAO attack
 C) Happens with backwards-incompatible protocol changes
 D) Happens when developers and miners disagree on changes
- B, C, D
- Correct answer: C. Because it hasn't only happened once, and C is the root cause, which might be an effect of D

Q26 Gas for EVM opcodes
 A) Is constant and the same for all opcodes
 B) May be changed over time to prevent DoS attacks
 C) Depend on the gas price
 D) Depend on the miners
- B, because all others are 100% false
- Correct answer: B

Q27 Smart contracts on Ethereum
 A) May be deployed by anyone
 B) May be deployed only through the DApp store
 C) May have some form of access control
 D) Are guaranteed to be secure
- A, C, because anyone can deploy, with/without coding access control
- Correct answers: A, C

Q28 EVM opcodes
 A) Are multi-byte instructions
 B) Are single byte instructions
 C) Take operands in registers
 D) Take operands on stack
- A, D, because PUSH works with multiple bytes and operands are always on stack
- Correct answers: B, D. The question was if opcodes are single bytes, not if they work with single bytes, and yes, they are single bytes.

Q29 Security of Ethereum DApps depend on
 A) Security of their smart contracts
 B) Security of their off-chain components
 C) Security of Ethereum
 D) None of the above
- A, B, C, because any of them being hacked can hack the on-chain code
- Correct answers: A, B, C

Q30 Security Audits for smart contracts are performed because
 A) They are required for listing DApp on the DApp store
 B) They are required for deployment on Ethereum
 C) They help remove vulnerabilities and reduce risk
 D) They are required by exchanges to list tokens
- C, to incrase security
- Correct answer: C

Q31 The high-level languages typically used for writing Ethereum smart contracts are
 A) Go
 B) C++
 C) Vyper
 D) Solidity
- C, D
- Correct answers: C, D

Q32 The number of decimals in Ether is
 A) 0
 B) 1
 C) 18
 D) Configurable
- C
- Correct answer: C

# Final score: 25/32 questions - note I didn't know there was a time limit

# Official write-up of solutions:
https://ventral.digital/posts/2021/10/17/secureum-bootcamp-ethereum-101-quiz