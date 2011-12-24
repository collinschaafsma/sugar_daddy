require 'mongoid'

SugarDaddy.configure do |config|
  config.backend = :mongoid
end

# Mongoid.load!("mongoid.yml")

Mongoid.configure do |config|
  name = "sugar_daddy_test"
  host = "127.0.0.1"
  config.master = Mongo::Connection.new.db(name)
end

# Mongoid.configure do |config|
#  config.from_hash(
#    "host" => "127.0.0.1",
#    "autocreate_indexes" => false,
#    "allow_dynamic_fields" => true,
#    "include_root_in_json" => false,
#    "parameterize_keys" => true,
#    "persist_in_safe_mode" => true,
#    "raise_not_found_error" => true,
#    "reconnect_time" => 3,
#    "use_activesupport_time_zone" => true,
#    "database" => "sugar_daddy_test"
#  )
#end
