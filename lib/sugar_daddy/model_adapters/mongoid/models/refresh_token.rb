class SugarDaddy::ModelAdapters::Mongoid::Models::RefreshToken

  module Mannerisms

    extend ActiveSupport::Concern

    included do
      include ::Mongoid::Document
      include SugarDaddy::ModelAdapters::Base::Models::RefreshToken

    end

    module ClassMethods

    end

  end

  include Mannerisms

end
