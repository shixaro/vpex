#!/bin/bash
kill -9 `lsof -ni :4000 | awk '{print $2}'`
screen -dmS server_vpex starman --workers=2 --listen :4000 bin/app_starman.pl