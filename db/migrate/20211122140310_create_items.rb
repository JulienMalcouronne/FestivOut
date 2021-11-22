class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :shop, null: false, foreign_key: true
      t.integer :price
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
