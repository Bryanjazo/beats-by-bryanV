class Playlist < ApplicationRecord

  validates :album_id, uniqueness: true

 belongs_to :user
 belongs_to :album
 has_one :review

#need a scope that will give me the top 5 most saved albums
#i need to figure out when i save an album to a users playlist how i can count how many each album has been saved to use
#order by DESC to get the top 5 and limit it to 5
# i need to add top_5 to playlists table
#count the amount of albums being saved into the playlist
#check album ID
#
#
# def self.top_5
#   if artist_id
#
# end
#
# SELECT (?,?) from GROUP BY

scope :oldest, -> { order(created_at: :asc)}
scope :newest, -> { order(created_at: :desc)}




end
