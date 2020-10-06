FactoryBot.define do
  factory :item do
    name { '商品名' }
    image { 'public/images/test_image.png' }
    introduction { '商品説明' }
    category_id { 2 }
    condition_id { 2 }
    shipping_charge_id { 2 }
    shipping_area_id { 2 }
    days_to_ship_id { 2 }
    price { '3000' }
    user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
