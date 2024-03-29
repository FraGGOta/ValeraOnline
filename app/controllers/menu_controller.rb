class MenuController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    if session[:user_id].nil?
      @is_authorized = false
      @id_user = ''
    else
      @is_authorized = true
      user = Account.find_by(id: session[:user_id])
      @id_user = user.login
    end
  end

  def on_click_button_play
    redirect_to '\game'
  end

  def on_click_button_save
    redirect_to '\save'
  end

  def on_click_button_load
    redirect_to '\load'
  end

  def on_click_button_login; end

  def on_click_button_signup; end

  def on_click_profile; end

  def on_click_button_logout
    session.clear
    @id_user = ''
    redirect_to ''
  end
end
