require 'rails_helper'
require 'support/factory_bot'

RSpec.describe "Games", type: :request do
  context "GET /game unauthorized" do
    it "the request is unauthorized" do
      get '/game'
      expect(response).to have_http_status(:unauthorized)
    end
  end

  context "GET /game unauthorized" do
    it "the request is unauthorized" do
      account_user = create(:account)
      get '/'
      @request.session['user_id'] = account_user.id
      get '/game'
      expect(response).to have_http_status(:unauthorized)
    end
  end

  context "POST /go_job" do
    it "the action go_job" do
      get '/game'
      account_user = create(:account)
      @request.session['user_id'] = account_user.id
      post '/go_job'
      expect(response).to have_http_status(:found)
    end
  end

  context "POST /go_behold" do
    it "the action go_behold" do
      get '/game'
      account_user = create(:account)
      @request.session['user_id'] = account_user.id
      post '/go_behold'
      expect(response).to have_http_status(:found)
    end
  end

  context "POST /watch_series" do
    it "the action watch_series" do
      get '/game'
      account_user = create(:account)
      @request.session['user_id'] = account_user.id
      post '/watch_series'
      expect(response).to have_http_status(:found)
    end
  end

  context "POST /go_bar" do
    it "the action go_bar" do
      get '/game'
      account_user = create(:account)
      @request.session['user_id'] = account_user.id
      post '/go_bar'
      expect(response).to have_http_status(:found)
    end
  end

  context "POST /go_drink" do
    it "the action go_drink" do
      get '/game'
      account_user = create(:account)
      @request.session['user_id'] = account_user.id
      post '/go_drink'
      expect(response).to have_http_status(:found)
    end
  end

  context "POST /go_sleep" do
    it "the action go_sleep" do
      get '/game'
      account_user = create(:account)
      @request.session['user_id'] = account_user.id
      post '/go_sleep'
      expect(response).to have_http_status(:found)
    end
  end

  context "POST /go_sing" do
    it "the action go_sing" do
      get '/game'
      account_user = create(:account)
      @request.session['user_id'] = account_user.id
      post '/go_sing'
      expect(response).to have_http_status(:found)
    end
  end

  context "POST /new_game" do
    it "the action new_game" do
      get '/game'
      account_user = create(:account)
      @request.session['user_id'] = account_user.id
      post '/new_game'
      expect(response).to have_http_status(:found)
    end
  end

  context "POST /menu" do
    it "the request is authorized" do
      get '/game'
      account_user = create(:account)
      @request.session['user_id'] = account_user.id
      post '/menu'
      expect(response).to have_http_status(:no_content)
    end
  end
end
