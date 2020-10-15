class OrderManagement
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :municipality, :address, :building_name, :telephone_number, :item_id, :user_id, :token

  validates :postal_code, :shipping_area_id, :municipality, :address, :telephone_number, :token, presence: true
  validates :shipping_area_id, numericality: { only_integer: true, greater_than: 1, message: 'を選択してください' }
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'は上3ケタ-下4ケタで入力してください' }
  validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: 'は正しく入力してください' }

  def save
    orderHistory = OrderHistory.create(user_id: user_id, item_id: item_id)

    Address.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipality: municipality, address: address, building_name: building_name, telephone_number: telephone_number, order_history_id: orderHistory.id)
  end
end
