class AccountsController < ApplicationController
  def new
    unless session[:user_id].nil?
      render plain: 'Access error', status: :unauthorized
      return
    end

    @warning = ''
  end

  def create
    if params[:form_account][:nick] == '' || params[:form_account][:passwd] == ''
      @warning = 'Invalid nickname or password!'
      render 'new'
    elsif !Account.find_by(login: params[:form_account][:nick]).nil?
      @warning = 'User with this nickname already exists!'
      render 'new'
    else
      create_new_account
    end
  end

  def create_new_account
    @account = Account.new
    initialize_account
    @account.save
    session[:user_id] = @account.id
    redirect_to '/menu'
  end

  def initialize_account
    @account.login = params[:form_account][:nick]
    @account.password = params[:form_account][:passwd]
    @account.health = 100
    @account.mana = 0
    @account.funny = 0
    @account.tired = 0
    @account.money = 0
    @account.points = 0
  end
end
