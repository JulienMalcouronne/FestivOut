class Item < ApplicationRecord
  belongs_to :shop
  monetize :price_cents
end
