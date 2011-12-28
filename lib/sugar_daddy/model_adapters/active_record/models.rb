module SugarDaddy::ModelAdapters::ActiveRecord::Models

  autoload :AccessToken,       'sugar_daddy/model_adapters/active_record/models/access_token'
  autoload :AuthorizationCode, 'sugar_daddy/model_adapters/active_record/models/authorization_code'
  autoload :Client,            'sugar_daddy/model_adapters/active_record/models/client'
  autoload :RefreshToken,      'sugar_daddy/model_adapters/active_record/models/refresh_token'

end
