class GameController < ApplicationController
  def index
    @health = 50
    @tired = 50
    @mana = 50
    @funny = 50
    @money = 50
  end

  def create
    render plain: params[:stats].inspect
  end

  def on_click_button_exit; end
  def someButton
      puts "govnoooooooooooooo"
  end
end
