class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_area

  has_one :order_history


  validates :postal_code, :shipping_area_id, :municipality, :address, :telephone_number, presence: true
  validates :shipping_area_id, numericality: { only_integer: true, greater_than: 1, message: 'を選択してください' }
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'を入力してください'}
  validates :telephone_number, format:{ with: /\A\d{10,11}\z/, message:'を入力してください'}
end
