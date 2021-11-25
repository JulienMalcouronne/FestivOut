class CreateArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :finish_time
      t.references :day, null: false, foreign_key: true

      t.timestamps
    end
  end
end
