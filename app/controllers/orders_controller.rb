class OrdersController < ApplicationController
  before_action :move_to_sign_in, only: [:index, :create, :update]
  before_action :judge_seller, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!


  def index
    @order = OrderManagement.new(order_params)
  end

  def create
    @order = OrderManagement.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end

  def order_params
    params.permit(:postal_code, :shipping_area_id, :municipality, :address, :building_name, :telephone_number, :item_id).merge(user_id: current_user.id, token: params[:token])
  end

  def judge_seller
    redirect_to root_path if Item.find(params[:item_id]).user.id == current_user.id
  end
  
  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # 秘密鍵(書いてる時pushしてはいけない)
    Payjp::Charge.create(
      amount: @item.price, # 値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類
    )
  end
end
