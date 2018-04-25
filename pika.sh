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
  echo "   stress-test [chunks] [data-file] -> run the stress tests (also starts and stops chrome)."
  echo "     - chunks: Number of concurrent url calls. Default 4."
  echo "     - data-file: File that contains url test data. Default data/test-samples.txt."
  echo "   stress-test-docker -> run stress-test using a chrome headless docker."
  echo "   start-chrome -> start chrome in headless mode."
  echo "   stop-chrome -> stop chrome."
  echo "   format -> auto format project code using prettier."

  exit 1

fi
