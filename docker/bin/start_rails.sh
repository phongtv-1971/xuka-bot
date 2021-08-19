#!/usr/bin/env bash
# start_rails.sh

yarn install --check-files

RAILS_ENV=production bundle install

RAILS_ENV=production bundle exec rails db:prepare db:migrate

RAILS_ENV=production bundle exec rails webpacker:compile

bundle exec rails s -p 3000 -P /tmp/xukabot.pid -b '0.0.0.0' -e production
