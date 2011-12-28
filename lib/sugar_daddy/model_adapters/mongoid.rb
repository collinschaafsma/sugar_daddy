module SugarDaddy::ModelAdapters::Mongoid

  autoload :Models, 'sugar_daddy/model_adapters/mongoid/models'

  # Makes SugarDaddy aware of what model classes we are using
  def self.set_models
    SugarDaddy.access_token_class_name       = "SugarDaddy::ModelAdapters::Mongoid::Models::AccessToken"
    SugarDaddy.authorization_code_class_name = "SugarDaddy::ModelAdapters::Mongoid::Models::AuthorizationCode"
    SugarDaddy.refresh_token_class_name      = "SugarDaddy::ModelAdapters::Mongoid::Models::RefreshToken"
    SugarDaddy.client_class_name             = "SugarDaddy::ModelAdapters::Mongoid::Models::Client"

    SugarDaddy.access_token_class       = SugarDaddy::ModelAdapters::Mongoid::Models::AccessToken
    SugarDaddy.authorization_code_class = SugarDaddy::ModelAdapters::Mongoid::Models::AuthorizationCode
    SugarDaddy.refresh_token_class      = SugarDaddy::ModelAdapters::Mongoid::Models::RefreshToken
    SugarDaddy.client_class             = SugarDaddy::ModelAdapters::Mongoid::Models::Client

    prefix = SugarDaddy.config.collection_prefix
    SugarDaddy.access_token_class.collection_name       = prefix + "_access_tokens"
    SugarDaddy.authorization_code_class.collection_name = prefix + "_authorization_codes"
    SugarDaddy.refresh_token_class.collection_name      = prefix + "_refresh_tokens"
    SugarDaddy.client_class.collection_name             = prefix + "_clients"

    true
  end

end
