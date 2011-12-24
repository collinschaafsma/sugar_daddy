module SugarDaddy::ModelAdapters::Base::Models::Client

  extend ActiveSupport::Concern

  included do
    validates_presence_of :oauth_identifier, :secret, :name
    validates_uniqueness_of :oauth_identifier

    before_validation :create_oauth_identifier, :on => :create, :unless => :oauth_identifier?
    before_validation :create_secret, :on => :create, :unless => :secret?

    attr_accessible :name, :website, :redirect_uri

    private

    def create_oauth_identifier
      self.oauth_identifier = SugarDaddy::Random.token
    end

    def create_secret
      self.secret = SugarDaddy::Random.token
    end

  end

end
