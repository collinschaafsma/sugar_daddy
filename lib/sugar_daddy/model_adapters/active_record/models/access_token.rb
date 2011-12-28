class SugarDaddy::ModelAdapters::ActiveRecord::Models::AccessToken < ActiveRecord::Base

  module Mannerisms

    extend ActiveSupport::Concern

    included do

      include SugarDaddy::ModelAdapters::Base::Models::ExpirableToken
      include SugarDaddy::ModelAdapters::Base::Models::AccessToken

    end

  end

  include Mannerisms

end
