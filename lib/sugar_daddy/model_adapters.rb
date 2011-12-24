module SugarDaddy::ModelAdapters

  autoload :ActiveRecord, 'sugar_daddy/model_adapters/active_record'
  autoload :Mongoid,      'sugar_daddy/model_adapters/mongoid'
  autoload :Base,         'sugar_daddy/model_adapters/base'

  def self.set_model_adapter
    case SugarDaddy.config.backend
    when :mongoid
      SugarDaddy::ModelAdapters::Mongoid.set_models
    else
      SugarDaddy::ModelAdapters::ActiveRecord.set_models
    end
  end

end
