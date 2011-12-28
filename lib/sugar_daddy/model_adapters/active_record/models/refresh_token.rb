class SugarDaddy::ModelAdapters::ActiveRecord::Models::RefreshToken < ActiveRecord::Base

  module Mannerisms

    extend ActiveSupport::Concern

    included do

      include SugarDaddy::ModelAdapters::Base::Models::ExpirableToken
      include SugarDaddy::ModelAdapters::Base::Models::RefreshToken

    end

  end

  include Mannerisms

end
