class MenuController < ApplicationController
  def index
    if session[:user_id] != nil
      @id_user = session[:user_id]
      puts session[:user_id]
    end
  end
  def on_click_button_login; end
  def on_click_button_signup; end
end
