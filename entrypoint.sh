#!/bin/sh

CRON=${CRON:-"0 1 * * *"}

if [ -z "$ACTION_FILE" ]; then
    echo >&2 'error: missing required ACTION_FILE environment variable'
    echo >&2 '  Did you forget to -e ACTION_FILE=... ?'
    exit 1
fi

echo "$CRON curator ${ACTION_FILE}" >>/etc/crontabs/root

crond -f -d 8 -l 8
