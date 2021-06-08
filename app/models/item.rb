class Item < ApplicationRecord

  has_one_attached : image
  
  with_options presence: true do
    validates :title
    validates :text
    validates :price
    validates :category_id
    validates :product_condition_id
    validates :delivery_charge_id
    validates :day_to_ship_id
  end

end
