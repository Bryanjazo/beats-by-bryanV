class CreateTracks < ActiveRecord::Migration[6.1]
  def change
    create_table :tracks do |t|
      t.string :name
      t.integer :duration_ms
      t.boolean :explicit
      t.integer :track_number
      t.string :artist
      t.string :image
      t.float :duration
      t.integer :popularity
      t.string :preview
      t.string :spotify_id

      t.belongs_to :album, foreign_key: true
      t.timestamps
    end
  end
end
