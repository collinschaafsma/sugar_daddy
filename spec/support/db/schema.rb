unless ActiveRecord::Base.connection.table_exists? :oauth_clients
  ActiveRecord::Base.connection.create_table :oauth_clients do |t|
    t.string :name
    t.string :redirect_uri
    t.string :website
    t.string :oauth_identifier
    t.string :secret
    t.timestamps
  end
  ActiveRecord::Base.connection.add_index(:oauth_clients, :oauth_identifier, :unique => true)
end


unless ActiveRecord::Base.connection.table_exists? :oauth_access_tokens
  ActiveRecord::Base.connection.create_table :oauth_access_tokens do |t|
    t.belongs_to :client, :refresh_token
    t.string :token
    t.datetime :expires_at
    t.timestamps
  end
  ActiveRecord::Base.connection.add_index(:oauth_access_tokens, :token, :unique => true)
  ActiveRecord::Base.connection.add_index(:oauth_access_tokens, :expires_at)
  ActiveRecord::Base.connection.add_index(:oauth_access_tokens, :client_id)
end

unless ActiveRecord::Base.connection.table_exists? :oauth_refresh_tokens
  ActiveRecord::Base.connection.create_table :oauth_refresh_tokens do |t|
    t.belongs_to :client
    t.string :token
    t.datetime :expires_at
    t.timestamps
  end
  ActiveRecord::Base.connection.add_index(:oauth_refresh_tokens, :token, :unique => true)
  ActiveRecord::Base.connection.add_index(:oauth_refresh_tokens, :expires_at)
  ActiveRecord::Base.connection.add_index(:oauth_refresh_tokens, :client_id)
end

unless ActiveRecord::Base.connection.table_exists? :oauth_authorization_codes
  ActiveRecord::Base.connection.create_table :oauth_authorization_codes do |t|
    t.belongs_to :client
    t.string :token
    t.datetime :expires_at
    t.timestamps
  end
  ActiveRecord::Base.connection.add_index(:oauth_authorization_codes, :token, :unique => true)
  ActiveRecord::Base.connection.add_index(:oauth_authorization_codes, :expires_at)
  ActiveRecord::Base.connection.add_index(:oauth_authorization_codes, :client_id)
end
