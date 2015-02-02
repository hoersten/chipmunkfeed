require 'spec_helper'

describe CitiesController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(get('/ohio/cities')).to route_to('cities#index', :state => 'ohio')
      expect(get('/ohio/allen-county/cities')).to route_to('cities#index', :state => 'ohio', :county => 'allen-county')
    end

    it 'routes to #show' do
      expect(get('/ohio/columbus')).to route_to('cities#show', :id => 'columbus', :state => 'ohio')
    end

  end
end
