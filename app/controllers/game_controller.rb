class GameController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    if session[:user_id].nil?
      render plain: 'Access error', status: :unauthorized
      return
    end

    user_stats_get
    check_loose
    @warning = session[:last_warn] || ''
  end

  def on_click_button_exit; end

  def action_go_job
    session[:last_warn] = ''
    user_stats_get
    if @account.mana < 50 && @account.tired < 10
      mana_set(30)
      funny_set(-5)
      tired_set(70)
      money_set(100)
    else
      session[:last_warn] = 'You cannot go job'
    end
    update_screen
  end

  def action_go_behold
    session[:last_warn] = ''
    user_stats_get
    mana_set(-10)
    funny_set(1)
    tired_set(10)
    update_screen
  end

  def action_watch_series
    session[:last_warn] = ''
    user_stats_get
    health_set(-5)
    mana_set(30)
    funny_set(1)
    tired_set(-5)
    money_set(-20)
    update_screen
  end

  def action_go_bar
    session[:last_warn] = ''
    user_stats_get
    health_set(-10)
    mana_set(60)
    funny_set(1)
    tired_set(40)
    money_set(-100)
    update_screen
  end

  def action_go_drink
    session[:last_warn] = ''
    user_stats_get
    health_set(-80)
    mana_set(60)
    funny_set(5)
    tired_set(80)
    money_set(-150)
    update_screen
  end

  def action_go_sleep
    session[:last_warn] = ''
    user_stats_get
    health_set(90)
    mana_set(-50)
    funny_set(-3)
    tired_set(-70)
    money_set(-150)
    update_screen
  end

  def action_go_sing
    session[:last_warn] = ''
    user_stats_get
    mana_set(10)
    funny_set(1)
    money_set(10)
    if @account.mana >= 40 && @account.mana <= 70
      money_set(50)
      session[:last_warn] = 'Bonus money!'
    end
    tired_set(20)
    update_screen
  end

  def start_new_game
    session[:last_warn] = ''
    user_stats_get
    @account.health = 100
    @account.mana = 0
    @account.funny = 0
    @account.tired = 0
    @account.money = 0
    @account.save
    update_screen
  end

  private

  def check_loose
    if @account.health <= 0
      @is_loose = true
      session[:last_warn] = 'You loose! You died'
    elsif @account.mana > 100
      @is_loose = true
      session[:last_warn] = 'You loose! You are too drunk'
    elsif @account.money.negative?
      @is_loose = true
      session[:last_warn] = "You loose! There's no money to pay off your debts."
    else
      @is_loose = false
    end
  end

  def user_stats_get
    @account = Account.find_by(id: session[:user_id])
    @account.points += 1
  end

  def update_screen
    @account.save
    redirect_to '/game'
  end

  def money_set(value)
    @account.money = (@account.money + value) <= 0 ? 0 : @account.money + value
  end

  def funny_set(value)
    @account.funny = (@account.funny + value) <= -10 ? -10 : @account.funny + value
    @account.funny = @account.funny > 10 ? 10 : @account.funny
  end

  def tired_set(value)
    @account.tired = (@account.tired + value) <= 0 ? 0 : @account.tired + value
    @account.tired = @account.tired > 100 ? 100 : @account.tired
  end

  def mana_set(value)
    @account.mana = (@account.mana + value) <= 0 ? 0 : @account.mana + value
    @account.mana = @account.mana.negative? ? 0 : @account.mana
  end

  def health_set(value)
    @account.health = (@account.health + value).negative? ? 0 : @account.health + value
    @account.health = @account.health > 100 ? 100 : @account.health
  end
end
