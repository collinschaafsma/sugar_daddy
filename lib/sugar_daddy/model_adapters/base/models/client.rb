module SugarDaddy::ModelAdapters::Base::Models::Client

  extend ActiveSupport::Concern

  included do

    validates :secret, :presence => true
    validates :name, :presence => true, :uniqueness => true
    validates :oauth_identifier, :presence => true, :uniqueness => true

    attr_accessible :name, :website, :redirect_uri

    before_validation(:on => :create) do
      self.oauth_identifier = SugarDaddy::Random.token unless attribute_present?("oauth_identifier")
      self.secret           = SugarDaddy::Random.token unless attribute_present?("secret")
    end

  end

end
