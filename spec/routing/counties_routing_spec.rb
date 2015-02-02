require 'spec_helper'

describe CountiesController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(get('/ohio/counties')).to route_to('counties#index', :state => 'ohio')
    end

    it 'routes to #show' do
      expect(get('/ohio/allen-county')).to             route_to('counties#show', :id => 'allen-county', :state => 'ohio')
      expect(get('/new-mexico/san-juan-county')).to    route_to('counties#show', :id => 'san-juan-county', :state => 'new-mexico')
      expect(get('/alaska/denali-borough')).to         route_to('counties#show', :id => 'denali-borough', :state => 'alaska')
      expect(get('/alaska/dillingham-census-area')).to route_to('counties#show', :id => 'dillingham-census-area', :state => 'alaska')
      expect(get('/louisiana/allen-parish')).to        route_to('counties#show', :id => 'allen-parish', :state => 'louisiana')
    end

  end
end
