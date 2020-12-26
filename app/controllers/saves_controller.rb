class SavesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    if session[:user_id].nil?
      render plain: 'Access error', status: :unauthorized
      return
    end

    @save_names_list = []
  end

  def on_click_save
    
    redirect_to '/game'
  end

  def on_click_load
    
    redirect_to '/game'
  end
end
