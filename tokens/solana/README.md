### Token created using solana-cli. Not to waste extra time. Also possible to use JS scripts.

### Create token:
```shell
$ spl-token create-token
```
TOKKEN_ADDRESS = HweyZHmeEZcXfKm1uJGtU8MajrxHcotThprDv77mjNoE

### Check balance of new token
```shell
$ spl-token supply <TOKKEN_ADDRESS>
```

### Create account for new token
```shell
$ spl-token create-account <TOKKEN_ADDRESS> [ACCOUNT_KEYPAIR]
```
TOKEN_ACCOUNT_ADDR = 4S5hsPA7F7XNTA2sexi1R5CeP8uV76hKcwzjHgwNQY3P

### Check balance of new token
```shell
$ spl-token balance <TOKKEN_ADDRESS>
```

### Mint new token
```shell
$ spl-token mint <TOKKEN_ADDRESS> 1000
```

### Tramsfet new token
```shell
$ spl-token transfer --fund-recipient HweyZHmeEZcXfKm1uJGtU8MajrxHcotThprDv77mjNoE 50 83oNUrPsxtQGmKJHYSB5dS1snHea7JT9y2hVvQYdt5bp
```
RECIPIENT_TOKEN_ACC = 9a1WmzNnGjYYmRtLZSRzcUdTssM8xxqUdpQgCLYokzpv

### Create new keypair
```shell
$ solana-keygen grind --starts-with new:1
```
KEYPAIR_JSON = ./newHmS1W2QC53QhQWPJMoFAqfp8q9H4spHqyTe6A29u.json

### Create account for new token for other keypair
```shell
$ spl-token create-account <TOKKEN_ADDRESS> [ACCOUNT_KEYPAIR]
```
TOKEN_ACCOUNT_ADDR = newHmS1W2QC53QhQWPJMoFAqfp8q9H4spHqyTe6A29u