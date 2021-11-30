class Friend < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"
  after_update :build_notification

  private

  def build_notification
    @user = current_user

    puts ""
  end
end
