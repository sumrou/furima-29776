class ItemsController < ApplicationController
  before_action :move_to_sign_in, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :price, :introduction, :category_id, :condition_id, :shipping_charge_id, :shipping_area_id, :days_to_ship_id).merge(user_id: current_user.id)
  end

  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
