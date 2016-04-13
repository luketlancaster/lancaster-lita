require 'dotenv'


Dotenv.tap do |de|
    de.load(ENV['LITA_ENV']) if ENV['LITA_ENV']
    de.load
end

Lita.configure do |config|
  # Config for shell adapter
  config.robot.name = ENV['LITA_NAME']

  # The locale code for the language to use.
  # config.robot.locale = :en

  # The severity of messages to log. Options are:
  # :debug, :info, :warn, :error, :fatal
  # Messages at the selected level and above will be logged.
  config.robot.log_level = ENV['LOG_LEVEL'].intern

  # An array of user IDs that are considered administrators. These users
  # the ability to add and remove other users from authorization groups.
  # What is considered a user ID will change depending on which adapter you use.
  # config.robot.admins = ["1", "2"]

  # The adapter you want to connect with. Make sure you've added the
  # appropriate gem to the Gemfile.
  config.robot.adapter = ENV['LITA_ADAPTER'].intern

  # Config for slack adapter
  config.adapters.slack.token = ENV['SLACK_TOKEN']

  # Redis
  # config.redis.host = ENV['REDIS_HOST']
  # config.redis.port = ENV['REDIS_PORT']
  config.redis[:url] = ENV['REDISTOGO_URL']
  config.http.port = ENV['PORT']
  ## Example: Set options for the chosen adapter.
  # config.adapter.username = "myname"
  # config.adapter.password = "secret"

  ## Example: Set options for the Redis connection.
  # config.redis.host = "127.0.0.1"
  # config.redis.port = 1234

  ## Example: Set configuration for any loaded handlers. See the handler's
  ## documentation for options.
  # config.handlers.some_handler.some_config_key = "value"
end
