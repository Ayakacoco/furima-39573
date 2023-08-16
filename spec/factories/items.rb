FactoryBot.define do
  factory :item do
    item_name { Faker::Lorem.characters(number: 20) }
    product { Faker::Lorem.characters(number: 900) }

    category { Category.where.not(id: 1).sample }
    sales_status { SalesStatus.where.not(id: 1).sample }
    shopping_fee { ShoppingFee.where.not(id: 1).sample }
    prefecture { Prefecture.where.not(id: 1).sample }
    scheduled_delivery { ScheduledDelivery.where.not(id: 1).sample }
    price { rand(300..9_999_999) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    association :user
  end
end