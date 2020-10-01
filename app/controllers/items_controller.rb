class ItemsController < ApplicationController
before_action :move_to_sign_in, except: [:index, :show]

  def index
  end

  def new
  end

  private

  def item_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end
  
  def move_to_sign_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
