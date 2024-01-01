# simple-token

## Overview

- Simple ERC20 token contract
- Creating a basic application as part of my research efforts.

### Story Flow

1. The contract deployer launches the "SimpleToken" contract.
2. The contract deployer becomes the contract owner.
3. The contract deployer acquires contract owner rights.
4. The contract owner issues ERC20 tokens, namely "Simple ERC20 token" and "SET" token.
5. The SimpleToken contract, which is a token contract, executes the issuance of "Simple ERC20 token" and "SET" token through the Token contract.
6. The ERC20 token contract issues the "SET" token.
7. SimpleApp user calls the "simple" function from the UI.
8. From the UI, the SimpleToken contract executes the "simple" function.
9. The SimpleToken contract obtains the rewards for the "simple" function from the ERC20 token contract.
10. The SimpleApp user who called the "simple" function receives "SET" tokens as rewards from the SimpleToken contract.

### flow diagram

[simple token diagram](https://github.com/fuku-j/simple-token/blob/main/docs/simpe_token.pdf)

- mermaid.js

```mermaid
graph LR
  subgraph "Contract Developer"
    Deployer((Deployer))
    subgraph SmartContract
      subgraph SimpleTokenContract
      SimpleToken[SimpleToken]
      ERC20Token[ERC20 Token contract]
      Owner((Owner))
      end
    end
  end
  subgraph "SimpleApp User"
    User((User))
    subgraph "Simple App"
      UI[UI]
    end
  end

  Deployer -- 1. deploy --> SimpleToken
  SimpleToken -- 2. contract owner --> Deployer
  Deployer -- 3. owner right --> Owner
  Owner -- 4. Call Issue SET(ERC20) Token --> SimpleToken
  SimpleToken -- 5. Execution Issue SET(ERC20) token --> ERC20Token
  ERC20Token -- 6. Issue SET(ERC20) token --> ERC20Token

  User -- 7. Call feature simple --> UI
  UI -- 8. Run feature simple --> SimpleToken
  ERC20Token -- 9. Get SET token(reward) --> SimpleToken
  SimpleToken -- 10. Received SET token(reward) --> UI
```
