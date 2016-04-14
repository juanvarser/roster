require 'rails_helper'

RSpec.describe 'routes', type: :routing do
  it 'shows site without login' do
    expect(get: '/').to route_to(controller: 'site', action: 'index')
  end

  it 'routes for User Bands controller' do
    expect(get(user_bands_path(user_id: '1'))).to route_to(controller: 'bands', action: 'index', user_id: '1')
  end

  it 'routes to a specific User Band' do
    expect(get(user_band_path(user_id: '7', id: '15'))).to route_to(controller: 'bands', action: 'show', user_id: '7', id: '15')
  end

  it 'routes to User>Band>Merchandise' do
    expect(get(user_band_products_path(user_id: '7', band_id: '15'))).to route_to(controller: 'products', action: 'index', user_id: '7', band_id: '15')
  end

  it 'routes to All Band Events' do
    expect(get(user_all_bands_events_path(user_id: '7'))).to route_to(controller: 'users', action: 'all_bands_events', user_id: '7')
  end
end
