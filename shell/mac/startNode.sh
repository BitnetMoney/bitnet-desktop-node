#!/bin/bash

# Copyright 2023 Bitnet
# This file is part of the Bitnet library.
#
# This software is provided "as is," without warranty of any kind,
# express or implied, including but not limited to the warranties
# of merchantability, fitness for a particular purpose, and
# noninfringement. In no event shall the authors or copyright
# holders be liable for any claim, damages, or other liability,
# whether in an action of contract, tort, or otherwise, arising
# from, out of, or in connection with the software or the use or
# other dealings in the software.

echo "Bitnet Local Node"

# debug settings and logic
debug="off"
if [ "$debug" == "on" ]; then
    set -x
else
    set +x
fi

# Imports and Constructors

# basic settings
read -r syncMode < ../settings/node_syncmode.set
read -r nodeName < ../settings/node_name.set
read -r maxPeers < ../settings/node_maxpeers.set
read -r ipcDisable < ../settings/node_ipcdisable.set

# flag constructor
if [ "$ipcDisable" == "true" ]; then
    basicFlag="--syncmode $syncMode --maxpeers $maxPeers --ipcdisable"
else
    basicFlag="--syncmode $syncMode --maxpeers $maxPeers --ipcpath bitnet"
fi

# networking
read -r andStatus < ../settings/node_nodiscover.set
read -r nodePort < ../settings/node_port.set

# flag constructor
if [ "$andStatus" == "true" ]; then
    networkFlag="--port $nodePort --nodiscover"
else
    networkFlag="--port $nodePort"
fi

# node mining
read -r miningStatus < ../settings/node_mine.set
read -r coinbase < ../settings/node_miner.coinbase.set

# flag constructor
if [ "$miningStatus" == "true" ]; then
    minerFlag="--mine --miner.etherbase $coinbase"
else
    minerFlag=""
fi

# http flag
read -r httpStatus < ../settings/node_http.set
read -r httpAddr < ../settings/node_http.addr.set
read -r httpCorsDomain < ../settings/node_http.corsdomain.set
read -r httpPort < ../settings/node_http.port.set
read -r httpRpcPrefix < ../settings/node_http.rpcprefix.set
read -r httpVhosts < ../settings/node_http.vhosts.set
read -r httpApiAdmin < ../settings/node_http.api.admin.set
read -r httpApiDebug < ../settings/node_http.api.debug.set
read -r httpApiEth < ../settings/node_http.api.eth.set
read -r httpApiMiner < ../settings/node_http.api.miner.set
read -r httpApiNet < ../settings/node_http.api.net.set
read -r httpApiTxPool < ../settings/node_http.api.txpool.set
read -r httpApiWeb3 < ../settings/node_http.api.web3.set

# api constructor
httpApiP1=""
if [ "$httpApiAdmin" == "true" ]; then
    httpApiP1="admin"
fi
httpApiP2="$httpApiP1"
if [ "$httpApiDebug" == "true" ]; then
    httpApiP2="$httpApiP1,debug"
fi
httpApiP3="$httpApiP2"
if [ "$httpApiEth" == "true" ]; then
    httpApiP3="$httpApiP2,eth"
fi
httpApiP4="$httpApiP3"
if [ "$httpApiMiner" == "true" ]; then
    httpApiP4="$httpApiP3,miner"
fi
httpApiP5="$httpApiP4"
if [ "$httpApiNet" == "true" ]; then
    httpApiP5="$httpApiP4,net"
fi
httpApiP6="$httpApiP5"
if [ "$httpApiTxPool" == "true" ]; then
    httpApiP6="$httpApiP5,txpool"
fi
httpApiP7="$httpApiP6"
if [ "$httpApiWeb3" == "true" ]; then
    httpApiP7="$httpApiP6,web3"
fi
if [ "${httpApiP7:0:1}" == "," ]; then
    httpApiP7="${httpApiP7:1}"
fi
httpApi="$httpApiP7"

# flag constructor
if [ "$httpStatus" == "true" ]; then
    httpFlag="--http --http.port $httpPort --http.addr $httpAddr --http.corsdomain $httpCorsDomain --http.vhosts $httpVhosts --http.rpcprefix $httpRpcPrefix --http.api $httpApi"
else
    httpFlag=""
fi

# graphql flag
read -r graphqlStatus < ../settings/node_graphql.set
read -r graphqlCorsDomain < ../settings/node_graphql.corsdomain.set
read -r graphqlVhosts < ../settings/node_graphql.vhosts.set

# flag constructor
if [ "$graphqlStatus" == "true" ]; then
    graphqlFlag="--graphql --graphql.corsdomain $graphqlCorsDomain --graphql.vhosts $graphqlVhosts"
else
    graphqlFlag=""
fi

# websocket flag
read -r wsStatus < ../settings/node_ws.set
read -r wsAddr < ../settings/node_ws.addr.set
read -r wsOrigins < ../settings/node_ws.origins.set
read -r wsPort < ../settings/node_ws.port.set
read -r wsRpcPrefix < ../settings/node_ws.rpcprefix.set
read -r wsApiAdmin < ../settings/node_ws.api.admin.set
read -r wsApiDebug < ../settings/node_ws.api.debug.set
read -r wsApiEth < ../settings/node_ws.api.eth.set
read -r wsApiMiner < ../settings/node_ws.api.miner.set
read -r wsApiNet < ../settings/node_ws.api.net.set
read -r wsApiTxPool < ../settings/node_ws.api.txpool.set
read -r wsApiWeb3 < ../settings/node_ws.api.web3.set

# api constructor
wsApiP1=""
if [ "$wsApiAdmin" == "true" ]; then
    wsApiP1="admin"
fi
wsApiP2="$wsApiP1"
if [ "$wsApiDebug" == "true" ]; then
    wsApiP2="$wsApiP1,debug"
fi
wsApiP3="$wsApiP2"
if [ "$wsApiEth" == "true" ]; then
    wsApiP3="$wsApiP2,eth"
fi
wsApiP4="$wsApiP3"
if [ "$wsApiMiner" == "true" ]; then
    wsApiP4="$wsApiP3,miner"
fi
wsApiP5="$wsApiP4"
if [ "$wsApiNet" == "true" ]; then
    wsApiP5="$wsApiP4,net"
fi
wsApiP6="$wsApiP5"
if [ "$wsApiTxPool" == "true" ]; then
    wsApiP6="$wsApiP5,txpool"
fi
wsApiP7="$wsApiP6"
if [ "$wsApiWeb3" == "true" ]; then
    wsApiP7="$wsApiP6,web3"
fi
if [ "${wsApiP7:0:1}" == "," ]; then
    wsApiP7="${wsApiP7:1}"
fi
wsApi="$wsApiP7"

# flag constructor
if [ "$wsStatus" == "true" ]; then
    wsFlag="--ws --ws.port $wsPort --ws.addr $wsAddr --ws.origins $wsOrigins --ws.rpcprefix $wsRpcPrefix --ws.api $wsApi"
else
    wsFlag=""
fi

# authRpc flag
read -r authRpcStatus < ../settings/node_authrpc.set
read -r authRpcAddr < ../settings/node_authrpc.addr.set
read -r authRpcJwtSecret < ../settings/node_authrpc.jwtsecret.set
read -r authRpcPort < ../settings/node_authrpc.port.set
read -r authRpcVhosts < ../settings/node_authrpc.vhosts.set

# flag constructor
if [ "$authRpcStatus" == "true" ]; then
    authRpcFlag="--authrpc.port $authRpcPort --authrpc.addr $authRpcAddr --authrpc.vhosts $authRpcVhosts --authrpc.jwtsecret $authRpcJwtSecret"
else
    authRpcFlag=""
fi

# extra flags
read -r extraFlags < ../settings/node_extra.set

# global flag constructor
globalFlags="$basicFlag $networkFlag $minerFlag $httpFlag $graphqlFlag $wsFlag $authRpcFlag $extraFlags"

# debug report
if [ "$debug" == "on" ]; then
    echo ""
    echo "SCRIPT DEBUGGER REPORT"
    echo "---------------------------------------------------------------------------"
    echo "Constructed Flags:"
    echo "---------------------------------------------------------------------------"
    echo "Basic: $basicFlag"
    echo "Network: $networkFlag"
    echo "Miner: $minerFlag"
    echo "HTTP: $httpFlag"
    echo "GraphQL: $graphqlFlag"
    echo "WebSocket: $wsFlag"
    echo "AuthRPC: $authRpcFlag"
    echo "Extra: $extraFlags"
    echo ""
    echo "---------------------------------------------------------------------------"
    echo "Other Info:"
    echo "---------------------------------------------------------------------------"
    echo "N/A"
    echo ""
    echo "---------------------------------------------------------------------------"
    echo "The debugger has paused the script."
    read -r -p "Press any key to continue..."
else
    echo "Starting script with debug module off..."
fi

# Node Starter
# starts the node with all the preset parameters and flags

# Initiate Genesis
echo "Initiating mainnet genesis..."
./bitnet --datadir bitnet.db init .bitnet

# Start Node
# starts the node
./bitnet --datadir bitnet.db --networkid 210 --config ../settings/bootnodes.list $globalFlags

# Error Catcher
# pause to display errors and exit
read -r -p "Press any key to exit..."
exit
