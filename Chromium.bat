@echo off
if not exist chrome-win32\chrome.exe  echo.&echo.&echo.&echo.&echo.&echo.&echo                          未发现 chrome-win32\chrome.exe，按任意键退出。&echo.&echo.&echo.&echo.&echo                                         按任意键返回&pause>nul& exit
start %~dp0chrome-win32\chrome.exe --no-first-run --User-data-dir="%~dp0Data" --disk-cache-dir="%USERPROFILE%\ChromeCache"