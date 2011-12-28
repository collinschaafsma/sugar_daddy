class SugarDaddy::ModelAdapters::Mongoid::Models::AuthorizationCode

  module Mannerisms

    extend ActiveSupport::Concern

    included do

      include ::Mongoid::Document
      include SugarDaddy::ModelAdapters::Base::Models::ExpirableToken
      include SugarDaddy::ModelAdapters::Base::Models::AuthorizationCode

      field :token
      field :expires_at, type: Time

    end

    module ClassMethods

    end

  end

  include Mannerisms

end
