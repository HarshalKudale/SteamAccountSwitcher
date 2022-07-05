@echo off
set username=username1
set username2=username2

TITLE Steam Account Switcher
TASKKILL /F /IM steam.exe
REG COMPARE HKCU\Software\Valve\Steam HKCU\Software\Valve\AccountSwitcher /v AutoLoginUser
IF NOT ERRORLEVEL 1 goto smurf

echo Opening darkdynamo2
REG ADD "HKCU\Software\Valve\Steam" /v AutoLoginUser /t REG_SZ /d %username% /f
REG ADD "HKCU\Software\Valve\Steam" /v RememberPassword /t REG_DWORD /d 1 /f
goto END

:smurf
echo opening gamebeastsharshal
REG ADD "HKCU\Software\Valve\Steam" /v AutoLoginUser /t REG_SZ /d %username2% /f
REG ADD "HKCU\Software\Valve\Steam" /v RememberPassword /t REG_DWORD /d 1 /f
goto END

:END

start steam:\\open\main
echo Account Switch successful 
timeout /T 2 /nobreak
echo HKCU\Software\Valve\Steam /v AutoLoginUser
EXIT
