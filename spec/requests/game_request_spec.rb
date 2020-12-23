require 'rails_helper'
require 'support/factory_bot'

RSpec.describe "Games", type: :request do
  context "GET /game unauthorized" do
    it "the request is unauthorized" do
      get '/game'
      expect(response).to have_http_status(:unauthorized)
    end
  end

  context "POST /go_job" do
    it "the request is authorized" do
      get '/game'
      account_user = create(:account)
      @request.session['user_id'] = 14
      post '/go_job'
      expect(response).to have_http_status(:success)
    end
  end

  context "POST /go_behold" do
    it "the request is authorized" do
      get '/game'
      account_user = create(:account)
      @request.session['user_id'] = 14
      post '/go_behold'
      expect(response).to have_http_status(:success)
    end
  end

  context "POST /watch_series" do
    it "the request is authorized" do
      get '/game'
      account_user = create(:account)
      @request.session['user_id'] = 14
      post '/watch_series'
      expect(response).to have_http_status(:success)
    end
  end

  context "POST /go_bar" do
    it "the request is authorized" do
      get '/game'
      account_user = create(:account)
      @request.session['user_id'] = 14
      post '/go_bar'
      expect(response).to have_http_status(:success)
    end
  end

  context "POST /go_drink" do
    it "the request is authorized" do
      get '/game'
      account_user = create(:account)
      @request.session['user_id'] = 14
      post '/go_drink'
      expect(response).to have_http_status(:success)
    end
  end

  context "POST /go_sleep" do
    it "the request is authorized" do
      get '/game'
      account_user = create(:account)
      @request.session['user_id'] = 14
      post '/go_sleep'
      expect(response).to have_http_status(:success)
    end
  end

  context "POST /go_sing" do
    it "the request is authorized" do
      get '/game'
      account_user = create(:account)
      @request.session['user_id'] = 14
      post '/go_sing'
      expect(response).to have_http_status(:success)
    end
  end

  context "POST /new_game" do
    it "the request is authorized" do
      get '/game'
      account_user = create(:account)
      @request.session['user_id'] = 14
      post '/new_game'
      expect(response).to have_http_status(:success)
    end
  end

  context "POST /menu" do
    it "the request is authorized" do
      get '/game'
      account_user = create(:account)
      @request.session['user_id'] = 14
      post '/menu'
      expect(response).to have_http_status(:success)
    end
  end
end
