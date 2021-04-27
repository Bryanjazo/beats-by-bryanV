class Comment < ApplicationRecord
  validates :content, presence: true
  validates(:content, { :length => { :minimum => 5 } })
  belongs_to :album
  belongs_to :user
end
