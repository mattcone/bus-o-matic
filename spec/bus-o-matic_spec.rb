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
  
  describe "check methods" do
   
    it "must have a system time method" do
      PIT::Busomatic.must_respond_to :time
    end
    
    it "must have a vehicles method" do
      PIT::Busomatic.must_respond_to :vehicles
    end
    
    it "must have a routes method" do
      PIT::Busomatic.must_respond_to :routes
    end
    
    it "must have a directions method" do
      PIT::Busomatic.must_respond_to :directions
    end
    
    it "must have a stops method" do
      PIT::Busomatic.must_respond_to :stops
    end
   
    it "must have a patterns method" do
      PIT::Busomatic.must_respond_to :patterns
    end
    
    it "must have a predictions method" do
      PIT::Busomatic.must_respond_to :predictions
    end
    
    it "must have a bulletins method" do
      PIT::Busomatic.must_respond_to :bulletins
    end
   
  end
 
end











 