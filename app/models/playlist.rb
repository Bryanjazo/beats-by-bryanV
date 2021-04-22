class Playlist < ApplicationRecord

 belongs_to :user
 belongs_to :album
 has_one :review

 scope :oldest, -> { order(created_at: :asc)}
 scope :newest, -> { order(created_at: :desc)}
 scope :highest_rated, -> { order(rating: :desc)}
 scope :lowest_rated, -> { order(rating: :asc)}
 scope :user, -> (user) { where("user_id = ?", user) }

end
