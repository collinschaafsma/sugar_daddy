class SugarDaddy::ModelAdapters::Mongoid::Models::Client

  module Mannerisms

    extend ActiveSupport::Concern

    included do

      include ::Mongoid::Document
      include SugarDaddy::ModelAdapters::Base::Models::Client

      field :name
      field :redirect_uri
      field :website
      field :secret
      field :oauth_identifier

    end

    module ClassMethods

    end

  end

  include Mannerisms

end
