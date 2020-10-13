FactoryBot.define do
  factory :address do
    
    token {"tok_abcdefghijk00000000000000000"}
    postal_code { '123-4567' }
    shipping_area_id { 2 }
    municipality { "なんとか区" }
    address { "なんたら1-2-3" }
    building_name { "うんたらタワマン1-2-3"}
    telephone_number { "09012345678" }
  end
end
