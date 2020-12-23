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
      @account.init_fields
      @account.stats_apply(0, 30, 100, -5, 10)
    else
      session[:last_warn] = 'You cannot go job'
    end
    update_screen
  end

  def action_go_behold
    session[:last_warn] = ''
    user_stats_get
    @account.stats_apply(0, -10, 0, 1, 10)
    update_screen
  end

  def action_watch_series
    session[:last_warn] = ''
    user_stats_get
    @account.stats_apply(-5, 30, -20, 1, -5)
    update_screen
  end

  def action_go_bar
    session[:last_warn] = ''
    user_stats_get
    @account.stats_apply(-10, 60, -100, 1, 40)
    update_screen
  end

  def action_go_drink
    session[:last_warn] = ''
    user_stats_get
    @account.stats_apply(-80, 60, -150, 5, 80)
    update_screen
  end

  def action_go_sleep
    session[:last_warn] = ''
    user_stats_get
    @account.stats_apply(90, -50, -150, -3, -70)
    update_screen
  end

  def action_go_sing
    session[:last_warn] = ''
    user_stats_get
    @account.mana_set(10)
    @account.funny_set(1)
    @account.money_set(10)
    if @account.mana >= 40 && @account.mana <= 70
      @account.money_set(50)
      session[:last_warn] = 'Bonus money!'
    end
    @account.tired_set(20)
    update_screen
  end

  def start_new_game
    session[:last_warn] = ''
    user_stats_get
    @account.stats_reset
    @account.save
    update_screen
  end

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

  private

  def user_stats_get
    @account = Account.find_by(id: session[:user_id])
    if @account.nil?
      @account = Account.new
      @account.init_fields
    end
    @account.points += 1
  end

  def update_screen
    @account.save
    redirect_to '/game'
  end
end
