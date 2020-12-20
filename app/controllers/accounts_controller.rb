class AccountsController < ApplicationController
  def new

  end

  def create
    @account = Account.new()
    @account.login = params[:form_account][:nick]
    @account.password = params[:form_account][:passwd]
    @account.save
    session[:user_id] = @account.id
    redirect_to "/menu"
  end
end
