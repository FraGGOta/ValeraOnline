class SessionsController < ApplicationController
  def new
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
