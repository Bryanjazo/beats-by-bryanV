class Review < ApplicationRecord

    belongs_to :album
    belongs_to :user
    belongs_to :playlists


end
