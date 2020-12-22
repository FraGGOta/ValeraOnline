class GameController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    get_user_stats
    check_loose
  end

  def on_click_button_exit; end

  def action_go_job
    clear_popup_alert
    get_user_stats
    if @account.mana < 50 && @account.tired < 10
      set_mana(30)
      set_funny(-5)
      set_tired(70)
      set_money(100)
    else
      popup_alert("You cant go job ")
    end
    update_screen
  end

  def action_go_behold
    clear_popup_alert
    get_user_stats
    set_mana(-10)
    set_funny(1)
    set_tired(10)
    update_screen
  end

  def action_watch_series
    clear_popup_alert
    get_user_stats
    set_health(-5)
    set_mana(30)
    set_funny(1)
    set_tired(-5)
    set_money(-20)
    update_screen
  end

  def action_go_bar
    clear_popup_alert
    get_user_stats
    set_health(-10)
    set_mana(60)
    set_funny(1)
    set_tired(40)
    set_money(-100)
    update_screen
  end

  def action_go_drink
    clear_popup_alert
    get_user_stats
    set_health(-80)
    set_mana(60)
    set_funny(5)
    set_tired(80)
    set_money(-150)
    update_screen
  end

  def action_go_sleep
    clear_popup_alert
    get_user_stats
    set_health(90)
    set_mana(-50)
    set_funny(-3)
    set_tired(-70)
    set_money(-150)
    update_screen
  end

  def action_go_sing
    clear_popup_alert
    get_user_stats
    set_mana(10)
    set_funny(1)
    set_money(10)
    if @account.mana >= 40 && @account.mana <= 70
      set_money(50)
      popup_alert("Bonus money!")
    end
    set_tired(20)
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
    set_health(100)
    set_mana(0)
    set_funny(0)
    set_tired(0)
    set_money(0)
    @account.save
  end

  private
  def get_user_stats
    @account = Account.find_by_id(session[:user_id])
  end

  private
  def update_screen
    @account.save
    render 'index'
  end

  private
  def set_money(value)
    @account.money = (@account.money + value) <= 0 ? 0 : @account.money  + value
  end

  private
  def set_funny(value)
    @account.funny = (@account.funny + value) <= -10 ? -10 : @account.funny + value
    @account.funny = @account.funny > 10 ? 10 : @account.funny
  end

  private
  def set_tired(value)
    @account.tired = (@account.tired + value) <= 0 ? 0 : @account.tired + value
    @account.tired = @account.tired > 100 ? 100 : @account.mana
  end

  private
  def set_mana(value)
    @account.mana = (@account.money + value) <= 0 ? 0 : @account.money + value
    @account.mana = @account.mana.negative? ? 0 : @account.mana
  end

  private
  def set_health(value)
    @account.health = (@account.health + value) < 0 ? 0 : @account.health + value
    @account.health = @account.health > 100 ? 100 : @account.health
  end
end
