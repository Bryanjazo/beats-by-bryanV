class PlaylistTrack < ApplicationRecord
  belongs_to :playlist
  belongs_to :tracks
end
