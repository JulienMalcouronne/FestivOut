class AddKeyToArtists < ActiveRecord::Migration[6.0]
  def change
    add_reference :artists, :point_of_interest, foreign_key: true
  end
end
