class Address < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"} 

  with_options presence: true do
    validates :postal_code
    validates :city
    validates :addresses
    validates :phone_number

  belong_to :order
end
