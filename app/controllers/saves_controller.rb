class SavesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    if session[:user_id].nil?
      render plain: 'Access error', status: :unauthorized
      return
    end

    saves_list = SaveSlot.where(account_id: session[:user_id]).all
    @save_names_list = []

    if !saves_list.nil?
      for it in saves_list
        @save_names_list.append(it.name)
      end
    end
  end

  def create
    slot = SaveSlot.new
    user = Account.find_by(id: session[:user_id])
    slot.set_from_account(user, params[:save_form][:savename])
    slot.save
    redirect_to '/game'
  end

  def on_click_load
    redirect_to '/game'
  end
end
