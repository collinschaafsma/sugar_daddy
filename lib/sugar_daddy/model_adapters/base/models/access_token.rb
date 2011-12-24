module SugarDaddy::ModelAdapters::Base::Models::AccessToken

  extend ActiveSupport::Concern

  included do
    validates_presence_of :identifier, :secret, :name
    validates_uniqueness_of :identifier
  end

end
