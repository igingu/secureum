# My answers
Select all true statements:
A.
The inline assembly block is memory-safe
B.
The memory after toString(...) call is always 32-byte aligned
C.
Instead of allocating memory from 0x40, the function can allocate from 0x0 to save gas (memory expansion cost) and still be correct
D.
None of the above
Not A, because of: "In particular, a memory-safe assembly block may only access the following memory ranges:
Temporary memory that is located after the value of the free memory pointer at the beginning of the assembly block, i.e. memory that is “allocated” at the free memory pointer without updating the free memory pointer."
Not B because str := add(str, k).
Not C because following code might need the scratch space.
D
- Correct answer: A
- 0 points

Select all true statements about the expression mstore(0x40, add(str, 128)):
A.
The expression allocated more memory than required. The value 128 can be replaced by 96.
B.
The expression allocates less memory than required. The value 128 can be replaced by 160.
C.
The expression is redundant and can be removed to save gas
D.
The expression is not ‘memory-safe’ assembly in this context
Not A, B and C because this is an audited library.
D
- Correct answer: B
- 0 points

Select all true statements:
A.
The expression mstore(str, k) at the beginning can be removed to save gas
B.
The expression mstore(add(str, k), char) can be replaced by an equivalent mstore8(...) to simplify the code
C.
The final expression mstore(str, sub(78, k)) can be removed to save gas
D.
The function does not return the correct output for n = 2**256 - 1
Not B because I don't think they are equivalent, not C because I need to store the correct length of the string.
A, D
- Correct answers: A, B
- 0.5 points

Select all true statements:
A.
The function correctly cleans all necessary memory regions
B.
Solidity will correctly be able to handle the string returned by the function
C.
The last bits of memory in the string may be dirty
D.
None of the above
Not C because I couldn't find a way to have them dirty
A, B
- Correct answers: B, C
- 0.5 points

Select all true statements:
A.
The re-entrancy lock is always unnecessary as it’s never possible to re-enter the contract
B.
Calls to _delegate are correctly protected for re-entrancy
C.
The re-entrancy lock is correctly unlocked in some cases
D.
The re-entrancy lock is correctly unlocked in all cases
Not A because of storage collision, not B because of the same reason, D because it will always be unlocked right.
D
- Correct answer: C
- 0 points

Select all true statements:
A.
The assembly block is correctly marked as ‘memory-safe’
B.
The assembly block will always violate the memory requirements needed for memory-safe blocks
C.
In some cases, the assembly block will not violate the requirement needed for memory-safe blocks
D.
None of the above
C, because of https://docs.soliditylang.org/en/latest/assembly.html. "As an example, the following assembly snippet is not memory safe, because the value of returndatasize() may exceed the 64 byte scratch space:"
C
1 point

Select all true statements:
A.
The expression calldatacopy(0, 0, calldatasize()) violates memory-safe assembly annotation
B.
The expression returndatacopy(0, 0, returndatasize()) violates memory-safe assembly annotation
C.
The expression delegatecall(gas(), implementation, 0, calldatasize(), 0, 0) violates memory-safe assembly annotation
D.
The expression return(0, returndatasize()) violates memory-safe assembly annotation
E.
The expression revert(0, returndatasize()) violates memory-safe assembly annotation
F.
None of the above
A and B because calldatacopy acts in a similar way to returndatacopy, it can go over 64 bytes
- 1 point

Select all true statements:
A.
delegatecall can never re-enter as the state is shared
B.
delegatecall proxies without proper access controls may be prone to selfdestruct
C.
Proxies are typically used to save deploy-time gas costs
D.
Proxies can be used to prevent contract size limit issues
Not A because flag can be overwritten becasue of storage collision.
B, C, D
- 1 point

# Final score: 
This one I did live, and I was place 35/202

# Official write-up of solutions:
https://ventral.digital/posts/2023/7/30/race-20-of-the-secureum-bootcamp-epoch-infinity