#!/bin/bash
# linux
# node starter script
#
# Copyright 2023 Bitnet
# This file is part of the Bitnet library.
#
# This software is provided "as is", without warranty of any kind,
# express or implied, including but not limited to the warranties
# of merchantability, fitness for a particular purpose and
# noninfringement. In no event shall the authors or copyright
# holders be liable for any claim, damages, or other liability,
# whether in an action of contract, tort or otherwise, arising
# from, out of or in connection with the software or the use or
# other dealings in the software.

# Imports
# imports
read -r extraFlags < ../settings/node_extraFlags.set

# NodeStarter
# starts the node with the default plus extra flags,
# and .config settings

# InitGenesis
# initiates the genesis file
echo "Initiating mainnet genesis..."
./bitnet --datadir bitnet.db init .bitnet

# StartNode
# starts the node
./bitnet --networkid 210 --config .config "$extraFlags"

# ErrorCatcher
# pause to display errors and exit
read -p "Press Enter to continue..."
