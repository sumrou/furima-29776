class OrdersController < ApplicationController

  def index
    @order = Address.new
    @item = Item.find(params[:item_id])
  end

  def create
    item = Item.find_by(id: params[:format])
    @order = OrderManagement.new(order_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end


    private

    def order_params
      # params.permit(:postal_code, :shipping_area_id, :municipality, :address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: @item.id)
      params.permit(:postal_code, :shipping_area_id, :municipality, :address, :building_name, :telephone_number, :item_id).merge(user_id: current_user.id)
    end
end
