class CreateFestivals < ActiveRecord::Migration[6.0]
  def change
    create_table :festivals do |t|
      t.string :name
      t.datetime :date
      t.text :description

      t.timestamps
    end
  end
end
