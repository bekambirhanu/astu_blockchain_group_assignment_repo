# FundMe Contract

## Topics Covered
- Sending ETH
- msg.sender and msg.value
- require and revert
- Solidity Interfaces
- Libraries
- Chainlink Price Feeds
- Constructor
- Function Modifiers
- Custom Errors
- Constants and Immutables

## Key Concepts

### 1. Sending ETH
- Use payable functions
- msg.value represents ETH sent

### 2. msg.sender
- Address of the function caller

### 3. require & revert
- Used for validation and error handling

### 4. Constructor
- Runs once when contract is deployed

### 5. Function Modifiers
- Reusable conditions (e.g., onlyOwner)

### 6. Constants & Immutables
- constant → fixed at compile time
- immutable → set once in constructor

### 7. Custom Errors
- Gas-efficient error handling

### 8. Libraries
- Reusable code (e.g., price conversion)

### 9. Chainlink Price Feed
- Fetch real-world ETH price data

## Summary
FundMe is a crowdfunding smart contract where users send ETH and only the owner can withdraw funds.