# Bitnet Desktop Node

Bitnet Desktop Node is user-friendly software that enables both technical and non-technical users to run a node and mine Bitnet using any household computer. The software aims to make it easier for beginners to get started with Bitnet, while also simplifying node management tasks for more seasoned users.

## Minimum Requirements

- Dual-Core CPU or Equivalent (Quad-Core CPU Recommended)
- 2GB RAM (4GB or More Recommended)
- 200MB Storage for Desktop Node
- 10GB or More Storage for Database (Recommended)

## How to Build from Source

### Microsoft Windows

[<img alt="win64" width="420px" src="/img/desktop-node-win64.png" />](https://github.com/BitnetMoney/bitnet-desktop-node/blob/a26ee3fb6fe728f2c95a24707121bdfd8295e479/img/desktop-node-win64.png)

Clone the repository either by downloading it directly from Github or by executing the following command:

```cmd
git clone https://github.com/BitnetMoney/bitnet-desktop-node
```

Navigate to the `/bitnet-desktop-node/script` folder either by clicking on it or by executing:

```cmd
cd bitnet-desktop-node/script
```

Execute the build script either by clicking on it or by running:

```cmd
.\build
```

Once the build is complete, the script will automatically open the build folder. Alternatively, you can access it manually with:

```cmd
cd ..\build\win
```

*Note: Linux and MacOS GUIs are currently under development.*

## How to Contribute

### Repository Structure

- `/bin` - Contains the Bitnet binaries, either built or imported from the main source code.
- `/build` - Stores the built or production versions of the software.
- `/gui` - Houses the Graphic User Interface files.
    - `/gui/linux` - Contains the Linux GUI files.
    - `/gui/mac` - Contains the MacOS GUI files.
    - `/gui/win` - Contains the Windows GUI files.
- `/scripts` - Contains scripts for building and running the application.
- `/settings` - Stores all SET files used by the GUI to define settings.
    - `/settings/defaults` - Contains the default SET files.
- `/shell` - Holds all application shell binaries and scripts.
    - `/shell/linux` - Contains the Linux shell files.
    - `/shell/mac` - Contains the MacOS shell files.
    - `/shell/win` - Contains the Windows shell files.

### GUI Contributions

If you're interested in contributing to the software's GUI, please adhere to the guidelines below:

- The Windows interface is currently being developed in Delphi, Visual Basic, Batchfile Scripting (CMD), and C++. Contributions should be in one of these languages.
- For Linux and Mac, the Python language is being utilized. Therefore, contributions should be submitted in Python.
- If you are proposing an entirely new GUI, you may use any language. However, pull requests that delete existing files will undergo thorough review before merging. Contributions in languages unfamiliar to or seldom used by the community may be declined to prevent hindering future contributions. The preference is to merge additions and modifications rather than replace existing versions of the GUIs.

### Other Contributions

For other types of contributions, please fork the repository and create a Pull Request on Github. Ensure that any submitted binaries include their corresponding source code; otherwise, your request will not be approved.

### General Guidelines

- Comment all functions in your code.
- Ensure comments are easily readable and written in English.
- The more comments, the better.
- Whenever possible, PRs should be in the same programming language as the existing code being modified.
- Avoid submitting binaries without their source code for verification.
- Your code should be well-formatted and organized.
- Steer clear of using outdated expressions and functions.
- If your changes require any dependencies, include those with your PR. Clearly state if you are not the author of the dependency and provide any relevant copyright terms and licenses.
- Update any build or run scripts in the `/scripts` folder to account for new files added to the source code.
