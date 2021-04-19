class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :email, uniqueness: true

  devise :omniauthable, :omniauth_providers => [:spotify]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :playlists
  has_many :albums, through: :playlists
  has_many :comments

  has_many :reviews

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.image = auth.info.image
    end
  end

end
