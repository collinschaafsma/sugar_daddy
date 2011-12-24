class SugarDaddy::ModelAdapters::ActiveRecord::Models::AccessToken < ActiveRecord::Base

  module Behaviour

    extend ActiveSupport::Concern

    included do
      include SugarDaddy::ModelAdapters::Base::Models::AccessToken

    end

  end

  include Behaviour

end
