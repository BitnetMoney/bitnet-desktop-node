#!/bin/bash
# Build script for the Bitnet Desktop Node for Linux or macOS.
#
# For contributions please preserve the layout and overall
# standard. Contributions without comments will not be merged.

# Function to determine the operating system
get_os() {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        OS="linux"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        OS="mac"
    else
        echo "Unsupported operating system."
        exit 1
    fi
}

clear
echo "Cleaning old build files..."
# Deletes any old build folders present.
rm -rf "../build/$OS"

echo "Creating build folder..."
# Creates the destination folder for the build.
mkdir "../build/$OS"

echo "$OS Graphic Interface..."
# Copies the GUI files from the source into the build folder.
cp "../gui/$OS/BitnetNode" "../build/$OS/BitnetNode"
cp "../gui/$OS/version.ini" "../build/$OS/version.ini"

echo "Copying binaries..."
# Copies the entire /bin folder into the build folder.
cp -r "../bin" "../build/$OS/bin"
# Removes unused /bin files used by other OSs for size optimization.
rm -f "../build/$OS/bin/bitnet"
rm -f "../build/$OS/bin/miner"
rm -f "../build/$OS/bin/readme.md"

echo "Copying settings..."
# Copies the entire /settings folder into the build folder.
cp -r "../settings" "../build/$OS/settings"
# Removes unused files from the /settings folder.
rm -f "../build/$OS/settings/readme.md"

echo "Copying shell files..."
# Copies the entire /shell folder into the build folder.
cp -r "../shell/$OS" "../build/$OS/shell"
# Removes unused /shell files used by other OSs for size optimization.
rm -f "../build/$OS/shell/readme.md"

echo "Process complete! You can find your optimized build inside the"
echo "/build/$OS folder. Press Enter to exit the script."
read -r
