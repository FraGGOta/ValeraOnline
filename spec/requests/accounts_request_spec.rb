require 'rails_helper'

RSpec.describe "Accounts", type: :request do
  describe 'GET /sign_up' do
    it 'returns http success' do
      get '/sign_up'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /log_in' do
    it 'returns http success' do
      get '/log_in'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/accounts/:id/show'
      expect(response).to have_http_status(:no_content)
    end
  end

  describe 'POST /index' do
    context 'when user direct in signup' do
      it 'renders new' do
        post '/accounts'
        expect(response).to render_template(:new)
      end
    end
  end
end
