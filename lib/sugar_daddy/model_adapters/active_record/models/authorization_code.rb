class SugarDaddy::ModelAdapters::ActiveRecord::Models::AuthorizationCode < ActiveRecord::Base

  module Mannerisms

    extend ActiveSupport::Concern

    included do

      include SugarDaddy::ModelAdapters::Base::Models::ExpirableToken
      include SugarDaddy::ModelAdapters::Base::Models::AuthorizationCode

    end

  end

  include Mannerisms

end
