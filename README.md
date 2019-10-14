# DGLD configuration

This repository contains the configuration files for the DGLD blockchain on the Ocean platform. This configuration defines the public keys and permissions that control the chain, and the binding to the Bitcoin blockchain via the Mainstay protocol. 

To run a fully validating DGLD node and connect to the network, please download the Ocean blockchain client from the CommerceBlock Github [here](https://github.com/commerceblock/ocean/releases). 
The client must be run with the configuration for the DGLD blockchain which is in the `ocean` directory (specified with the `-datadir=path` argument on the client node).

Alternatively, a DGLD node can be launched from a Docker image (`docker/docker-compose.yml`). 

The `ocean.conf` file along with the network terms-and-conditions (`latest.txt`) file determine the genesis block and permissions for the DGLD blockchain. 

The hash of genesis block of the DGLD blockchain is: `c66cb6eb7cd585788b294be28c8dcd6be4e37a0a6d238236b11c0beb25833bb9`

The configuration file (`ocean.conf`) specifies the consensus public keys which are used to define permissions and verify the DGLD blockchain. 

## Description of the DGLD configuration 

`signblockscript`: This script defines the signatures required to generate a new valid block. There are 5 public keys in total (in 5 separate block signing nodes), and at least 3 federation nodes must sign the block for it to be valid. The private keys for block signing were generated within 5 FIPS 140-2 Level 3 certified Hardware Security Module partitions owned by GTSA and located in Switzerland. 

`con_mandatorycoinbase`: This specified the address to which transaction fees are paid (controlled by GTSA)

`issuecontrolscript`: This script defines the signatures required to issue a new asset. There are 3 public keys, and two of them are required to create an issuance transaction. The corresponding 3 private keys were generated on 3 separate air-gapped devices, which are controlled by separate entities within GTSA and located in 3 separate countries. To sign issuance transactions requires following a 2FA issuance procedure authorized by both Coinshares (in London) and MKS (in Geneva) with signatures generated on the air-gapped devices. 

`freezelistcoinsdestination`: This specifies the public key that can be used to freeze user addresses (i.e. preventing them from transacting). The private key is controlled by GTSA. 

`burnlistcoinsdestination`: This specified the public key used to allow frozen assets to be 'burnt' (i.e. destroyed) as part of the redemption process. 

`whitelistcoinsdestination`: This specifies the public key used to onboard users and whitelist user addresses. The private key is controlled by GTSA. 

`challengecoinsdestination`: This specifies the public key used to interact with CommerceBlock's Guardnode system. The private key is controlled by GTSA. 

`attestationhash`: This specifies the transaction ID of the Mainstay staychan base on the Bitcoin blockchain. It uniquely binds the DGLD blockchain to a single history via the Mainstay protocol. 

