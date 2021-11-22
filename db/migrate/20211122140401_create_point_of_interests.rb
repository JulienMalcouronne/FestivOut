class CreatePointOfInterests < ActiveRecord::Migration[6.0]
  def change
    create_table :point_of_interests do |t|
      t.references :festival, null: false, foreign_key: true
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
