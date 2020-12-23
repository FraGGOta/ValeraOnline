require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe 'GET /log_in' do
    it 'returns http success' do
      get '/log_in'
      expect(response).to have_http_status(:success)
    end
  end
end
