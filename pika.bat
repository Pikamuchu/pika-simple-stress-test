@echo off

set COMMAND=%1
set PARAMS=%2 %3 %4

if "%COMMAND%" == "start-chrome" (
  call scripts/start-chrome-headless.bat

) else if "%COMMAND%" == "stop-chrome" (
  call scripts/stop-chrome-headless.bat

) else if "%COMMAND%" == "stress-test" (
  call scripts/start-chrome-headless.bat
  call npm run stress-test -- %PARAMS%
  call scripts/stop-chrome-headless.bat

) else if "%COMMAND%" == "format" (
  call npm run prettier

) else (
  echo.
  echo Usage: pika [command]
  echo.
  echo where [command] is one of:
  echo    stress-test [chunks] [data-file.txt] - execute simple stress tests. 
  echo      - chunks: parallel calls. 
  echo      - data-file.txt: data file to use.
  echo    format - auto format project code using prettier.

  exit /b 1
)

:end