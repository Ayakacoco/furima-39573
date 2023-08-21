class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :phone_number, :building_name, :item_id, :user_id, :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "は「3桁ハイフン4桁」で入力してください"}
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "は10桁以上11桁以内の半角数値のみで入力してください"}
    validates :prefecture_id, numericality: { other_than: 1 , message: "は---以外で入力してください"} 
    validates :city
    validates :addresses
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building_name: building_name, phone_number: phone_number, user_id: user_id)
  end
end