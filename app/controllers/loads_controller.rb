class LoadsController < ApplicationController
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
    
    redirect_to '/game'
  end
end
