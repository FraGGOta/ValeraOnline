class GameController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    if session[:user_id].nil?
      render plain: 'Access error', status: :unauthorized
      return
    end

    account = account_get
    @gui_health = account.health
    @gui_mana = account.mana
    @gui_funny = account.funny
    @gui_money = account.money
    @gui_tired = account.tired

    check_lose
    @warning = session[:last_warn] || ''
  end

  def account_get
    Account.find_by(id: session[:user_id])
  end

  def update_screen
    account = account_get
    @gui_health = account.health
    @gui_mana = account.mana
    @gui_funny = account.funny
    @gui_money = account.money
    @gui_tired = account.tired
    redirect_to '/game'
  end

  def check_lose
    result = account_get.lose_log
    if result == ''
      @is_lose = false
    else
      session[:last_warn] = result
      @is_lose = true
    end
  end

  def start_new_game
    account_get.stats_reset
    session[:last_warn] = ''
    update_screen
  end

  def action_go_job
    session[:last_warn] = account_get.action_go_job
    update_screen
  end

  def action_go_behold
    session[:last_warn] = ''
    account_get.action_go_behold
    update_screen
  end

  def action_watch_series
    session[:last_warn] = ''
    account_get.action_watch_series
    update_screen
  end

  def action_go_bar
    session[:last_warn] = ''
    account_get.action_go_bar
    update_screen
  end

  def action_go_drink
    session[:last_warn] = ''
    account_get.action_go_drink
    update_screen
  end

  def action_go_sleep
    session[:last_warn] = ''
    account_get.action_go_sleep
    update_screen
  end

  def action_go_sing
    session[:last_warn] = account_get.action_go_sing
    update_screen
  end

  def on_click_button_exit; end
end
