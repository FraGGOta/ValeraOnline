class SessionsController < ApplicationController
  def new
    unless session[:user_id].nil?
      render plain: 'Access error', status: :unauthorized
      return
    end

    @warning = ''
  end

  def create
    user = Account.find_by(login: params[:form_account][:nick])
    decrypted = decrypted_password_user(user.password)
    if user && (decrypted == params[:form_account][:passwd])
      session[:user_id] = user.id
      redirect_to '/menu'
    else
      @warning = 'Incorrect nickname or password!'
      render 'new'
    end
  end

  def decrypted_password_user(password)
    crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base[0..31])
    crypt.decrypt_and_verify(password)
  end
end
