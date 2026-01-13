@echo off
echo ========================================
echo VSCode Settings Init Setup For Current System
echo ========================================

echo [1/4] Restoring settings.json...
copy "settings.json" "%APPDATA%\Code\User\settings.json" /Y

echo [2/4] Restoring keybindings.json...
copy "keybindings.json" "%APPDATA%\Code\User\keybindings.json" /Y

echo [3/4] Restoring snippets...
xcopy "snippets\*" "%APPDATA%\Code\User\snippets\" /Y /E /I

echo [4/4] Installing extensions...
for /F "tokens=*" %%A in (extensions.txt) do (
    echo Installing: %%A
    code --install-extension %%A
)

echo.
echo ========================================
echo VSCode Settings Init Setup For Current System completed!
echo ========================================
pause
