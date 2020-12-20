class SessionsController < ApplicationController
  def new

  end

  def create
    user = Account.find_by(login: params[:form_account][:nick])
    if user && (user.password == params[:form_account][:passwd])
      session[:user_id] = user.id
      redirect_to "/menu"
    else
      render 'new'
    end
  end
end
