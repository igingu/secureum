# Slot 1 - Ethereum101

### Topics


#### [Article on "Ethereum 101"](https://secureum.substack.com/p/ethereum-101)

---

### Assignment

1.  Read the Ethereum whitepaper: [https://ethereum.org/en/whitepaper/](https://ethereum.org/en/whitepaper/)
2.  Read the Ethereum yellow paper: [https://ethereum.github.io/yellowpaper/paper.pdf](https://ethereum.github.io/yellowpaper/paper.pdf)
3.  Read Chapters 1, 2, 3, 4, 6, 13 and 14 from “Mastering Ethereum”: [https://github.com/ethereumbook/ethereumbook](https://github.com/ethereumbook/ethereumbook) and other references in Secureum’s “Ethereum 101” article
4.  Browse through topics at [https://ethereum.org/en/developers/docs/](https://ethereum.org/en/developers/docs/)
5.  Explore blocks, transactions and other protocol internals at [https://etherscan.io/](https://etherscan.io/)

---

### Quiz

- [Slot 1 quiz](quizzes/1.%20Ethereum%20101.md)

### Quiz Writeups

- [https://ventral.digital/posts/2021/10/17/secureum-bootcamp-ethereum-101-quiz](https://ventral.digital/posts/2021/10/17/secureum-bootcamp-ethereum-101-quiz)

---
## My notes 
### https://medium.com/@VitalikButerin/the-meaning-of-decentralization-a0c92b76a274
3 types of decentralization:
- architectural (how many physical computers is a system made up of; how many can it tolerate breaking down at the same time;)
- political (how many individuals/organizations control those computers)
- logical (are the interfaces and data structures of the system more like a single monolith, or an amorphous swarm?; if you cut the system in half, including both providers and users, would the two systems continue working as independent units?)

Blockchains are politically decentralized (no one controls them) and architecturally decentralized (no infrastructural central point of failure) but they are logically centralized (there is one commonly agreed state and the system behaves like a single computer)

### Blocks
Blocks are batches of transactions with a hash of the previous block in the chain. This links blocks together (in a chain) because hashes are cryptographically derived from the block data. This prevents fraud, because one change in any block in history would invalidate all the following blocks as all subsequent hashes would change and everyone running the blockchain would notice. To preserve the transaction history, **blocks are strictly ordered (every new block created contains a reference to its parent block)**, and **transactions within blocks are strictly ordered as well**. (See [here](https://ethereum.org/en/developers/docs/blocks/))

Blocks are not fixed size in terms of number of transactions in them, but in terms of maximum amount of gas spent by all transactions in the block.

### Consensus
Decentralized consensus in the context of Ethereum refers to the process of determining which miner’s block should be appended next to the blockchain. This involves two key components of Proof-of-Work (PoW) and the Longest-chain Rule. Miners apply these rules to build on the canonical blockchain. This is referred to as "Nakamoto Consensus” and is adapted from Bitcoin.

### Block composition
Blocks contain block header, transactions and ommers’ block headers. Block header contains (See here):
- parentHash: The Keccak 256-bit hash of the parent block’s header, in its entirety
- ommersHash: The Keccak 256-bit hash of the ommers list portion of this block
- beneficiary: The 160-bit address to which all fees collected from the successful mining of this block be transferred
- stateRoot: The Keccak 256-bit hash of the root node of the state trie, after all transactions are executed and finalisations applied
- transactionsRoot: The Keccak 256-bit hash of the root node of the trie structure populated with each transaction in the transactions list portion of the block
- receiptsRoot: The Keccak 256-bit hash of the root node of the trie structure populated with the receipts of each transaction in the transactions list portion of the block
- logsBloom: The Bloom filter composed from indexable information (logger address and log topics) contained in each log entry from the receipt of each transaction in the transactions list
- difficulty: A scalar value corresponding to the difficulty level of this block. This can be calculated from the previous block’s difficulty level and the timestamp
- number: A scalar value equal to the number of ancestor blocks. The genesis block has a number of zero; 
- gasLimit: A scalar value equal to the current limit of gas expenditure per block
- gasUsed: A scalar value equal to the total gas used in transactions in this block
- timestamp: A scalar value equal to the reasonable output of Unix’s time() at this block’s inception
- extraData: An arbitrary byte array containing data relevant to this block. This must be 32 bytes or fewer
- mixHash: A 256-bit hash which, combined with the nonce, proves that a sufficient amount of computation has been carried out on this block
- nonce: A 64-bit value which, combined with the mixhash, proves that a sufficient amount of computation has been carried out on this block

### stateRoot, transactionsRoot and receiptsRoot
stateRoot, transactionsRoot and receiptsRoot are 256-bit hashes of the root nodes of modified Merkle-Patricia trees. The leaves of stateRoot are key-value pairs of all Ethereum address-account pairs, where each respective account consists of:
- nonce: A scalar value equal to the number of transactions sent from this address or, in the case of accounts with associated code, the number of contract-creations made by this account
- balance: A scalar value equal to the number of Wei owned by this address
- storageRoot: A 256-bit hash of the root node of a modified Merkle-Patricia tree that encodes the storage contents of the account (a mapping between 256-bit integer values), encoded into the trie as a mapping from the Keccak 256-bit hash of the 256-bit integer keys to the RLP-encoded 256-bit integer values.
- codeHash: The hash of the EVM code of this account—this is the code that gets executed should this address receive a message call; it is immutable and thus, unlike all other fields, cannot be changed after construction.

### Transaction receipt
Transaction receipt is a tuple of four items comprising: 
- The cumulative gas used in the block containing the transaction receipt as of immediately after the transaction has happened
- The set of logs created through execution of the transaction
- The Bloom filter composed from information in those logs
- The status code of the transaction

### quasi Turing complete
EVM is a quasi Turing complete machine where the quasi qualification comes from the fact that the computation is intrinsically bounded through a parameter, gas, which limits the total amount of computation done. EVM is the runtime environment for smart contracts.

### Stack - and "stack too deep" provenance
Stack is made up of 1024 256-bit elements. EVM instructions can operate with the top 16 stack elements. Most EVM instructions operate with the stack (stack-based architecture) and there are also stack-specific operations e.g. PUSH, POP, SWAP, DUP etc.
