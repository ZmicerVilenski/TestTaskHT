// SPDX-License-Identifier: AGPL
pragma solidity ^0.8.20;

import { Script } from "forge-std/Script.sol";
import { console2 } from "forge-std/console2.sol";
import { TOKEN } from "../src/Token.sol";

contract DeployToken is Script {
    function run() external returns (address) {
        address token = deploy();
        return token;
    }

    function deploy() public returns (address) {
        uint256 pk = vm.envUint("PK");
        address initialOwner = vm.addr(pk);
        // address initialOwner = 0xfff;

        vm.startBroadcast(pk);

        TOKEN token = new TOKEN(initialOwner);
        console2.log("TOKEN ", address(token));

        vm.stopBroadcast();

        return address(token);
    }
}


// source .env
// forge script script/DeployToken.s.sol:DeployToken    // - local
// forge script script/DeployToken.s.sol:DeployToken --rpc-url $RPC_URL --legacy     // - simulate
// forge script script/DeployToken.s.sol:DeployToken --rpc-url $RPC_URL --broadcast --verify --legacy -vvvv     // - real tx



// mainnet/testnet:
// source .env
// forge script script/DeployToken.s.sol --legacy --broadcast --rpc-url $RPC_URL --verifier-url $VERIFIER_URL --etherscan-api-key $ETHERSCAN_API_KEY

// https://testnet.snowtrace.io/token/0x14D4BA943558d36769341Bc5c991613A9D7bf6F4/contract/readContract?chainId=43113


// verify
// source .env
// forge verify-contract 0x14D4BA943558d36769341Bc5c991613A9D7bf6F4 "src/Token.sol:TOKEN" --verifier-url $VERIFIER_URL --etherscan-api-key $ETHERSCAN_API_KEY --num-of-optimizations 200 --compiler-version "0.8.20" --constructor-args $(cast abi-encode "constructor(address initialOwner)" 0xF34374EC70444eAEbf32F8E3736D6340a08B989e)
//
// forge verify-contract [contract-address] [src/path/ContractPath.sol:ContractName]
// --verifier-url $VERIFIER_URL
// --etherscan-api-key $ETHERSCAN_API_KEY
// --num-of-optimizations 200
// --compiler-version [solc compiler version]
// --constructor-args $(cast abi-encode "constructor(address param1, uint256 param2,...)" param1 param2 ...)
