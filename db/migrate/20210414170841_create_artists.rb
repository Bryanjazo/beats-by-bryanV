class CreateArtists < ActiveRecord::Migration[6.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :release_date
      t.integer :number_of_tracks
      t.string :images
      t.bigint :artist_id
      t.string :copyrights
      t.string :external_urls
      t.string :label

      t.timestamps
    end
  end
end
