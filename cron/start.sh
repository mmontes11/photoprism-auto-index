#!/usr/bin/env bash

LOG="/var/log/photoprism-cron.log"
CRONTAB="/photoprism/cron/crontab"

if [ "$PHOTOPRISM_AUTO_INDEX_CRON" = "" ]; then
  PHOTOPRISM_AUTO_INDEX_CRON="* 6 * * *"
fi

touch "$LOG"

echo "$PHOTOPRISM_AUTO_INDEX_CRON /photoprism/cron/index.sh 2>> $LOG\\n" > "$CRONTAB"
crontab "$CRONTAB"

/photoprism/cron/generate-cron.sh

rsyslogd
cron
photoprism start