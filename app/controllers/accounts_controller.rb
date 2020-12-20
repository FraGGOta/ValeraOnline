class AccountsController < ApplicationController
  def new

  end

  def create
    # render plain: params[:form_account].inspect
    @account = Account.new(params.require(:form_account).permit(:login, :password))
    @account.save
    puts
    puts @account.id
    puts
    redirect_to "/menu"
    # redirect_to @account
  end

  def on_click_button_submit

  end
end
