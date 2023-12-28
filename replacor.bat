@echo off
setlocal enabledelayedexpansion

:: Check for --help argument
if "%~1"=="--help" goto :help

:: Use the current directory as the root
set "rootdir=%CD%"

:: Check for parameters, use default if not provided
set "oldstring=%~1"
set "newstring=%~2"
if "%oldstring%"=="" goto :error
if "%newstring%"=="" goto :error

echo Renaming from "%oldstring%" to "%newstring%" in %rootdir%

:: First, rename files
for /r "%rootdir%" %%F in (*%oldstring%*) do (
    set "filename=%%~nxF"
    set "newfilename=!filename:%oldstring%=%newstring%!"
    if not "!filename!"=="!newfilename!" (
        echo Renaming file: %%F
        ren "%%F" "!newfilename!"
    )
)

:: Then, rename directories
for /f "delims=" %%D in ('dir /ad /b /s "%rootdir%\*%oldstring%*"') do (
    set "dirname=%%~nxD"
    set "newdirname=!dirname:%oldstring%=%newstring%!"
    if not "!dirname!"=="!newdirname!" (
        echo Renaming directory: %%D
        ren "%%D" "!newdirname!"
    )
)

echo Renaming complete.
pause
goto :eof

:help
echo Usage: scriptname [oldstring] [newstring]
echo.
echo This script renames files and directories, replacing occurrences
echo of oldstring with newstring. If oldstring or newstring are not 
echo provided, it defaults to renaming 'gig' to 'job'.
echo.
echo Parameters:
echo  oldstring - The string to be replaced.
echo  newstring - The new string to replace oldstring.
echo.
echo Example:
echo  scriptname old new
echo.
echo To display this help, use --help:
echo  scriptname --help
goto :eof

:error
    echo provide two parameters, see replacor --help
