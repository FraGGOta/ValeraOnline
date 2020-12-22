class GameController < ApplicationController
  def index
    get_user_stats
    check_loose
  end

  def on_click_button_exit; end

  def action_go_job
    clear_popup_alert
    get_user_stats
    if @account.mana < 50 && @account.tired < 10
      @account.funny -= 5
      @account.mana -= 30
      @account.money += 100
      @account.tired += 70
    else
      popup_alert("You cant go job ")
    end
    update_screen
  end

  def action_go_behold
    clear_popup_alert
    get_user_stats
    @account.funny +=1
    @account.mana -= 10
    @account.tired += 10
    update_screen
  end

  def action_watch_series
    clear_popup_alert
    get_user_stats
    @account.funny += 1
    @account.mana += 30
    @account.tired += 10
    @account.health -= 5
    @account.money -= 20
    update_screen
  end

  def action_go_bar
    clear_popup_alert
    get_user_stats
    @account.funny += 1
    @account.mana += 60
    @account.tired += 40
    @account.health -= 10
    @account.money -= 100
    update_screen
  end

  def action_go_drink
    clear_popup_alert
    get_user_stats
    @account.funny += 5
    @account.mana += 60
    @account.tired += 80
    @account.health -= 80
    @account.money -= 150
    update_screen
  end

  def action_go_sleep
    clear_popup_alert
    get_user_stats
    @account.funny -= 3
    @account.mana -= 50
    @account.tired -= 70
    @account.health += 90
    @account.money -= 150
    update_screen
  end

  def action_go_sing
    clear_popup_alert
    get_user_stats
    @account.funny += 1
    @account.mana += 10
    if @account.mana >= 40 && @account.mana <= 70
      @account.money += 50
      popup_alert("Bonus money!")
    end
    @account.tired += 20
    update_screen
  end

  def start_new_game
    clear_popup_alert
    get_user_stats
    new_game
    update_screen
  end

  private
  def check_loose
    if @account.health <= 0
      @is_loose = true
      popup_alert("You loose: you died")
    elsif @account.mana > 100
      @is_loose = true
      popup_alert("You loose: you drunk")
    elsif @account.money < 0
      @is_loose = true
      popup_alert("You loose: no money")
    elsif
      @is_loose = false
      clear_popup_alert
    end
  end

  private
  def popup_alert(message)
    @warning = message
  end

  private
  def clear_popup_alert
    @warning = ""
  end

  private
  def new_game
    @account.health = 100
    @account.mana = 0
    @account.funny = 0
    @account.tired = 0
    @account.money = 0
    @account.save
  end

  private
  def update_screen
    @account.save
    render 'index'
  end

  private
  def get_user_stats
    @account = Account.find_by_id(session[:user_id])
  end
end
