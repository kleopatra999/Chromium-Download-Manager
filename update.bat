@echo off
title Chromium-Download-Manager
PUSHD %~dp0
cd /d "%~dp0"

:Ver
Ver|Find /I "5.1" > nul 2>nul 2>nul
If "%ERRORLEVEL%"=="0" (Goto Files check)
Ver|Find /I "5.2" > nul 2>nul 2>nul
If "%ERRORLEVEL%"=="0" (Goto Files check)
Ver|Find /I "6.0" > nul 2>nul 2>nul
If "%ERRORLEVEL%"=="0" (Goto Files check)
Ver|Find /I "6.1" > nul 2>nul 2>nul
If "%ERRORLEVEL%"=="0" (Goto Files check)
Ver|Find /I "6.2" > nul 2>nul 2>nul
If "%ERRORLEVEL%"=="0" (Goto Files check)
Ver|Find /I "6.3" > nul 2>nul 2>nul
If "%ERRORLEVEL%"=="0" (Goto Files check)
Cls 
Echo ��Ǹ��ȡϵͳ�汾������ȷ�����ϵͳ�Ƿ�ΪWindows XP/2003/Vista/2008/7/2008 R2/8/8.1����������˳���
Pause>nul
exit

:Files check
if not exist 7za_x86.exe  echo.&echo.&echo.&echo.&echo.&echo.&echo                                    ȱ�� 7za_x86.exe�����������ء�&echo.&echo.&echo.&echo.&echo
if exist "aria2\aria2c.exe" set aria2c="aria2\aria2c.exe" &goto Main
if exist "D:\�����\��ɫ����\���繤��\�ϴ�����\aria2\x64\aria2c.exe" set aria2c="D:\�����\��ɫ����\���繤��\�ϴ�����\aria2\x64\aria2c.exe"
if not exist "aria2\aria2c.exe" if not exist "D:\�����\��ɫ����\���繤��\�ϴ�����\aria2\x64\aria2c.exe"  echo.&echo.&echo.&echo.&echo.&echo.&echo                                    ȱ�� aria2�����������ء�&echo.&echo.&echo.&echo.&echo

:Main
cls
echo.
echo     ���� ����/���� Chromium......
echo.&echo.
echo     1)���أ�Chromium
echo     2)���ã���ѹ������������Ŀ¼
echo     3)������ݷ�ʽ��·������ʱ������ Chromium.bat �� Chromium-PPAPI-FLASH.bat��
echo.&echo.
echo     4)ɾ�������صİ�װ�ļ������ⲻͬ�ļ�����ضϵ�������
echo.
echo.&echo.
echo     ��л��������
echo     1)�� phuslu �� chromium ��Ŀ�����ϸĽ���
echo     2)������32λ�� 7-Zip �����а汾���ڽ�ѹ����
echo     3)7-Zip ������ GNU LGPL Э�飬www.7-zip.org ���ܹ��ҵ���Դ���룻
echo     4)������ aria2 �� HTTP �������������ݡ�
echo.&echo.
echo     �汾��2015/1/28��������Phuslu��Hugo��
echo.
echo ---------------------------------------------------------------------------
echo.
SET /P ST=   ���������֣�
echo. 
if /I "%ST%"=="1" goto Download
if /I "%ST%"=="2" goto Config
if /I "%ST%"=="3" goto Link
if /I "%ST%"=="4" goto Delete
echo    ��Чѡ�񣬰���������أ�
pause >nul
goto Main

:Download
cls
echo.
echo     ���� ���� Chromium......
echo.&echo. 
echo     ������ %aria2c% ���ء�
echo.&echo. 
echo     1)ֱ�����أ���ʹ�ô���
echo     2)�Զ�����������أ�IP ��ַ/������
echo     3)�������أ������� HTTP/HTTPS ���ش���ͻ��ˣ�
echo.
echo     4)�������˵�
echo.&echo.
echo     ��л��������
echo     1)�� phuslu �� chromium ��Ŀ�����ϸĽ���
echo     2)������32λ�� 7-Zip �����а汾���ڽ�ѹ����
echo     3)7-Zip ������ GNU LGPL Э�飬www.7-zip.org ���ܹ��ҵ���Դ���룻
echo     4)������ aria2 �� HTTP �������������ݡ�
echo.&echo.
echo     �汾��2015/1/28��������Phuslu��Hugo��
echo.
echo ---------------------------------------------------------------------------
echo.
SET /P ST=   ���������֣�
echo. 
if /I "%ST%"=="1" goto Download_Direct
if /I "%ST%"=="2" goto Download_Custom
if /I "%ST%"=="3" goto Download_Proxy
if /I "%ST%"=="4" goto Main
echo    ��Чѡ�񣬰���������أ�
pause >nul
goto Download

:Download_Direct
set Server=www.google.com.hk
SET CA=--check-certificate=true
goto Download_Link

:Download_Custom
SET /P Server=   ������ IP ��ַ/������
SET CA=--check-certificate=false
goto Download_Link

:Download_Proxy
set Server=www.google.com.hk
SET CA=--check-certificate=true
SET Proxy=--all-proxy=127.0.0.1:
SET /P Port=   ������ HTTP/HTTPS ����ͻ��˵Ķ˿ںţ�

:Download_Link
if not exist chrome-win32.zip.aria2 if exist chrome-win32.zip del chrome-win32.zip
if exist LAST_CHANGE del LAST_CHANGE
%aria2c% -c -s16 -x16 -k1m --remote-time=true --connect-timeout=30 %CA% --enable-mmap --file-allocation=falloc --disk-cache=64M %Proxy%%Port% -o LAST_CHANGE --header=Host:commondatastorage.googleapis.com https://%Server%/chromium-browser-snapshots/Win/LAST_CHANGE
if not exist LAST_CHANGE goto Download_Link
(
    fc LAST_CHANGE chrome-win32\LAST_CHANGE
) && (
    echo Already Lastest Version ! && pause>NUL
) || (
    for /f %%I in (LAST_CHANGE) do (
        %aria2c% -c -s16 -x16 -k1m --remote-time=true %CA% --enable-mmap --file-allocation=falloc --disk-cache=64M %Proxy%%Port% -o chrome-win32.zip --header=Host:commondatastorage.googleapis.com https://%Server%/chromium-browser-snapshots/Win/%%I/chrome-win32.zip
    )
) 
if not exist chrome-win32.zip goto Download_Link

:Config
(
    if exist chrome-win32 rd /s /q chrome-win32
    7za_x86 x chrome-win32.zip
) && (
    copy /y LAST_CHANGE "chrome-win32\LAST_CHANGE"
) && (
    if not exist "chrome-win32\plugins" (md "chrome-win32\plugins")
    for %%I in ("np*.dll") do (
      copy /y "%%~I" "chrome-win32\plugins\%%~nxI"
    )
) && (
    if not exist "%~dp0Data" (md "%~dp0Data")
) 
goto Finish

:Link
shortcut.exe /A:C /F:"Chromium.lnk" /T:"%~dp0chrome-win32\chrome.exe" /P:"--no-first-run --User-data-dir="%~dp0Data" --disk-cache-dir="%USERPROFILE%\ChromeCache""" /W:"%~dp0chrome-win32"
shortcut.exe /A:C /F:"Chromium-PPAPI-FLASH.lnk" /T:"%~dp0chrome-win32\chrome.exe" /P:"--no-first-run --User-data-dir="%~dp0Data" --disk-cache-dir="%USERPROFILE%\ChromeCache" --ppapi-flash-path=%~dp0pepflashplayer.dll --ppapi-flash-version=16.0.0.296"" /W:"%~dp0chrome-win32"
goto Finish

:Delete
if exist chrome-win32.zip del chrome-win32.zip
if exist chrome-win32.zip.aria2 del chrome-win32.zip.aria2

:Finish
echo.&echo    ������ɣ�����������ء�
pause >nul &goto Main