class OrdersController < ApplicationController
  before_action :move_to_sign_in, only:[:index, :create, :update]
  before_action :judge_seller, only:[:index, :create, :update]

  def index
    @order = Address.new
    @item = Item.find(params[:item_id])
  end

  def create
    binding.pry 
    @item = Item.find(params[:item_id])
    @order = OrderManagement.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to action: 'update'
    else
      render 'index'
    end
  end

  def update
  end
    


  private

  def move_to_sign_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def order_params
    params.permit(:postal_code, :shipping_area_id, :municipality, :address, :building_name, :telephone_number, :item_id).merge(user_id: current_user.id, token: params[:token])
  end

  def judge_seller
    if Item.find(params[:item_id]).user.id == current_user.id
      redirect_to root_path
    end
  end

  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 秘密鍵(書いてる時pushしてはいけない)
      Payjp::Charge.create(
        amount: @item.price,  # 値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類
      )
  end
end
