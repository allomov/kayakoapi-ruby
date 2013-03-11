require 'spec_helper'
require "kayakoapi-ruby/urlgenerator"
require "kayakoapi-ruby/exceptions"

describe "URLGenerator" do
  before :each do
    @urlgen = Kayakoapi::URLGenerator.new("http://fake-url.com/")
    @urlgen.append_to_url('one', 'valueone')
    @urlgen.append_to_url('two', 'valuetwo')
  end

  it "should remember the url" do
    @urlgen.url_root.should_not be_nil
  end

  it "should accept new parameters" do
    @urlgen.append_to_url('troled', 'pigs')
    @urlgen.params.should have_key('troled')
    @urlgen.params['troled'].should eq 'pigs'
  end

  it "should return a string when asked to create a full_url" do
    @urlgen.full_url.should eq "http://fake-url.com/?one=valueone&two=valuetwo"
  end

  it "should raise on failure" do
    @urlgen.params = {}
    expect{@urlgen.full_url}.to raise_error(Kayakoapi::NoURLParameters)
  end

  it "has a static method for encoding urls" do
    Kayakoapi::URLGenerator::urlncode('tr o%ed').should eq "%74%72%20%6F%%65%64"
  end
end
