class SugarDaddy::ModelAdapters::Mongoid::Models::AccessToken

  module Mannerisms

    extend ActiveSupport::Concern

    included do
      include ::Mongoid::Document
      include SugarDaddy::ModelAdapters::Base::Models::AccessToken

    end

    module ClassMethods

    end

  end

  include Mannerisms

end
