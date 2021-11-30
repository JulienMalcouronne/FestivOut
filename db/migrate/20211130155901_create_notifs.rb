class CreateNotifs < ActiveRecord::Migration[6.0]
  def change
    create_table :notifs do |t|
      t.string :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
