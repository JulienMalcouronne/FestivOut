class AddUsersToReminders < ActiveRecord::Migration[6.0]
  def change
    add_reference :reminders, :user, foreign_key: true
  end
end
