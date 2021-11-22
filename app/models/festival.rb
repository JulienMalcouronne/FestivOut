class Festival < ApplicationRecord
  has_many :shops
  has_many :chatrooms
  has_many :pointOfInterests
end
