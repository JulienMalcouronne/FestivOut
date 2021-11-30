class Artist < ApplicationRecord
  belongs_to :day
  belongs_to :point_of_interest
  has_one_attached :image
  has_many :reminders
end
