require 'spec_helper'

describe SugarDaddy.client_model do

  describe "#validations" do

    before(:all) do
      @client = SugarDaddy.client_model.create!( :name => 'Quick Left' )
    end

    subject { @client }

    it "should be valid with just a name" do
      should be_valid
    end

    it "should be invalid with no name" do
      subject.name = nil
      should_not be_valid
    end

    it "should be invalid with no oauth_identifier" do
      subject.oauth_identifier = nil
      should_not be_valid
    end

    it "should be invalid with no secret" do
      subject.secret = nil
      should_not be_valid
    end

    it "should be invalid with a duplicate name" do
      dup = SugarDaddy.client_model.create!( :name => 'Slow Right' )
      subject.name = dup.name
      should_not be_valid
    end

    it "should be invalid with a duplicate oauth_identity" do
      dup = SugarDaddy.client_model.create!( :name => 'Slow Right 2' )
      subject.oauth_identifier = dup.identifier
      should_not be_valid
    end

  end

  describe "#attr_accessible" do

    subject { SugarDaddy.client_model }

    specify { allow_mass_assignment_of( subject, :name ).should be_true }
    specify { allow_mass_assignment_of( subject, :website ).should be_true }
    specify { allow_mass_assignment_of( subject, :redirect_uri ).should be_true }
    specify { allow_mass_assignment_of( subject, :secret ).should_not be_true }
    specify { allow_mass_assignment_of( subject, :oauth_identity ).should_not be_true }

  end

end
