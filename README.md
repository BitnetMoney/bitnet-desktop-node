# Bitnet Desktop Node

## Repository Structure

- `/bin` - Contains Bitnet binaries, built and imported from the main source code.
- `/build` - Folder that houses the built/production version of the program.
- `/gui` - Contains the Graphic User Interface files.
- `/gui/linuix` - Contains the GUI files for the Linux interface.
- `/gui/mac` - Contains the GUI files for the Mac interface.
- `/gui/win` - Contains the GUI files for the Windows interface.
- `/scripts` - Contains source code scripts to build and run the application.
- `/shell` - Contains all application shell binaries and scripts.

## How To Contribute

### GUI Contributions

If you want to contribute to the GUI of the software, please follow the guidelines below:

1) Currently the Windows interface is being built in Delphi and C++, so any contributions will need to be done in either of those languages.
2) For Linux and Mac the Python language is being used, so any contributions will need to be submitted in Python.
3) If you are proposing a fully new GUI, it can be in any language, but any Pull Requests with files being deleted will be throughly reviewed before any merging, and languages that are unknown or not utilized by the majority of the contributors might be declined so we don't hinder or disrrupt future contributions from the community. The preference will always be to merge additions and alterations rather than a full wipeout of previous versions of the GUIs.

### Other Contributions

You can submit any other contributions by forking the repository and creating a Pull Request on Github. Make sure that any binaries being submitted are accompanied by their respective sources, otherwise your request will not be accepted.

### General Guidelines

1) Any functions in your code need to be commented.
2) All comments need to be clear to read and in English.
3) The more comments the better, and if the mergers think it's too much, all the work that is is to delete a few lines, to please feel free to comment as much as you want.
4) Always that it is possible, PRs should be made in the same programming language as the underlying code being edited.
5) Avoid binaries, and if that is not possible, submit the source code for verification with your PR.
6) Make sure your code is well-formatted and organised.
7) Avoid using out-of-date expressions and functions.
8) If your alterations will require any dependency to work, you need to submit those with your PR, clearly stating that the dependency is not of your own authorying - if that's the case - and declaring any copyright terms and licences that may apply.
9) Make sure you have updated any building or running scripts on `/scripts` to account for any new files being added to the source code.