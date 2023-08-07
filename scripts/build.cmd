:: Build script for the Bitnet Desktop Node for Windows.
::
:: For contributions please preserve the layout and overall
:: standard, including with the progress bar display and
:: the usage of steps for every operation category.
::
:: Contributions without comments will not be merged.

@echo off
title Building Bitnet Desktop Node...
set step=cls
goto BuildScript

:PauseExit
pause>null
del /f /q null
cls
exit

:BuildScript
:: Step 1
%step%
echo [#                   ] 5%
echo.
echo Cleaning old build files...
:: Deletes any old build folders present.
rmdir /q /s ..\build\win

:: Step 2
%step%
echo [##                  ] 10%
echo.
echo Creating build folder...
:: Creates the destination folder for the build.
mkdir ..\build\win

:: Step 3
%step%
echo [####                ] 20%
echo.
echo Windows Graphic Interface...
:: Copies the GUI files from the source into the build folder.
copy ..\gui\win\BitnetNode.exe ..\build\win\BitnetNode.exe
copy ..\gui\win\version.ini ..\build\win\version.ini

:: Step 4
%step%
echo [######              ] 30%
echo.
echo Copying binaries...
:: Copies the entire /bin folder into the build folder.
xcopy /e /h /c /i ..\bin ..\build\win\bin
:: Removes unused /bin files used by other OSs for size optimisation.
del /f /q ..\build\win\bin\bitnet
del /f /q ..\build\win\bin\readme.md

:: Step 5
%step%
echo [##############      ] 70%
echo.
echo Copying shell files...
:: Copies the entire /shell folder into the build folder.
xcopy /e /h /c /i ..\shell ..\build\win\shell
:: Removes unused /shell files used by other OSs for size optimisation.
del /f /q ..\build\win\shell\readme.md

:: Step 6
%step%
echo [####################] 100%
echo.
echo Process complete! You can find your optimised build inside the
echo /build/win folder. Press any key to exit the script.
goto PauseExit