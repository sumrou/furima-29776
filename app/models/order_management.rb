class OrderManagement
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :municipality, :address, :building_name, :telephone_number, :item_id, :user_id, :token, :number, :cvc, :exp_month, :exp_year

  def save
    orderHistory = OrderHistory.create(user_id: user_id, item_id: item_id)

    Address.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipality: municipality, address: address, building_name: building_name, telephone_number: telephone_number, order_history_id: orderHistory.id)
  end
end