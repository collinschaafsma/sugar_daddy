require 'spec_helper'

describe SugarDaddy.authorization_code_class do

  before(:all) do
    @client = SugarDaddy.client_class.create!( :name => 'Collination, Inc' )
    @authorization_code = SugarDaddy.authorization_code_class.create!( :client => @client )
  end

  describe "#expiration" do

    subject { @authorization_code }

    specify { subject.expired?.should == false }

    it "should default to 30 days" do
      subject.expires_at.strftime("%m-%d-%Y").should == 1.minute.from_now.strftime("%m-%d-%Y")
    end

    it "should be settable" do
      expires_at = 5.days.from_now
      access_token = SugarDaddy.authorization_code_class.create!( :expires_at => expires_at, :client => @client )
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

    subject { @authorization_code }

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
      dup = SugarDaddy.authorization_code_class.create!( :client => @client )
      subject.token = dup.token
      should_not be_valid
    end

  end

  describe "#associations" do

    subject { SugarDaddy.authorization_code_class.new }

    it { should respond_to(:client) }

  end

end
