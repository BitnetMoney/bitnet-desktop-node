:: win64
:: get bootnodes list from server
::
:: Copyright 2023 Bitnet
:: This file is part of the Bitnet library.
::
:: This software is provided "as is", without warranty of any kind,
:: express or implied, including but not limited to the warranties
:: of merchantability, fitness for a particular purpose and
:: noninfringement. In no even shall the authors or copyright
:: holders be liable for any claim, damages, or other liability,
:: whether in an action of contract, tort or otherwise, arising
:: from, out of or in connection with the software or the use or
:: other dealings in the software.

@echo off
title Importing from DBLS...

:ImportUrl
:: imports the server url and file name from the settings repository
set /p dblsUrl=<..\settings\bootnodes_dbls.server.set
set /p dblsFile=<..\settings\bootnodes_dbls.file.set

:Info
echo Importing bootnodes list from DBLS. Please do not close this prompt
echo otherwise the import might fail.
echo ---------------------------------------------------------------------

:DeleteCache
:: deletes old cache
rmdir /q /s ..\temp
mkdir ..\temp

:UseGetUrl
:: uses getUrl to fetch from server
.\getUrl -P ..\temp https://%dblsUrl%/%dblsFile%

:: applies the default file name logic
:: needs to loop with a sha256 name to avoid conflicts if the file
:: downloaded is already named default.list
ren ..\temp\%dblsFile% 37a8eec1ce19687d132fe29051dca629d164e2c4958ba141d5f4133a33f0688f
ren ..\temp\37a8eec1ce19687d132fe29051dca629d164e2c4958ba141d5f4133a33f0688f default.list