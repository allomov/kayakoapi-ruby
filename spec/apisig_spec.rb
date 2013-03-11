require 'spec_helper'
require "kayakoapi-ruby/apisig"

describe "APISig" do
  before :each do
    @apisig = Kayakoapi::APISig.new("one", "two")
  end

  it "should generate a random salt" do
    @salt = @apisig.get_salt
    @salt.should_not be_nil
  end

  it "should hash a key and a salt" do
    hash = @apisig.hash("secret key", "random salt")
    hash.should eq "\xDA>\xD7\x8B>\x150\xC2\x98\r\xA4\xA6\\o\xFDf\xE1&o\x19N\xF6\xFE\xEF0\x1C7\rR\x99/O"
  end

  it "should encode a string into base64" do
    string = @apisig.b64encode("String")
    string.should eq "U3RyaW5n\n"
  end

  it "should return a hash when asked to create a new signature" do
    urlgen = double("urlgenerator")
    urlgen.stub!(:urlencode).and_return "encoded"

    result = @apisig.new_signature
    result[:signature].should_not be_nil
    result[:salt].should_not be_nil
    result[:apikey].should_not be_nil
  end
end
