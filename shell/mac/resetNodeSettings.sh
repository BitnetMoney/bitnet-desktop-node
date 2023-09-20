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

echo "Reset Node Setting Defaults"

# Reset Settings
# copies and replaces all the current settings with the default
# settings from inside the /settings/defaults folder
echo "Applying the default settings..."
cp -r "./settings/defaults" "./settings"
echo ""
echo "The default node settings have been applied."
echo "You will need to restart your node for them to take effect."
echo ""
read -r -p "Press any key to close this window..."
exit
