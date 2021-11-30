class AddArtistToReminders < ActiveRecord::Migration[6.0]
  def change
    add_reference :reminders, :artist, foreign_key: true
  end
end
