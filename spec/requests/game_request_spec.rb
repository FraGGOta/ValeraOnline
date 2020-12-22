require 'rails_helper'

RSpec.describe 'Games', type: :request do
  context 'GET /game unauthorized' do
    it 'the request is unauthorized' do
      get '/game'
      expect(response).to have_http_status(:unauthorized)
    end
  end

  context 'POST /go_job' do
    it 'the request is authorized' do
      post '/go_job'
      expect(response).to have_http_status(:success)
    end
  end
end
