#!/bin/bash
echo "*********** Starting chrome in headless mode ***********"
echo "*"

chrome --remote-debugging-port=9222 --headless

echo "* Storing pid %pid% to ./processes/chrome.pid"
echo "*"

pid=`ps -ef | grep chrome | grep "$(whoami)" | awk '{ print $2 }'`
echo $pid > ".\processes\chrome.pid"