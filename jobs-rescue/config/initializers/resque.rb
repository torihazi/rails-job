Resque.redis = ENV.fetch('REDIS_URL', 'redis://localhost:6379/0')

if Rails.env.development?
    Resque.logger = Logger.new(STDOUT)
    Resque.logger.level = Logger::INFO
end