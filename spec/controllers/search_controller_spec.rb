require 'spec_helper'

describe SearchController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
    
    context "invalid params" do
      it "gets all the resorts when no params provided" do
        Resort.should_receive(:all).once 
        get :index
      end
      
      it "gets all the resorts when only one param provided" do
        Resort.should_receive(:all).twice
        Resort.should_not_receive(:by_nearest)
        get :index, latitude: '51.123'
        get :index, longitude: '12.222'
      end
      
      it "convert params to float to avoid sql injection" do
        Resort.should_receive(:by_nearest).with(0.0, 0.0)
        get :index, longitude: 'not a num', latitude: 'not a num'
      end
    end
    
    context "valid params" do
      it "orders all resorts by nearest" do
        Resort.should_receive(:by_nearest).with(51.123, 12.222)
        get :index, latitude: '51.123', longitude: '12.222' 
      end
    end
  end

end
