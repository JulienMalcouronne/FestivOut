class Festival < ApplicationRecord
  has_many :shops
  has_many :days
  has_many :chatrooms
  has_many :pointOfInterests
  has_one_attached :image
end
