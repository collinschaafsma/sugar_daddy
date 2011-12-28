require 'mongoid'

SugarDaddy.configure do |config|
  config.backend = :mongoid
end

Mongoid.configure do |config|
  name = "sugar_daddy_test"
  host = "127.0.0.1"
  config.use_utc = false
  config.use_activesupport_time_zone = true
  config.master = Mongo::Connection.new.db(name)
end

# Drop all collections except for system indexes
RSpec.configure do |config|
  config.after :all do
    Mongoid.master.collections.select { |c| c.name != 'system.indexes' }.each(&:drop)
  end
end
