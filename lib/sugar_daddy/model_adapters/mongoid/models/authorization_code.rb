class SugarDaddy::ModelAdapters::Mongoid::Models::AuthorizationCode

  module Mannerisms

    extend ActiveSupport::Concern

    included do
      include ::Mongoid::Document
      include SugarDaddy::ModelAdapters::Base::Models::AuthorizationCode

    end

    module ClassMethods

    end

  end

  include Mannerisms

end
