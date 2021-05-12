#!/usr/bin/env bash

rsyslogd
/photoprism/cron/generate-cron.sh
cron
touch /var/log/photoprism-cron.log
photoprism start