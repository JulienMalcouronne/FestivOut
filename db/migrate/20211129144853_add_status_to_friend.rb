class AddStatusToFriend < ActiveRecord::Migration[6.0]
  def change
    add_column :friends, :status, :string, :default => "pending"
  end
end
