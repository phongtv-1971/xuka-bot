#!/usr/bin/env bash
# start_rails.sh

enviroiment=$1

yarn install --check-files

RAILS_ENV=$enviroiment bundle install

RAILS_ENV=$enviroiment bundle exec rails db:prepare db:migrate

RAILS_ENV=$enviroiment bundle exec rails webpacker:compile

RAILS_ENV=$enviroiment bundle exec rails s -p 3000 -P /tmp/xukabot.pid -b '0.0.0.0'
