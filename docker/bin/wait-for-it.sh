#!/bin/bash
# wait_for_mysql.sh

set -e

cmd="$@"
host="$XUKA_DATABASE_HOST"
user="$XUKA_DATABASE_USERNAME"
export MYSQL_PWD="$XUKA_API_DATABASE_PASSWORD"

until mysql -u$user -h$host -e 'SELECT 1' &> /dev/null; do
  >&2 echo "MySQL is unavailable - sleeping"
  sleep 1
done

[ -f /tmp/xukabot.pid ] && rm /tmp/xukabot.pid || echo "Not found"
>&2 echo "MySQL is up - executing command"
exec $cmd
