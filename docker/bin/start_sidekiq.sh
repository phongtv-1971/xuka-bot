#!/usr/bin/env bash
# start_sidekiq.sh

enviroiment=$1

RAILS_ENV=$enviroiment bundle install

RAILS_ENV=$enviroiment bundle exec rails db:prepare db:migrate

RAILS_ENV=$enviroiment bundle exec sidekiq
