#!/usr/bin/env bash
# start_sidekiq.sh

bundle install

bundle exec sidekiq
