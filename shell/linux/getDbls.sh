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

echo "Importing from DBLS..."

# imports the server url and file name from the settings repository
read -r dblsUrl < ../settings/bootnodes_dbls.server.set
read -r dblsFile < ../settings/bootnodes_dbls.file.set

echo "Importing bootnodes list from DBLS. Please do not close this prompt"
echo "otherwise the import might fail."
echo "---------------------------------------------------------------------"

# deletes old cache
rm -rf ../temp
mkdir -p ../temp

# uses curl to fetch from the server
wget "../temp/$dblsFile" "https://$dblsUrl/$dblsFile"

# applies the default file name logic
# needs to loop with a sha256 name to avoid conflicts if the file
# downloaded is already named default.list
mv "../temp/$dblsFile" "../temp/37a8eec1ce19687d132fe29051dca629d164e2c4958ba141d5f4133a33f0688f"
mv "../temp/37a8eec1ce19687d132fe29051dca629d164e2c4958ba141d5f4133a33f0688f" "../temp/default.list"
