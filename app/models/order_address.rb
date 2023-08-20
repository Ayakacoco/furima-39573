class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :phone_number, :building_name, :item_id, :user_id
  attr_accessor :token

  validates :token, presence: true

  validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}

  validates :phone_number, presence: true, numericality: {with: /\A\d{10,11}\z/, message: "is invalid"}
  
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"} 

  with_options presence: true do
    validates :postal_code
    validates :city
    validates :addresses
    validates :phone_number
    validates :prefecture_id
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building_name: building_name, phone_number: phone_number, user_id: user_id)
  end
end