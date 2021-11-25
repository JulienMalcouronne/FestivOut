class Day < ApplicationRecord
  belongs_to :festival
  has_many :artists
end
