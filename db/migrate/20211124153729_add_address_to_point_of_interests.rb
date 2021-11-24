class AddAddressToPointOfInterests < ActiveRecord::Migration[6.0]
  def change
    add_column :point_of_interests, :address, :string
    add_column :point_of_interests, :latitude, :float
    add_column :point_of_interests, :longitude, :float
  end
end
