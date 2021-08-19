Sidekiq.configure_server do |config|
  config.logger.level = Rails.application.config.log_level
  Rails.logger = Sidekiq.logger
  ActiveRecord::Base.logger = Sidekiq.logger
  ActiveJob::Base.logger = Sidekiq.logger

  config.redis = {url: ENV["REDIS_SERVER_URL"]}
end

Sidekiq.configure_client do |config|
  config.redis = {url: ENV["REDIS_SERVER_URL"]}
end
