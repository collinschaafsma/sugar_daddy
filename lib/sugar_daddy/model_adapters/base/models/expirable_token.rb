module SugarDaddy::ModelAdapters::Base::Models::ExpirableToken

  extend ActiveSupport::Concern

  included do

    validates :expires_at, :presence => true
    validates :token, :presence => true, :uniqueness => true

    after_initialize(:on => :create) do
      token_lifetime = self.class.name.to_s.split("::").last.underscore + "_lifetime"
      self.token      = SugarDaddy::Random.token unless attribute_present?("token")
      self.expires_at = SugarDaddy.config.method(token_lifetime).call.from_now unless attribute_present?("expires_at")
    end

    def expires_in
      (self.expires_at - Time.now.utc).to_i
    end

    def expire!
      self.expires_at = Time.now.utc
      self.save!
    end

    def expired?
      self.expires_at < Time.now.utc
    end

  end

end
