class OrderManagement
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area, :municipality, :address, :building_name, :telephone_number

  def save
    orderHistory = OrderHistory.create(user_id: user.id, item_id: item.id)

    Address.create(postal_code: postal_code, shipping: shipping_area, municipality: municipality, address: address, building_name: building_name, telephone_number: telephone_number, order_history_id: orderHistory.id)
  end
end