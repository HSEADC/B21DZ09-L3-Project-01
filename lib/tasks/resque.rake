require 'resque/tasks'
require 'resque/scheduler/tasks'

task "resque:setup" => :environment do
  Resque.schedule = YAML.load_file(
  "#{Rails.root}/schedule.yml"
  )
  ENV['QUEUES'] = 'default,digest'
end