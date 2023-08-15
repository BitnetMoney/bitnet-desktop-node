#!/bin/bash
# linux
# reset database script
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

# ClearDb
# removes old database directory
rm -rf ./bin/bitnet.db

# CleanAndExit
# clear screen
clear
# display end message
echo "Operation finalized. Press Enter to exit."
read -r
