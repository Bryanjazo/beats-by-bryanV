class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
    t.string :content
     t.integer :rating
     t.boolean :recommend
     t.belongs_to :user, foreign_key: true
     t.belongs_to :album, foreign_key: true
      t.timestamps
    end
  end
end
