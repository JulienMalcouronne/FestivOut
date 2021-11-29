class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :avatar
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :friends
  has_many :friend_requests, class_name: "Friend", foreign_key: "friend_id"
  has_many :messages
  has_many :orders
  # geocoded_by :GeolocationPosition
  has_many :notifications, as: :recipient
  has_many :reminders
end
