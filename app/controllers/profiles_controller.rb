class ProfilesController < ApplicationController
  def index
    if session[:user_id].nil?
      render plain: 'Access error', status: :unauthorized
      return
    end
    @warning = ''
    @account = Account.find_by(id: session[:user_id])
    @nickname = @account.login
    @points = @account.points
  end

  def create
    @account = Account.find_by(id: session[:user_id])
    if params[:form_profile][:password] == ''
      @warning = 'Invalid password!'
    else
      create_new_password
    end
    @nickname = @account.login
    @points = @account.points
    render 'index'
  end

  def create_new_password
    crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base[0..31])
    @account.password = crypt.encrypt_and_sign(params[:form_profile][:password])
    @account.save
    @warning = 'Password changed successfully!'
  end
end
