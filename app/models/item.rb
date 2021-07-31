class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  belongs_to :order_de
  belongs_to :genre
  
end
