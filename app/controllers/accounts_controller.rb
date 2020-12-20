class AccountsController < ApplicationController
  def new

  end

  def create
    if params[:form_account][:nick] != '' && params[:form_account][:passwd] != '' && !Account.find_by(login: params[:form_account][:nick])
      @account = Account.new()
      @account.login = params[:form_account][:nick]
      @account.password = params[:form_account][:passwd]
      @account.save
      session[:user_id] = @account.id
      redirect_to "/menu"
    else
      render 'new'
    end
  end
end
