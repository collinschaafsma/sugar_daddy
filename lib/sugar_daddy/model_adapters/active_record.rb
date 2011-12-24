module SugarDaddy::ModelAdapters::ActiveRecord

  autoload :Models, 'sugar_daddy/model_adapters/active_record/models'

  # Makes SugarDaddy aware of what model classes we are using
  def self.set_models
    SugarDaddy.access_token_model       = SugarDaddy::ModelAdapters::ActiveRecord::Models::AccessToken
    SugarDaddy.authorization_code_model = SugarDaddy::ModelAdapters::ActiveRecord::Models::AuthorizationCode
    SugarDaddy.client_model             = SugarDaddy::ModelAdapters::ActiveRecord::Models::Client
    SugarDaddy.refresh_token_model      = SugarDaddy::ModelAdapters::ActiveRecord::Models::RefreshToken
  end

end
