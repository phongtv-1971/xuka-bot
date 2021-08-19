#!/usr/bin/env bash
# start_rails.sh

yarn install --check-files

bundle install -e production

bundle exec rails db:prepare db:migrate -e production

bundle exec rails webpacker:compile -e production

bundle exec rails s -p 3000 -P /tmp/xukabot.pid -b '0.0.0.0' -e production
