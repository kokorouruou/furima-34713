class Item < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :day_to_ship


  has_one_attached :image

  validates :title, :text, :price, :image, presence: true
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :product_condition_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :day_to_ship_id
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :price, format: { with: /\A[0-9]+\z/ }
end
