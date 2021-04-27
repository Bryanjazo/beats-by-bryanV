class Comment < ApplicationRecord
  validates :content, presence: true
  validates(:content, { :length => { :minimum => 1 } })
  belongs_to :album
  belongs_to :user
end
