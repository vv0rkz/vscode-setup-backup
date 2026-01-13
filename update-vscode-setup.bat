@echo off
echo ========================================
echo VSCode Settings Backup
echo ========================================

REM Копируем настройки из AppData
echo [1/4] Copying settings.json...
copy "%APPDATA%\Code\User\settings.json" "settings.json" /Y

echo [2/4] Copying keybindings.json...
copy "%APPDATA%\Code\User\keybindings.json" "keybindings.json" /Y

echo [3/4] Copying snippets...
if not exist "snippets" mkdir snippets
xcopy "%APPDATA%\Code\User\snippets\*" "snippets\" /Y /E /I

echo [4/4] Exporting extensions list...
code --list-extensions > extensions.txt

echo.
echo ========================================
echo Backup completed!
echo ========================================
echo.
echo Do you want to push to Git? (Y/N)
set /p choice=
if /i "%choice%"=="Y" goto git_push
goto end

:git_push
echo.
echo [Git] Adding files...
git add .
echo [Git] Creating commit...
git commit -m "Backup: %date% %time%"
echo [Git] Pushing to origin...
git push origin main
echo.
echo Git push completed!

:end
echo.
pause
