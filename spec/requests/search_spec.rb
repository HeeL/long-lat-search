require 'spec_helper'

describe "Search" do
  describe "index" do
    before :each do
      5.times{FactoryGirl.create(:resort)}  
    end
    
    context 'before search' do
      it "shows a form and a list of resorts" do
        visit('/')
        page.should have_xpath('//form[@action="/"]/input[@value="Sort by nearest"]')
        page.should have_xpath('//div[@id="resorts"]/div[@class="resort"]', count: 5)
      end
    end
    
    context 'after search' do
      it "shows a form and a list of resorts" do
        visit('/')
        fill_in 'Longitude', :with => '10.123'
        fill_in 'Latitude', :with => '50.123'
        click_button 'Sort by nearest'
        page.should have_xpath('//form[@action="/"]/input[@value="Sort by nearest"]')
        page.should have_xpath('//div[@id="resorts"]/div[@class="resort"]', count: 5)        
      end
    end

  end
end
