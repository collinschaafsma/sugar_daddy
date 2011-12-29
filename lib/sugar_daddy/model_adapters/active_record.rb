module SugarDaddy::ModelAdapters::ActiveRecord

  autoload :Models, 'sugar_daddy/model_adapters/active_record/models'

  # Makes SugarDaddy aware of what model classes we are using
  def self.set_models
    SugarDaddy.access_token_class_name       = "SugarDaddy::ModelAdapters::ActiveRecord::Models::AccessToken"
    SugarDaddy.authorization_code_class_name = "SugarDaddy::ModelAdapters::ActiveRecord::Models::AuthorizationCode"
    SugarDaddy.client_class_name             = "SugarDaddy::ModelAdapters::ActiveRecord::Models::Client"
    SugarDaddy.refresh_token_class_name      = "SugarDaddy::ModelAdapters::ActiveRecord::Models::RefreshToken"

    SugarDaddy.access_token_class       = SugarDaddy::ModelAdapters::ActiveRecord::Models::AccessToken
    SugarDaddy.authorization_code_class = SugarDaddy::ModelAdapters::ActiveRecord::Models::AuthorizationCode
    SugarDaddy.client_class             = SugarDaddy::ModelAdapters::ActiveRecord::Models::Client
    SugarDaddy.refresh_token_class      = SugarDaddy::ModelAdapters::ActiveRecord::Models::RefreshToken

    prefix = "#{SugarDaddy.config.table_prefix}_"
    SugarDaddy.access_token_class.table_name_prefix       = prefix
    SugarDaddy.authorization_code_class.table_name_prefix = prefix
    SugarDaddy.refresh_token_class.table_name_prefix      = prefix
    SugarDaddy.client_class.table_name_prefix             = prefix

    true
  end

end
