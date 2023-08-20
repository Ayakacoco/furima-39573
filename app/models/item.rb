class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shopping_fee
  belongs_to :prefecture
  belongs_to :scheduled_delivery
  
  with_options presence: true do
    validates :item_name, length: { maximum: 40 }
    validates :product, length: { maximum: 1000 }
    validates :image
    validates :category
    validates :sales_status
    validates :shopping_fee
    validates :prefecture
    validates :scheduled_delivery
  end

  validates :price, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999
  }

  validates :category_id, :prefecture_id, :sales_status_id, :scheduled_delivery_id, :shopping_fee_id, numericality: { other_than: 1 , message: "can't be blank"} 

end
