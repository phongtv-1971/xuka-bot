source "https://rubygems.org"
git_source(:github) {|repo| "https://github.com/#{repo}.git"}

ruby "2.5.3"
gem "bootsnap", ">= 1.4.2", require: false
gem "chatwork"
gem "config"
gem "dentaku"
gem "devise"
gem "figaro"
gem "google_drive"
gem "jbuilder", "~> 2.7"
gem "puma", "~> 4.1"
gem "rack-cors"
gem "rails", "~> 6.0.3", ">= 6.0.3.4"
gem "sass-rails", ">= 6"
gem "sidekiq"
gem "strip_attributes"
gem "turbolinks", "~> 5"
gem "webpacker", "~> 4.0"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "mysql2", ">= 0.4.4"
  gem "pry-byebug"
  gem "pry-rails"
end

group :development do
  gem "listen", "~> 3.2"
  gem "rubocop", require: false
  gem "rubocop-checkstyle_formatter", require: false
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
