class FriendNotificationChannel < ApplicationCable::Channel
  def subscribed
    friend = Friend.find(params[:username])
    stream_for friend
  end

end
