# pause#!/bin/bash
export config=./settings.toml

# Do not use proxy
export no_proxy=*

# bind host and port (can edit)
host=0.0.0.0
port=2233

kill -9 $(ps aux | grep '[b]lrec' | awk '{print $2}')
nohup blrec -c $config --open --host $host --port $port --api-key "$RECORD_KEY" &
if [ $? -eq 0 ]; then
    echo "success"
else
    echo "An error occurred while starting blrec. Check the logs for details."
fi