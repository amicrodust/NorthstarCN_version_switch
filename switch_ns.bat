@echo off
setlocal

:: ===== 计算游戏根目录（强制规范化路径）=====
for %%I in ("%~dp0..") do set GAME_DIR=%%~fI

:: ===== 版本目录 =====
set V117=%GAME_DIR%\_ns_versions\1.17.7
set V118=%GAME_DIR%\_ns_versions\1.18.0

:: ===== mods 目录 =====
set MODS_DIR=%GAME_DIR%\R2Northstar\mods

echo.
echo ===============================
echo  Titanfall 2 Northstar 切换
echo ===============================
echo.
echo  [1] 切换到 1.17.7
echo  [2] 切换到 1.18.0
echo.

set /p CHOICE=请输入选项 (1/2):

if "%CHOICE%"=="1" goto TO_117
if "%CHOICE%"=="2" goto TO_118

echo 输入错误，脚本退出。
pause
exit /b


:TO_117
echo.
echo 切换到 1.17.7 ...

copy "%V117%\bin\x64_retail\wsock32.dll" "%GAME_DIR%\bin\x64_retail\wsock32.dll" /Y
copy "%V117%\Northstar.dll" "%GAME_DIR%\Northstar.dll" /Y
copy "%V117%\NorthstarLauncher.exe" "%GAME_DIR%\NorthstarLauncher.exe" /Y

rmdir "%MODS_DIR%\GtJt.HUDRevamp+KS8" /S /Q 2>nul

xcopy "%V117%\mods\Northstar.Client" "%MODS_DIR%\Northstar.Client" /E /I /Y
xcopy "%V117%\mods\Northstar.Custom" "%MODS_DIR%\Northstar.Custom" /E /I /Y
xcopy "%V117%\mods\Northstar.CustomServers" "%MODS_DIR%\Northstar.CustomServers" /E /I /Y

echo.
echo 已切换到 1.17.7
pause
exit /b


:TO_118
echo.
echo 切换到 1.18.0 ...

copy "%V118%\bin\x64_retail\wsock32.dll" "%GAME_DIR%\bin\x64_retail\wsock32.dll" /Y
copy "%V118%\Northstar.dll" "%GAME_DIR%\Northstar.dll" /Y
copy "%V118%\NorthstarLauncher.exe" "%GAME_DIR%\NorthstarLauncher.exe" /Y

xcopy "%V118%\mods\Northstar.Client" "%MODS_DIR%\Northstar.Client" /E /I /Y
xcopy "%V118%\mods\Northstar.Custom" "%MODS_DIR%\Northstar.Custom" /E /I /Y
xcopy "%V118%\mods\Northstar.CustomServers" "%MODS_DIR%\Northstar.CustomServers" /E /I /Y
xcopy "%V118%\mods\GtJt.HUDRevamp+KS8" "%MODS_DIR%\GtJt.HUDRevamp+KS8" /E /I /Y

echo.
echo 已切换到 1.18.0
pause
exit /b
