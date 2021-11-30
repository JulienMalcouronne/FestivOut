class Artist < ApplicationRecord
  belongs_to :day
  has_one_attached :image
  has_many :reminders
end
