Formal verification of a proxy contract written by the Bitbank team in raw bytecode.
A decription of the proxy bytecode can be found [here](https://github.com/bitbankinc/exchangeDepositContract/blob/d0e884fae6a8342f5464086db0d8205479b0ef78/contracts/ExchangeDeposit.sol#L376-L446).
One unique property of the proxy contract is the manual replacement of the call target before deployment, hardcoding this target within a `PUSH20` instruction.
The behavior of the bytecode was verified with this call target represented symbolically, meaning the proofs hold for any 20-byte call target, excluding Ethereum precompile addresses.

## Setup
* `docker pull wolflo0/kevm:6955e13`
* `docker run -it -v ${PWD}:/home/user/specs wolflo0/kevm:6955e13`
* `cd specs/`

## Proving a spec
* `make prove spec=proxy-spec-call` to prove the spec in `specs/proxy-spec-call.k`
* `make prove-all` to prove all of the specs. This should take ~10 minutes.

You should get `#Top` (along with a bunch of warnings) when a spec is successfully proved.
