class SavesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    return unless session[:user_id].nil?

    render plain: 'Access error', status: :unauthorized
  end

  def create
    user = Account.find_by(id: session[:user_id])
    selected_save_name = params[:save_form][:savename]
    saves_list = SaveSlot.where(account_id: session[:user_id]).all
    saves_list&.each do |it|
      next unless it.name == selected_save_name

      rewrite_slot(it, user)
      return
    end

    create_new_slot(user)
  end

  def rewrite_slot(slot, user)
    slot.set_from_account(user, params[:save_form][:savename])
    slot.save
    redirect_to '/game'
  end

  def create_new_slot(user)
    slot = SaveSlot.new
    slot.set_from_account(user, params[:save_form][:savename])
    slot.save
    redirect_to '/game'
  end
end
