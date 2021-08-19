FROM ruby:2.5.3-alpine

ENV BUNDLER_VERSION=2.2.15

RUN apk add --no-cache --update build-base mariadb-client mariadb-dev tzdata imagemagick yarn

WORKDIR /xukabot

COPY Gemfile* /xukabot/

COPY package.json /xukabot/
COPY yarn.lock /xukabot/

RUN gem install bundler -v 2.2.15

RUN bundle install

RUN yarn install --check-files

EXPOSE 3000
