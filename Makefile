OWNER_KEY := 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
OWNER_ADDRESS := 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
SENDER_KEY := 0x59c6995e998f97a5a0044966f0945389dc9e86dae88c7a8412f4603b6b78690d
SENDER_ADDRESS := 0x70997970C51812dc3A010C7d01b50e0d17dc79C8
URL := http://localhost:8545
SCRIPT := script/Coin.s.sol

CONTRACT_ADDRESS := 0x5FbDB2315678afecb367f032d93F642f64180aa3

deploy:
	forge script $(SCRIPT) --fork-url $(URL) --private-key $(OWNER_KEY) --broadcast --verify -vvvv

get_balance:
	cast call $(CONTRACT_ADDRESS) "balanceOf(address)(uint256)" $(OWNER_ADDRESS)

eth_to_token:
	cast call $(CONTRACT_ADDRESS) "EthToToken(uint256)(uint256)" 10

buy:
	cast send $(CONTRACT_ADDRESS) "Buy(uint256)()" 10 --from $(SENDER_ADDRESS) --private-key $(SENDER_KEY)  --value 10ether
