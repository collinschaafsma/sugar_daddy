module SugarDaddy::ModelAdapters::Base::Models::RefreshToken

  extend ActiveSupport::Concern

  included do

    belongs_to :client, :class_name => SugarDaddy.client_class_name, :foreign_key => :client_id

    validates :client, :presence => true

  end

end
