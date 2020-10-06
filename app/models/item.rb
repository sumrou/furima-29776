class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :days_to_ship
  belongs_to_active_hash :condition

  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  validates :category_id, :condition_id, :shipping_charge_id, :shipping_area_id, :days_to_ship_id, numericality: { only_integer: true, greater_than: 1, message: 'を選択してください' }
  validates :name, :introduction, :price, :category_id, :condition_id, :shipping_charge_id, :shipping_area_id, :days_to_ship_id, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000, message: 'は300~9,999,999の間で入力してください' }
  validates :price, format: { with: /\A\d{3,7}\z/, message: 'は半角数字で入力してください' }
end
