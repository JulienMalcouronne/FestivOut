class Shop < ApplicationRecord
  belongs_to :festival
  has_many :items
end
