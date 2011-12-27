module SugarDaddy::ModelAdapters::Base::Models::AccessToken

  extend ActiveSupport::Concern

  included do

    belongs_to :client, :class_name => SugarDaddy.client_class_name, :foreign_key => :client_id

    validates_presence_of :identifier, :secret, :name
    validates_uniqueness_of :identifier

  end

end
