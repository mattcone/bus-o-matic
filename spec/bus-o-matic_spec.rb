require_relative 'spec_helper'

describe PIT::Busomatic do
 
  describe "default attributes" do
 
    it "must include httparty methods" do
      PIT::Busomatic.must_include HTTParty
    end
 
    it "must have the base url set to the Port Authority API endpoint" do
      PIT::Busomatic.base_uri.must_equal 'http://realtime.portauthority.org/bustime/api/v2'
    end
 
  end
 
end











 