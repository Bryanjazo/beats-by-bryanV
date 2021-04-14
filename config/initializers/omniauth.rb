require 'rspotify/oauth'


Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, "3eaa5dc2ccbb4385b0fea02620786bdc", "aa2bff48c48f4e13b541b100a867516f", scope: 'user-read-email playlist-modify-public user-library-read user-library-modify'
end
