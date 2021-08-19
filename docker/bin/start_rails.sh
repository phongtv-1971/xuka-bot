#!/usr/bin/env bash
# start_rails.sh

yarn install --check-files

bundle install

bundle exec rails db:prepare db:migrate

bundle exec rails webpacker:compile

bundle exec rails s -p 3000 -P /tmp/xukabot.pid -b '0.0.0.0' -e production
