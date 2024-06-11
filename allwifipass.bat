@echo off
setlocal enabledelayedexpansion

for /F "tokens=2 delims=:" %%a in ('netsh wlan show profile ^| findstr /r "^    Profile "') do (
    set "profile=%%a"
    for /F "tokens=2 delims=:" %%F IN ('netsh wlan show profile "!profile:~1!" key^=clear ^| find "Key Content"') do (
        set "wifi_pwd=%%F"
    )
    echo !profile:~1! : !wifi_pwd!
) >> wifi_passwords.txt
