module SugarDaddy::ModelAdapters::Mongoid

  autoload :Models, 'sugar_daddy/model_adapters/mongoid/models'

  # Makes SugarDaddy aware of what model classes we are using
  def self.set_models
    SugarDaddy.access_token_model       = SugarDaddy::ModelAdapters::Mongoid::Models::AccessToken
    SugarDaddy.authorization_code_model = SugarDaddy::ModelAdapters::Mongoid::Models::AuthorizationCode
    SugarDaddy.client_model             = SugarDaddy::ModelAdapters::Mongoid::Models::Client
    SugarDaddy.refresh_token_model      = SugarDaddy::ModelAdapters::Mongoid::Models::RefreshToken
  end

end
