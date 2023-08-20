FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '札幌市中央区' }
    addresses { '1-1' }
    phone_number { '09012345678' }
    building_name { 'ビル' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end