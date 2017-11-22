#!/bin/bash
PORT=2000
kill -9 `lsof -ni :$PORT | awk '{print $2}' | grep -e [[:digit:]]`
screen -dmS client_vpex starman --workers=2 --listen :$PORT bin/app_starman.pl