@echo off
cd /d "%~dp0"
cd..
Tools\shortcut.exe /A:C /F:"Chromium.lnk" /T:"%cd%\chrome-win32\chrome.exe" /P:--User-data-dir=""""%cd%\Data""" --disk-cache-dir="""%USERPROFILE%\ChromiumCache"""" /W:"%cd%\chrome-win32" /D:"���ʻ�����"
Tools\shortcut.exe /A:C /F:"Chromium Ӧ��������.lnk" /T:"%cd%\chrome-win32\chrome.exe" /P:--User-data-dir=""""%cd%\Data""" --disk-cache-dir="""%USERPROFILE%\ChromiumCache""" --show-app-list" /W:"%cd%\chrome-win32"  /I:"%cd%\chrome-win32\chrome.exe,1" /D:"Chromium Ӧ��������"
if not exist pepflashplayer.dll exit
Tools\shortcut.exe /A:C /F:"Chromium-PPAPI-FLASH.lnk" /T:"%cd%\chrome-win32\chrome.exe" /P:--User-data-dir=""""%cd%\Data""" --disk-cache-dir="""%USERPROFILE%\ChromiumCache""" --ppapi-flash-path="""%cd%\pepflashplayer.dll""" --ppapi-flash-version=17.0.0.134" /W:"%cd%\chrome-win32" /D:"���ʻ�����"
Tools\shortcut.exe /A:C /F:"Chromium-PPAPI-FLASH Ӧ��������.lnk" /T:"%cd%\chrome-win32\chrome.exe" /P:--User-data-dir=""""%cd%\Data""" --disk-cache-dir="""%USERPROFILE%\ChromiumCache""" --show-app-list --ppapi-flash-path="""%cd%\pepflashplayer.dll""" --ppapi-flash-version=17.0.0.134" /W:"%cd%\chrome-win32"  /I:"%cd%\chrome-win32\chrome.exe,1" /D:"Chromium-PPAPI-FLASH Ӧ��������"
exit