class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :day_to_ship

  has_one_attached :image
  
  validates :title, :text, :price, :image, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :product_condition_id, numericality: { other_than: 1 }
  validates :delivery_charge_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :day_to_ship_id, numericality: { other_than: 1 }
  validates :price,numericality:{ greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :price,format: { with: /\A[0-9]+\z/ }
end
