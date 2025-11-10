## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

- **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
- **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
- **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
- **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ source .env

$ forge script script/Token.s.sol:DeployToken --rpc-url $RPC_URL --private-key $PRIVATE_KEY

or

$ forge create src/Token.sol:Token \
    --rpc-url $RPC_URL \
    --private-key $PRIVATE_KEY \
    --broadcast \
    --etherscan-api-key $ETHERSCAN_API_KEY \
    --verify \
    --constructor-args "TestToken" "TT" 1000000000000000000
```

### Cast

```shell
test on sepolia

$ cast call 0x58ab595b47f9417092e203f48ce2679a8256cb19 "name()(string)" \
    --rpc-url $RPC_URL --private-key $PRIVATE_KEY

$ cast call 0x58ab595b47f9417092e203f48ce2679a8256cb19 "symbol()(string)" \
    --rpc-url $RPC_URL --private-key $PRIVATE_KEY

$ cast call 0x58ab595b47f9417092e203f48ce2679a8256cb19 "decimals()(uint8)" \
    --rpc-url $RPC_URL --private-key $PRIVATE_KEY

$ cast call 0x58ab595b47f9417092e203f48ce2679a8256cb19 "totalSupply()(uint256)" \
    --rpc-url $RPC_URL --private-key $PRIVATE_KEY

$ cast call 0x58ab595b47f9417092e203f48ce2679a8256cb19 "balanceOf(address)(uint256)" "0xfd4Db109954c40FACca61E2b298d4C5F0c64d8F1" \
    --rpc-url $RPC_URL --private-key $PRIVATE_KEY
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
