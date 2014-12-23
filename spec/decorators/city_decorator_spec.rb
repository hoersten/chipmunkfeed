require 'spec_helper'

describe CityDecorator do
  describe "display_name" do
    it "display_name" do
      city = FactoryGirl.create(:city)
      sd = city.decorate
      expect(sd.display_name).to eq(city.name)
    end
  end
  describe "search_display" do
    it "search_display" do
      city = FactoryGirl.create(:city)
      sd = city.decorate
      expect(sd.search_display).to eq(city.name + ', ' + city.state.name)
    end
  end
  describe "display_capital_info" do
    it "display_capital_info - no capital" do
      city = FactoryGirl.create(:city)
      sd = city.decorate
      expect(sd.display_capital_info).to eq('')
    end
    it "display_capital_info - county capital" do
      city = FactoryGirl.create(:city_with_county_capital)
      sd = city.decorate
      expect(sd.display_capital_info).to eq(' (County capital)')
    end
    it "display_capital_info - state capital" do
      city = FactoryGirl.create(:city_with_state_capital)
      sd = city.decorate
      expect(sd.display_capital_info).to eq(' (State capital)')
    end
    it "display_capital_info - state and county capital" do
      city = FactoryGirl.create(:city_with_state_and_county_capital)
      sd = city.decorate
      expect(sd.display_capital_info).to eq(' (State capital) (County capital)')
    end
  end
end
