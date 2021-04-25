class CreatePlaylists < ActiveRecord::Migration[6.1]
  def change
    create_table :playlists do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :album, foreign_key: true
      
      t.integer :rating
      t.string :name


      t.timestamps
    end
  end
end
