# Bitnet Desktop Node

Bitnet Desktop Node is a user-friendly software that allows technical and non-technical users to run a node and mine Bitnet with any household computer. The goal with this software is to lower the barrier to entry to Bitnet while facilitating node management tasks for more experienced users.

## Minimum Requirements

- Dual-Core CPU or Equivalent (Quad-Core+ CPU Recommended)
- 2GB RAM (4GB+ RAM Recommended)
- 200Mb Storage for Desktop Node
- 10GB+ Storage for Database Recommended

## How To Build From Source

### Microsoft Windows

[<img alt="win64" width="420px" src="/img/desktop-node-win64.png" />](https://github.com/BitnetMoney/bitnet-desktop-node/blob/a26ee3fb6fe728f2c95a24707121bdfd8295e479/img/desktop-node-win64.png)

Copy the repository by downloading it directly from Github or running the command below:

```cmd
git clone https://github.com/BitnetMoney/bitnet-desktop-node
```

Navigate to the /bitnet-desktop-node/script folder by clicking on it or running:

```cmd
cd bitnet-desktop-node/script
```

Now just execute the building script by clicking on it or running:

```cmd
.\build
```

After the build is complete, the script will open your build folder, or you can access it using:

```cmd
cd ..\build\win
```

*Linux and MacOS GUIs are still being developed.*

## How To Contribute

### Repository Structure

- `/bin` - Contains Bitnet binaries, built and imported from the main source code.
- `/build` - Folder that houses the built/production version of the program.
- `/gui` - Contains the Graphic User Interface files.
- `/gui/linux` - Contains the GUI files for the Linux interface.
- `/gui/mac` - Contains the GUI files for the MacOS interface.
- `/gui/win` - Contains the GUI files for the Windows interface.
- `/scripts` - Contains source code scripts to build and run the application.
- `/settings` - Houses all SET files that are used by the GUI to define settings.
- `/shell` - Contains all application shell binaries and scripts.
- `/shell/linux` - Contains the shell files for Linux.
- `/shell/mac` - Contains the Shell files for MacOS.
- `/shell/win` - Contains the shell files for Windows.

### GUI Contributions

If you want to contribute to the GUI of the software, please follow the guidelines below:

1. Currently the Windows interface is being built in Delphi and C++, so any contributions will need to be done in either of those languages.
2. For Linux and Mac the Python language is being used, so any contributions will need to be submitted in Python.
3. If you are proposing a fully new GUI, it can be in any language, but any Pull Requests with files being deleted will be throughly reviewed before any merging, and languages that are unknown or not utilized by the majority of the contributors might be declined so we don't hinder or disrrupt future contributions from the community. The preference will always be to merge additions and alterations rather than a full wipeout of previous versions of the GUIs.

### Other Contributions

You can submit any other contributions by forking the repository and creating a Pull Request on Github. Make sure that any binaries being submitted are accompanied by their respective sources, otherwise your request will not be accepted.

### General Guidelines

1. Any functions in your code need to be commented.
2. All comments need to be clear to read and in English.
3. The more comments the better.
4. Always that it is possible, PRs should be made in the same programming language as the underlying code being edited.
5. Avoid binaries, and if that is not possible, submit the source code for verification with your PR.
6. Make sure your code is well-formatted and organized.
7. Avoid using out-of-date expressions and functions.
8. If your alterations will require any dependency to work, you need to submit those with your PR, clearly stating that the dependency is not of your own authorying - if that's the case - and declaring any copyright terms and licences that may apply.
9. Make sure you have updated any building or running scripts on `/scripts` to account for any new files being added to the source code.
