Resque.schedule = YAML.load_file('schedule.yml')
Resque.logger           = Logger.new("#{Rails.root}/log/resque.log")
Resque.logger.level     = Logger::DEBUG
Resque.logger.formatter = ::Logger::Formatter.new   # This is important