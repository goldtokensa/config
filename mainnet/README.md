## DGLD mainnet

### Guardnodes

The DGLD guarnode service requires running three applications simultaneously:

- *guardnode*
    Daemon that automatically bids on active service auctions for DGLD that are issued on the CB chain. It connects to a DGLD node in order to monitor the chain and respond to challenges and to a CB node in order to do the bidding.

- *ocean*
    DGLD node that connectes to the DGLD mainnet chain. The guardnode daemon queries this node for information.

- *ocean-cb*
    CB node that connecteds to the CB mainnet chain. The guardnode daemon queries this node for information.

These three applications can either be run using a single docker-compose file or separately. Both of these methods are explained below. Note that the *guardnode* will require connectivity to both the DGLD *ocean* and the CB node *ocean-cb* so these services should be accessible from each other if run on different machines.

The following [video](https://www.youtube.com/watch?v=dWZwnl0IBe4) is a short guide on setting up a guardnode for DGLD.

### KYC

Receiving payments on a DGLD address will require that the guarnode operator is properly KYCed. In order to start this process follow the [link](https://dgld.ch/wallet-id).

While for normal usage of DGLD an Electrum wallet would be required, in the guardnode case the registration file should be extracted from the *ocean* service. In order to do this the following command will have to be executed (after the "ocean" service is set up from the instructions below):

`ocean-cli dumpkycfile REGISTRATION.dat`

This file then needs to be imported to the form in the DGLD KYC application link above.

### CBT peg-in

Note that the *ocean-cb* node needs to be funded with CBT in order to bid on a service auction. Information on how to do this can be read [here](https://commerceblock.readthedocs.io/en/latest/twowp/index.html), where all the RPC calls required should be done via the "ocean-cb" node.

### Method 1 - Docker

0. Download and install [docker](https://docs.docker.com/install/) and [docker-compose](https://docs.docker.com/compose/install/) following your system instructions, supported systems are: Linux, Windows, MacOS
1. Clone this repo
2. Move to Guardnode folder
```bash
cd config/mainnet/docker/guardnode
```
3. Edit docker-compose file if desired
4. Start Ocean node alongside Guardnode
    ```bash
    docker-compose up -d
    ```
    or start ocean and ocean-cb
    ```bash
    docker-compose up -d ocean ocean-cb
    ```
    and start guardnode by overriding bid limit
    ```bash
    GUARNODE_BID_LIMIT=<CBT bid limit> docker-compose up -d guardnode
    ```

Follow guardnode logs
```bash
docker-compose logs -f guardnode
```

Follow Ocean DGLD logs
```bash
docker-compose logs -f ocean
```

Follow Ocean CB logs
```bash
docker-compose logs -f ocean-cb
```

Interact with ocean node
```bash
docker-compose exec ocean-cb ocean-cli -rpcport=8332 -rpcuser=ocean -rpcpassword=oceanpass claimethpegin
```

### Method 2 - binaries

0. Download and install binaries for [Ocean](https://github.com/commerceblock/ocean/releases) and [Guardnode](https://github.com/commerceblock/guardnode/releases).

1. Clone this repo
2. Start Ocean node
```bash
cd config/mainnet/binaries
./ocean.sh
./ocean-cb.sh
```
3. Start Guardnode
```bash
./guardnode.sh
```
or start guardnode by overriding bid limit
```bash
GUARNODE_BID_LIMIT=<CBT bid limit> ./guardnode.sh
```