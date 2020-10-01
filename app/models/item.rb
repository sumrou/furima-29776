class Item < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :user
  has_one_attached :image

  validates :name, :introduction, :price, :category_id, :condition_id, :shipping_charges_id, :shipping_area_id, :days_to_ship_id, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9999999 }
  validates :price, format: { with: /\A\d\z/, message: 'は半角数字で入力してください'}
  
end
