class Shop < ApplicationRecord
  belongs_to :festival
  has_many :items
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_one_attached :image
end
