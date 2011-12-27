require "sugar_daddy/version"
require 'active_support/all'

module SugarDaddy

  autoload :ModelAdapters, 'sugar_daddy/model_adapters'
  autoload :Random,        'sugar_daddy/random'

  mattr_accessor :access_token_class, :authorization_code_class, :client_class, :refresh_token_class
  mattr_accessor :access_token_class_name, :authorization_code_class_name, :client_class_name, :refresh_token_class_name

  class Configuration

    attr_accessor :backend, :resource_owner_model

    def initialize
      # Defualt the backend to ActiveRecord
      self.backend = :activerecord
      self.resource_owner_model = User if defined?(User)
    end

  end

  def self.config
    @@config ||= Configuration.new
  end

  def self.configure
    yield config
    ModelAdapters.set_model_adapter
  end

end
