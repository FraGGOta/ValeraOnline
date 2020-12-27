require 'rails_helper'

RSpec.describe 'Menus', type: :request do
  describe 'GET /menu' do
    it 'returns http success' do
      get '/menu'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /load_btn' do
    it 'returns http success' do
      post '/load_btn'
      expect(response).to have_http_status(:found)
    end
  end

  describe 'POST /save_btn' do
    it 'returns http success' do
      post '/save_btn'
      expect(response).to have_http_status(:found)
    end
  end
end
