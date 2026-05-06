# Simple Storage

## Topics Covered
- Basic Variable Types
- Functions
- Arrays
- Mapping
- Memory, Storage, Calldata
- Error Handling

## Key Concepts

### 1. Variable Types
- uint: Unsigned integer
- bool: true/false
- string: text

### 2. Functions
- Used to store and retrieve data
- Can be public, private, view, or pure

### 3. Arrays
- Store multiple values
- Example: uint[] public numbers;

### 4. Mapping
- Key-value data structure
- Example: mapping(uint => string)

### 5. Memory vs Storage vs Calldata
- storage → permanent (blockchain)
- memory → temporary
- calldata → read-only, efficient

### 6. Errors
- require(): validates conditions
- revert(): stops execution

## Summary
SimpleStorage demonstrates how data is stored, updated, and retrieved in smart contracts.