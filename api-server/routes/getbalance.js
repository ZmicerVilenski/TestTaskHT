import express from 'express';
import Web3 from 'web3';
import * as web3 from '@solana/web3.js';
import { getAccount, getMint } from '@solana/spl-token';
import { ethTokenAddr, solTokenAddr } from "../token-addresses.js";

const router = express.Router();

router.post('/', async (req, res) => {

  const body = req.body;
  const address = body.address;

  const balance = await getBalance(address);

  res.status(200).send({
    wallet_address: address,
    token_address: ethTokenAddr,
    balance: balance,
  });

});

async function getBalance(walletAddress) {

  let result;

  // To save time, I didn't check the address was correct
  if (walletAddress.length == 42) {
    result = await getEthBalance(walletAddress);
  } else if (walletAddress.length == 43 || walletAddress.length == 44) {
    result = await getSolBalance(walletAddress);
  } else {
    result = 'Not correct address format!';
  }

  return result;

}

async function getEthBalance(walletAddress) {

  const web3 = new Web3('https://api.avax-test.network/ext/bc/C/rpc')

  // The minimum ABI to get ERC20 Token balance
  let minABI = [
    // balanceOf
    {
      "constant":true,
      "inputs":[{"name":"_owner","type":"address"}],
      "name":"balanceOf",
      "outputs":[{"name":"balance","type":"uint256"}],
      "type":"function"
    },
    // decimals
    {
      "constant":true,
      "inputs":[],
      "name":"decimals",
      "outputs":[{"name":"","type":"uint8"}],
      "type":"function"
    }
  ];

  const contract = new web3.eth.Contract(minABI, ethTokenAddr);
  const balanceBig = await contract.methods.balanceOf(walletAddress).call();
  const decimals = await contract.methods.decimals().call();

  const balance = convertBalance(balanceBig, decimals);

  return balance;

}

async function getSolBalance(walletAddress) {

  const tokenAccount = new web3.PublicKey(walletAddress);
  const connection = new web3.Connection(web3.clusterApiUrl("devnet"));
  const info = await getAccount(connection, tokenAccount);
  const amount = Number(info.amount);
  const mint = await getMint(connection, info.mint);
  const balance = amount / (10 ** mint.decimals);
  console.log('Balance (using Solana-Web3.js): ', balance);

  return balance;

  // return getTokenBalanceWeb3(connection, tokenAccount);

}

async function getTokenBalanceWeb3(connection, tokenAccount) {
  const info = await connection.getTokenAccountBalance(tokenAccount);
  if (info.value.uiAmount == null) throw new Error('No balance found');
  console.log('Balance (using Solana-Web3.js): ', info.value.uiAmount);
  return info.value.uiAmount;
}

function convertBalance(balanceBig, decimals) {
  // To save time, I show the balance in a simplified way
  const balStr = BigInt(balanceBig).toString();
  console.log(typeof balStr)
  const balance = balStr.slice(0, -Number(decimals));
  return balance;
}

export default router;

// curl -X POST http://localhost:5000/getbalance -d "address=0xfff"