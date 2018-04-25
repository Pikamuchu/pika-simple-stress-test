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
  echo    stress-test [chunks] [data-file] - run the stress tests (also starts and stops chrome). 
  echo      - chunks: Number of concurrent url calls. Default 4.
  echo      - data-file: File that contains url test data. Default data/test-samples.txt.
  echo    stress-test-docker - run stress-test using a chrome headless docker.
  echo    start-chrome - start chrome in headless mode.
  echo    stop-chrome - stop chrome.
  echo    format - auto format project code using prettier.

  exit /b 1
)

:end