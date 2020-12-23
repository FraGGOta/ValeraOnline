require 'rails_helper'
require 'support/factory_bot'

RSpec.describe 'Games', type: :request do
  describe 'GET /game unauthorized' do
    it 'the request is unauthorized' do
      get '/game'
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'POST /go_job' do
    let(:user) { create(:account) }
    let(:session) { request.session['user_id'] = user.id }

    it 'the action go_job' do
      get '/game'
      session
      post '/go_job'
      expect(response).to have_http_status(:found)
    end
  end

  describe 'POST /go_behold' do
    it 'the action go_behold' do
      get '/game'
      session
      post '/go_behold'
      expect(response).to have_http_status(:found)
    end
  end

  describe 'POST /watch_series' do
    it 'the action watch_series' do
      get '/game'
      session
      post '/watch_series'
      expect(response).to have_http_status(:found)
    end
  end

  describe 'POST /go_bar' do
    it 'the action go_bar' do
      get '/game'
      session
      post '/go_bar'
      expect(response).to have_http_status(:found)
    end
  end

  describe 'POST /go_drink' do
    it 'the action go_drink' do
      get '/game'
      session
      post '/go_drink'
      expect(response).to have_http_status(:found)
    end
  end

  describe 'POST /go_sleep' do
    it 'the action go_sleep' do
      get '/game'
      session
      post '/go_sleep'
      expect(response).to have_http_status(:found)
    end
  end

  describe 'POST /go_sing' do
    it 'the action go_sing' do
      get '/game'
      session
      post '/go_sing'
      expect(response).to have_http_status(:found)
    end
  end

  describe 'POST /new_game' do
    it 'the action new_game' do
      get '/game'
      session
      post '/new_game'
      expect(response).to have_http_status(:found)
    end
  end

  describe 'POST /menu' do
    it 'the request is authorized' do
      get '/game'
      session
      post '/menu'
      expect(response).to have_http_status(:no_content)
    end
  end
end
