class LoadsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    if session[:user_id].nil?
      render plain: 'Access error', status: :unauthorized
      return
    end

    saves_list = SaveSlot.where(account_id: session[:user_id]).all
    @save_names_list = []

    saves_list&.each do |it|
      @save_names_list.append(it.name)
    end
  end

  def create
    selected_save_name = params[:load_form][:saves_list]
    saves_list = SaveSlot.where(account_id: session[:user_id]).all
    saves_list&.each do |it|
      next unless it.name == selected_save_name

      user_load(it)
    end
    session[:last_warn] = ''
    redirect_to '/game'
  end

  def user_load(save_slot)
    user = Account.find_by(id: session[:user_id])
    user.load_from_saveslot(save_slot)
    user.save
  end
end
