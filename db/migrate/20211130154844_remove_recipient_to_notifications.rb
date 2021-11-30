class RemoveRecipientToNotifications < ActiveRecord::Migration[6.0]
  def change
    remove_column :notifications, :recipient_type
    remove_column :notifications, :recipient_id
  end
end
