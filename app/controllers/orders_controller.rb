class OrdersController < ApplicationController

  def index
    @order = Address.new
    @item = Item.find_by(id: params[:format])
  end

  def create
    binding.pry
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
      params.permit(:postal_code, :shipping_area_id, :municipality, :address, :building_name, :telephone_number).merge(user_id: user.id)
    end
end
