class AddToUserTofriends < ActiveRecord::Migration[6.0]
  def change
    add_reference(:friends, :friend, foreign_key: { to_table: :users })
  end
end
