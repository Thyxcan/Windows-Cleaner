Color 02
@ECHO OFF
CLS

:Start
CLS

:: Menu and Instructions
ECHO ==========================================
ECHO TYXCAN PRESENTS:
ECHO ==========================================
ECHO.
ECHO Instructions:
ECHO - Press the number corresponding to your choice.
ECHO - Follow prompts for further actions.
ECHO ==========================================
ECHO ===!!!!!START IN ADMINISTRATOR!!!!!!!!!===
ECHO ==========================================
ECHO.

:: Menu Options
ECHO 1. Files Fixer
ECHO 2. Bad file remover
ECHO 3. Bad Internet
ECHO 4. Temp deletion
ECHO 5. Flush DNS
ECHO 6. Exit
ECHO.

CHOICE /C 123456 /M "Enter your choice:"

:: Note - list ERRORLEVELS in decreasing order
IF ERRORLEVEL 6 GOTO Exit
IF ERRORLEVEL 5 GOTO Flush DNS
IF ERRORLEVEL 4 GOTO Temp Deleting
IF ERRORLEVEL 3 GOTO Bad Internet
IF ERRORLEVEL 2 GOTO Bad file remover
IF ERRORLEVEL 1 GOTO Files Fixer
:Flush DNS
ECHO DNS Flushing...
ipconfig /flushdns
TIMEOUT /T 2 /NOBREAK >NUL
GOTO AskAnotherOption

:Temp Deleting
ECHO Deleting Temps... 
del /q/f/s %TEMP%\
TIMEOUT /T 2 /NOBREAK >NUL
GOTO AskAnotherOption

:Bad Internet
ECHO Reseting IP...
NETSH INT IP RESET
TIMEOUT /T 2 /NOBREAK >NUL
GOTO AskAnotherOption

:Bad file remover
ECHO Removing Files... 
ECHO !!===!!Restart Pc to apply effect!!===!!
CLEANMGR
TIMEOUT /T 4 /NOBREAK >NUL
GOTO AskAnotherOption

:Files Fixer
ECHO Fixing Files... 
SFC /SCANNOW
TIMEOUT /T 2 /NOBREAK >NUL
GOTO AskAnotherOption

:AskAnotherOption
ECHO.
CHOICE /C YN /M "Do you want to choose another option? (Y/N)"
IF ERRORLEVEL 2 GOTO End
IF ERRORLEVEL 1 GOTO Start

:Exit
ECHO============
ECHO !!Goodbye!!
ECHO============
TIMEOUT /T 4 /NOBREAK >NUL
GOTO End


:End
