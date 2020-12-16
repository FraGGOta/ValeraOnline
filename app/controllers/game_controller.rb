class GameController < ApplicationController
  def index
    @sessionId = 5
  end

  def show
  end

  def on_click_button_go_job
  end

  def on_click_button_exit
    redirect_to 'localhost:3000/menu'
  end

  def create
  end
end
