## Guardnode Service

Initiating a DGLD guarnode service requires running three different applications simultaneously:

- DGLD Ocean node ("ocean"): The node that is monitored by the guardnode and challenges are issued by the service coordinator.

- CB Ocean node ("ocean-cb") : The node where all active requests are registed and the bidding happens on service auctions for DGLD.

- Guardnode daemon ("guardnode"): The daemon that automatically bids on active service auctions for DGLD, monitors the DGLD chain and responds to challenges.

These three services can either be run using a single docker-compose file or by running each of these separately. Both of these methods are explained below. Note that the "guardnode" will require connectivity to both the DGLD and the CB node so these services should be accessible from each other if run on different machines.

Note that the "ocean-cb" node needs to be funded with CBT in order to bid on a service auction. Information on how to do this can be read [here](https://commerceblock.readthedocs.io/en/latest/twowp/index.html), where all the RPC calls required should be done via the "ocean-cb" node.

### Method 1 - docker

0. Download and install [docker](https://docs.docker.com/install/) and [docker-compose](https://docs.docker.com/compose/install/) following your system instructions, supported systems are: Linux, Windows, MacOS
1. Clone this repo
2. Move to Guardnode folder
```bash
cd config/mainnet/docker/guardnode
```
3. Edit docker-compose file if desired

    _Edit the -bidlimit argument to control the max amount of CBT allowed to bid on a service auction._

4. Start Ocean node alongside Guardnode
```bash
docker-compose up -d
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
docker-compose exec ocean ocean-cli -rpcport=8332 -rpcuser=ocean -rpcpassword=oceanpass help
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
*Edit the -bidlimit argument to control the max amount of CBT allowed to bid on a service auction.*
