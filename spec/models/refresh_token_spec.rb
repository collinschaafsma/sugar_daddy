require 'spec_helper'

describe SugarDaddy.refresh_token_class do

  before(:all) do
    @client = SugarDaddy.client_class.create!( :name => 'Slow Right, LLC' )
    @refresh_token = SugarDaddy.refresh_token_class.create!( :client => @client )
  end

  describe "#expiration" do

    subject { @refresh_token }

    specify { subject.expired?.should == false }

    it "should default to 30 days" do
      subject.expires_at.strftime("%m-%d-%Y").should == 30.days.from_now.strftime("%m-%d-%Y")
    end

    it "should be settable" do
      expires_at = 5.days.from_now
      access_token = SugarDaddy.refresh_token_class.create!( :expires_at => expires_at, :client => @client )
      access_token.expires_at.to_i.should == expires_at.to_i
    end

    it "expire! method should expire the token" do
      subject.expire!
      subject.expired?.should == true
    end

    it "should return 0 seconds to expiration" do
      subject.expire!
      subject.expires_in.should == 0
    end

  end

  describe "#validations" do

    subject { @refresh_token }

    it "should be valid with just a client associated" do
      should be_valid
    end

    it "should be invalid with no token" do
      subject.token = nil
      should_not be_valid
    end

    it "should be invalid with no expiration" do
      subject.expires_at = nil
      should_not be_valid
    end

    it "should be invalid with a duplicate token" do
      dup = SugarDaddy.refresh_token_class.create!( :client => @client )
      subject.token = dup.token
      should_not be_valid
    end

  end

  describe "#associations" do

    subject { SugarDaddy.refresh_token_class.new }

    it { should respond_to(:client) }

  end

end


