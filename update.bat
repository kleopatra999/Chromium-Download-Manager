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
if not exist 7za_x86.exe  echo.&echo.&echo.&echo.&echo.&echo.&echo                                    ȱ�� 7za_x86.exe�����������ء�&echo.&echo.&echo.&echo.&echo                                         ��������˳�&pause>nul& exit
if exist "aria2\aria2c.exe" Set aria2c="aria2\aria2c.exe" &goto Main
if exist "D:\�����\��ɫ����\���繤��\�ϴ�����\aria2\x64\aria2c.exe" Set aria2c="D:\�����\��ɫ����\���繤��\�ϴ�����\aria2\x64\aria2c.exe"
if not exist "aria2\aria2c.exe" if not exist "D:\�����\��ɫ����\���繤��\�ϴ�����\aria2\x64\aria2c.exe"  echo.&echo.&echo.&echo.&echo.&echo.&echo                                    ȱ�� aria2�����������ء�&echo.&echo.&echo.&echo.&echo                                         ��������˳�&pause>nul& exit

:Main
cls
echo.
echo     ���� ����/���� Chromium......
echo.&echo.
echo     1)���أ�Chromium
echo     2)���ã���ѹ���������û�����Ŀ¼����ݷ�ʽ
echo     3)������ݷ�ʽ��·������ʱ������ Chromium.bat �� Chromium-PPAPI-FLASH.bat��
echo.
echo     4)���£�PPAPI-FLASH��pepflashplayer.dll,Chromium-PPAPI-FLASH.lnk,Chromium-PPAPI-FLASH.bat��
echo.&echo.
echo     5)ɾ�������ص��ļ������ⲻͬ�ļ�����ضϵ�������
echo.
echo.&echo.
echo     ��л��������
echo     1)�� phuslu �� chromium ��Ŀ�����ϸĽ���
echo     2)������32λ�� 7-Zip �����а汾���ڽ�ѹ����
echo     3)7-Zip ������ GNU LGPL Э�飬www.7-zip.org ���ܹ��ҵ���Դ���룻
echo     4)������ aria2 �� HTTP �������������ݡ�
echo.&echo.
echo     �汾��2015/3/17��������Hugo��
echo.
echo ---------------------------------------------------------------------------
echo.
Set /P ST=   ���������֣�
echo. 
if /I "%ST%"=="1" goto Download
if /I "%ST%"=="2" goto Config
if /I "%ST%"=="3" goto Shortcut
if /I "%ST%"=="4" goto Flash
if /I "%ST%"=="5" goto Delete
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
echo     1)ֱ�����أ�www.google.co.jp��
echo.
echo     2)ֱ�����أ�www.google.com.hk��
echo     3)ֱ�����أ�dl.google.com��
echo.&echo. 
echo     4)�Զ�����������أ�IP ��ַ/������
echo     5)�������أ������� HTTP/HTTPS ���ش���ͻ��ˣ�
echo.
echo     4)�������˵�
echo.&echo.
echo     ��л��������
echo     1)�� phuslu �� chromium ��Ŀ�����ϸĽ���
echo     2)������32λ�� 7-Zip �����а汾���ڽ�ѹ����
echo     3)7-Zip ������ GNU LGPL Э�飬www.7-zip.org ���ܹ��ҵ���Դ���룻
echo     4)������ aria2 �� HTTP �������������ݡ�
echo.&echo.
echo     �汾��2015/3/17��������Hugo��
echo.
echo ---------------------------------------------------------------------------
echo.
Set /P ST=   ���������֣�
echo. 
if /I "%ST%"=="1" goto Download_Direct_1
if /I "%ST%"=="2" goto Download_Direct_2
if /I "%ST%"=="3" goto Download_Direct_3
if /I "%ST%"=="4" goto Download_Custom
if /I "%ST%"=="5" goto Download_Proxy
if /I "%ST%"=="6" goto Main
echo    ��Чѡ�񣬰���������أ�
pause >nul
goto Download

:Download_Direct_1
Set Server=www.google.co.jp
Set CA=--check-certificate=true
goto Download_Link

:Download_Direct_2
Set Server=www.google.com.hk
Set CA=--check-certificate=true
goto Download_Link

:Download_Direct_3
Set Server=dl.google.com
Set CA=--check-certificate=true
goto Download_Link

:Download_Custom
Set /P Server=   ������ IP ��ַ/������
Set CA=--check-certificate=false
goto Download_Link

:Download_Proxy
Set Server=www.google.com.hk
Set CA=--check-certificate=true
Set Proxy=--all-proxy=127.0.0.1:
Set /P Port=   ������ HTTP/HTTPS ����ͻ��˵Ķ˿ںţ�

:Download_Link
if not exist chrome-win32.zip.aria2 if exist chrome-win32.zip del chrome-win32.zip
if exist LAST_CHANGE del LAST_CHANGE
%aria2c% -c -s16 -x16 -k1m --remote-time=true --connect-timeout=30 %CA% --enable-mmap --file-allocation=falloc --disk-cache=64M %Proxy%%Port% -o LAST_CHANGE --header=Host:commondatastorage.googleapis.com https://%Server%/chromium-browser-snapshots/Win/LAST_CHANGE
if not exist LAST_CHANGE echo.&echo    ����ʧ�ܣ�����������ء�&pause >nul&goto Download
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
goto Finish

:Config
if not exist chrome-win32.zip  echo                      δ���� chrome-win32.zip���뷵�ز˵��� 1 ���ء�&echo.&echo.&echo.&echo.&echo                                         �����������&pause>nul& goto Main
pause
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
7za_x86 x pepflashplayer.7z

:Shortcut
if not exist chrome-win32\chrome.exe  echo                      δ���� chrome-win32\chrome.exe���뷵�ز˵��� 2 ���á�&echo.&echo.&echo.&echo.&echo                                         �����������&pause>nul& goto Main
pause
start /min Create-Shortcut.bat
goto Finish

:Delete
if exist chrome-win32.zip del chrome-win32.zip
if exist chrome-win32.zip.aria2 del chrome-win32.zip.aria2
goto Finish

:Flash
Set CA=--check-certificate=true
rem Set Proxy=--all-proxy=127.0.0.1:
rem Set /P Port=   ������ HTTP/HTTPS ����ͻ��˵Ķ˿ںţ�
if not exist LAST_PepperFlash.aria2 if exist LAST_PepperFlash del LAST_PepperFlash
%aria2c% -c -s16 -x16 -k1m --remote-time=true --connect-timeout=30 %CA% --enable-mmap --file-allocation=falloc --disk-cache=64M %Proxy%%Port% -O https://github.com/xinhugo/Chromium-Download-Manager/raw/Beta/LAST_PepperFlash
if not exist LAST_PepperFlash echo.&echo    ����ʧ�ܣ�����������ء�&pause >nul&goto Main
fc LAST_PepperFlash chrome-win32\LAST_PepperFlash &goto Shortcut
copy /y LAST_PepperFlash "chrome-win32\LAST_PepperFlash"
if not exist pepflashplayer.7z.aria2 if exist pepflashplayer.7z del pepflashplayer.7z
%aria2c% -c -s16 -x16 -k1m --remote-time=true --connect-timeout=30 %CA% --enable-mmap --file-allocation=falloc --disk-cache=64M %Proxy%%Port% -O https://github.com/xinhugo/Chromium-Download-Manager/raw/Beta/pepflashplayer.7z
if not exist pepflashplayer.7z goto Flash
if exist pepflashplayer.dll del /s /q pepflashplayer.dll
if exist Chromium-PPAPI-FLASH.bat del /s /q Chromium-PPAPI-FLASH.bat
if exist Chromium-PPAPI-FLASH.lnk del /s /q Chromium-PPAPI-FLASH.lnk
7za_x86 x pepflashplayer.7z
goto Shortcut

:Finish
echo.&echo    ������ɣ�����������ء�
pause >nul &goto Main