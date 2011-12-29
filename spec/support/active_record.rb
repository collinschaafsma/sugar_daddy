require 'active_record'
require 'sqlite3'

root = File.dirname(__FILE__)
test_db = "#{root}/db/sugar_daddy_test.sqlite3"

SQLite3::Database.new( test_db ) unless File.exists?( test_db )

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => test_db
)

require 'support/db/schema.rb'

SugarDaddy.configure do |config|
  config.backend = :activerecord
end

RSpec.configure do |config|

  config.after :all do

    ActiveRecord::Base.connection.tables.each do |table|

      unless ['schema_migrations'].include?(table)
        ActiveRecord::Base.connection.execute("DELETE FROM #{table}")
        ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence where name='#{table}'")
      end

    end

    ActiveRecord::Base.connection.execute("VACUUM")

  end

end
