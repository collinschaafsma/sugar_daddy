require 'spec_helper'

describe SugarDaddy.client_model do

  describe "#validations" do

    subject { SugarDaddy.client_model.new( :name => 'Quick Left' ) }

    it "should be valid with just a name" do
      subject.should be_valid
    end

  end

end
