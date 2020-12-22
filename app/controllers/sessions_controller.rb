class SessionsController < ApplicationController
  def new
    if !session[:user_id].nil?
      render plain: 'Access error', status: :unauthorized
      return
    end

    @warning = ""
  end

  def create
    user = Account.find_by(login: params[:form_account][:nick])
    if user && (user.password == params[:form_account][:passwd])
      session[:user_id] = user.id
      redirect_to "/menu"
    else
      @warning = 'Incorrect nickname or password!'
      render 'new'
    end
  end
end
