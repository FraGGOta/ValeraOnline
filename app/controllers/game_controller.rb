class GameController < ApplicationController
  def index
    if @account != nil
       update
    end
    @account = Account.find_by_id(session[:user_id])
    @account.health = 50
    @account.tired = 50
    @account.mana = 50
    @account.funny = 50
    @account.money = 50

  end

  def create;
    puts "govno"
  end

  def edit
    puts "----------"
    puts "govno"
    puts "-----------"
      @account = Account.find_by_id(session[:user_id])
  end

  def update
    puts "----------"
    puts "govno"
    puts "-----------"
    @account = Account.find_by_id(session[:user_id])
    @account.health += 50
    @account.save
  end

  def on_click_button_exit; end

  helper_method :say

  def say
  "hello"
end

#  private
#    def user_params
#      params.require(@account).permit(:health, :tired, :funny, :funny, :money)
#    end
#private
#  def find_stock
#    puts "govno"
#    @account = Account.find_by_id(session[:user_id])
#    if @account.update_attributes(user_params)
#      # Обрабатывает успешное обновление
#2#2    else
#      render 'edit'
#    end
#  end
#  helper_method :find_stock
end
