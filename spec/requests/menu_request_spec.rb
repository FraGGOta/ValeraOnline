require 'rails_helper'

RSpec.describe "Menus", type: :request do
  describe 'GET /menu' do
    it 'returns http success' do
      get '/menu'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /menu' do
    it 'returns http success' do
      get '/menu'
      expect(response).to have_http_status(:success)
    end
  end
end
