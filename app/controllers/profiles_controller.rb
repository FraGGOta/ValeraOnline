class ProfilesController < ApplicationController
  def index
    if session[:user_id].nil?
      render plain: 'Access error', status: :unauthorized
      return
    end
    @warning = ''
    account = Account.find_by(id: session[:user_id])
    @nickname = account.login
    @points = account.points
  end

  def create
    account = Account.find_by(id: session[:user_id])
    if params[:form_profile][:password] == ''
      @warning = 'Invalid password!'
    else
      account.new_password(params[:form_profile][:password])
      @warning = 'Password changed successfully!'
    end
    @nickname = account.login
    @points = account.points
    render 'index'
  end
end
