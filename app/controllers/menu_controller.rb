class MenuController < ApplicationController
  def index
    if session[:user_id] != nil
      @is_authorized = true
      user = Account.find_by(id: session[:user_id])
      @id_user = user.login
    else
      @is_authorized = false
      @id_user = ''
    end
  end

  def on_click_button_play; end

  def on_click_button_login; end

  def on_click_button_signup; end

  def on_click_button_logout
    session.clear
    @id_user = ''
    redirect_to ""
  end
end
