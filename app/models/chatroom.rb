class Chatroom < ApplicationRecord
  belongs_to :festival
  has_many :messages
end
