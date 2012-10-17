require 'spec_helper'

describe Resort do
  describe "by_nearest" do
    before :each do
      FactoryGirl.create(:resort, {name: "Resort1", latitude: '20.122', longitude: '10.122'})
      FactoryGirl.create(:resort, {name: "Resort2", latitude: '20.124', longitude: '10.124'})
      FactoryGirl.create(:resort, {name: "Resort3", latitude: '20.126', longitude: '10.126'})
    end
    
    it "positions the first element correct when the match is exact" do
      @resorts = Resort.by_nearest(20.122, 10.122)
      @resorts.first.name.should eql('Resort1')
    end
    
    it "sorts by the nearest coordinates" do
      @resorts = Resort.by_nearest(20.128, 10.128)
      @resorts.first.name.should eql('Resort3')
      @resorts.last.name.should eql('Resort1')
    end
    
    
  end
end
