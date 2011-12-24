class SugarDaddy::ModelAdapters::ActiveRecord::Models::Client < ActiveRecord::Base

  module Mannerisms

    extend ActiveSupport::Concern

    included do
      include SugarDaddy::ModelAdapters::Base::Models::Client

    end

  end

  include Mannerisms

end
