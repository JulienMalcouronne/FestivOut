class Item < ApplicationRecord
  belongs_to :shop
  monetize :price_cents
  has_one_attached :image
end
