class AlbumsController < ApplicationController
  before_action :authenticate_user!

   def create
       @spotify_album = RSpotify::Album.find(params[:album_id])

       @artist = Artist.find_or_create_by(name: @spotify_album.artists.first.name, genre: @spotify_album.artists.first.genres[0], image: @spotify_album.artists.first.images[0]["url"])
       @album = Album.find_or_create_by(name: @spotify_album.name, release_date: @spotify_album.release_date, number_of_tracks: @spotify_album.total_tracks, images: @spotify_album.images[0]["url"], artist: @artist, copyrights: @spotify_album.copyrights.first["text"], external_urls: @spotify_album.external_urls["spotify"], label: @spotify_album.label)
       if @album.tracks.empty?
           @spotify_album.tracks.each do |track|
               @album.tracks.build(name: track.name, duration_ms: track.duration_ms, explicit: track.explicit, track_number: track.track_number).save
           end
       end

       current_user.playlists.build(album: @album, rating: 0).save

       redirect_to user_plsylists_path(current_user)
   end

   def index
       if params[:user_id]
           user_playlists = Playlist.user(params[:user_id])

           #polymorphism
           # "highest_rated"
           # @vinyls = user_vinyls.send(params[:filter])

           if params[:filter] == "Highest Rated"
               @playlists = user_playlists.highest_rated
           elsif params[:filter] == "Lowest Rated"
               @playlists = user_playlists.lowest_rated
           elsif params[:filter] == "Newest Additions"
               @playlists = user_playlists.newest
           elsif params[:filter] == "Oldest Additions"
               @playlists = user_playlists.oldest
           else
               @playlists = User.find(params[:user_id]).vinyls
           end
       else
           @playlists = Playlist.all
       end
   end

   def show
       @playlist = Playlist.find(params[:id])
   end

   def destroy
       @vinyl = Vinyl.find(params[:id])
       @review = Review.where(user_id: current_user.id, album_id: @vinyl.album).first
       @review.destroy
       @vinyl.destroy

       redirect_to user_vinyls_path(current_user.id)
   end

end