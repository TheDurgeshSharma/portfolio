@echo off
title Durgesh Portfolio
cd /d "%~dp0"
set PORT=3000
where node >nul 2>nul
if %errorlevel%==0 (
  echo Starting portfolio with Node.js...
  start "" cmd /c "ping -n 3 127.0.0.1 >nul & start http://localhost:%PORT%"
  node server.js
  goto :end
)
where python >nul 2>nul
if %errorlevel%==0 (
  echo Starting portfolio with Python...
  start "" cmd /c "ping -n 3 127.0.0.1 >nul & start http://localhost:%PORT%"
  python -m http.server %PORT%
  goto :end
)
echo Node.js and Python not found. Opening the page directly...
start "" "%~dp0index.html"
:end
pause
