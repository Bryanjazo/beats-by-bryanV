# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# def create_albums
# spotify =  RSpotify::Playlist.browse_featured.first.tracks
# spotify.create(name: params[:name],release_date: params[:release_date],number_of_tracks: params[:number_of_tracks],images: params[:images],artist_id: params[:artist_id],copyrights: params[:copyrights],external_urls: params[:external_urls])
# end

s_tracks = RSpotify::Playlist.find("1276640268","4hOKQuZbraPDIfaGbM3lKI").tracks
 s_tracks.each do |s_track|
   binding.pry
  Album.find_or_create_by(name: s_track.name, external_urls: s_track.external_urls, images: s_track.images, number_of_tracks: s_track.number_of_tracks,  artist: Artist.find_or_create_by(name: s_track.artists[0].name, genre: s_track.artists[0].genres, image: s_track.artists[0].images ))
  end
