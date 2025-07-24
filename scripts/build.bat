@echo off
echo Searching for Visual Studio installation...

set "VSWHERE_PATH=%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe"
if not exist "%VSWHERE_PATH%" (
    echo ERROR: vswhere.exe not found. Cannot locate Visual Studio.
    pause
    goto :eof
)

for /f "usebackq tokens=*" %%i in (`"%VSWHERE_PATH%" -latest -property installationPath`) do (
    set "VS_PATH=%%i"
)

if not defined VS_PATH (
    echo ERROR: Could not find any Visual Studio installation.
    pause
    goto :eof
)

set "DEVENV_PATH=%VS_PATH%\Common7\IDE\devenv.exe"
if not exist "%DEVENV_PATH%" (
    echo ERROR: devenv.exe not found at the expected path.
    echo %DEVENV_PATH%
    pause
    goto :eof
)

echo Found Visual Studio: %DEVENV_PATH%
echo.
echo Starting build...

"%DEVENV_PATH%" "..\PortPop.sln" /Build "Release|Any CPU"

if %errorlevel% neq 0 (
    echo.
    echo ERROR: Build failed.
) else (
    echo.
    echo Build successful.
)
pause