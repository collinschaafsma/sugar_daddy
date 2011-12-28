module SugarDaddy::ModelAdapters::Base::Models::AccessToken

  extend ActiveSupport::Concern

  included do

    belongs_to :client, :class_name => SugarDaddy.client_class_name, :foreign_key => :client_id
    belongs_to :refresh_token, :class_name => SugarDaddy.refresh_token_class_name, :foreign_key => :refresh_token_id

    validates :client, :presence => true

    before_validation(:on => :create) do
      # If we have a refresh_token and the expires_at is less than what we set the access_token to expires_at
      # the refresh_token expires_at trumps the access_token expires_at
      self.expires_at = [self.expires_at, refresh_token.expires_at].compact.min if refresh_token
    end

  end

end
