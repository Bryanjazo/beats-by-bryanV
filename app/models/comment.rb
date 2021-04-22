class Comment < ApplicationRecord
  validates :content, presence: true
  belongs_to :album
  belongs_to :user
end
