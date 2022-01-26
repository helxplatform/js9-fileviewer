#!/bin/sh
echo Starting node js9Helper.js
node js9Helper.js 1>/tmp/js9node.log 2>&1 &
echo Starting python3 http.server
python3 -u -m http.server 8080
echo done.
