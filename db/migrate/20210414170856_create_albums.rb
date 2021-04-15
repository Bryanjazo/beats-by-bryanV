class CreateAlbums < ActiveRecord::Migration[6.1]
  def change
    create_table :albums do |t|
      t.string :name
      t.string :release_date
      t.integer :number_of_tracks
      t.string :images
      t.belongs_to :artist

      t.timestamps
    end
  end
end
