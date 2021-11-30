class Friend < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"
  after_update :build_notification
  after_create :add_notification

  private

  def build_notification

  Notification.create!(
    content: "#{friend.username} has accepted your friend request",
    user_id: user.id
  )
  end

  def add_notification

  Notification.create!(
    content: "#{user.username} sent you a friend request",
    user_id: friend.id
  )
  end
end
