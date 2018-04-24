#!/bin/bash

COMMAND=$1
PARAMS=$2 $3 $4

if [ "$COMMAND" = "start-chrome" ]; then
  ./scripts/start-chrome-headless.sh

elif [ "$COMMAND" = "stop-chrome" ]; then
  ./scripts/stop-chrome-headless.sh

elif [ "$COMMAND" = "stress-test" ]; then
  ./scripts/start-chrome-headless.sh
  npm run stress-test -- $PARAMS
  ./scripts/stop-chrome-headless.sh

elif [ "$COMMAND" = "stress-test-docker" ]; then
  ./scripts/docker-run-chrome-headless.sh
  npm run stress-test -- $PARAMS
  ./scripts/docker-stop-chrome-headless.sh

elif [ "$COMMAND" = "format" ]; then
  npm run prettier

else
  echo ""
  echo "Usage: pika [command]"
  echo ""
  echo "where [command] is one of:"
  echo "   stress-test [chunks] [data-file] -> execute simple stress tests."
  echo "     - chunks: number of concurrents calls. Default 4."
  echo "     - data-file: data file to use. Default data/test-samples.txt."
  echo "   format -> auto format project code using prettier."

  exit 1

fi
