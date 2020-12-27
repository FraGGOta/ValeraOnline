class SavesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    if session[:user_id].nil?
      render plain: 'Access error', status: :unauthorized
      return
    end
  end

  def create
    slot = SaveSlot.new
    user = Account.find_by(id: session[:user_id])
    slot.set_from_account(user, params[:save_form][:savename])
    slot.save
    redirect_to '/game'
  end
end
