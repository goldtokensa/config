#!/bin/sh

exec $HOME/guardnode/run_guardnode --rpcuser ocean --rpcpass oceanpass --rpchost 127.0.0.1:8332 --servicerpcuser ocean --servicerpcpass oceanpass --servicerpchost 127.0.0.1:8332 --nodelogfile ../ocean/gold_main/debug.log --challengehost https://coordinator.gtsa.io:443 --bidlimit 50
