class Album < ApplicationRecord
  belongs_to :artist

  has_many :playlists
  has_many :users, through: :playlists
  has_many :tracks

  has_many :comments
end
