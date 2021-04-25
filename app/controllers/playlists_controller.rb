class PlaylistsController < ApplicationController
  before_action :authenticate_user!

  def create
      @spotify_album = RSpotify::Album.find(params[:album_id])
      @artist = Artist.find_or_create_by(name: @spotify_album.artists.first.name, genre: @spotify_album.artists.first.genres[0], images: @spotify_album.artists.first.images[0]["url"])
      @album = Album.find_or_create_by(name: @spotify_album.name, release_date: @spotify_album.release_date, number_of_tracks: @spotify_album.total_tracks, images: @spotify_album.images[0]["url"], artist: @artist, copyrights: @spotify_album.copyrights.first["text"], external_urls: @spotify_album.external_urls["spotify"])
      if @album.tracks.empty?
          @spotify_album.tracks.each do |track|
              @album.tracks.build(name: track.name, duration_ms: track.duration_ms, explicit: track.explicit, track_number: track.track_number).save
          end
        end

     current_user.playlists.build(album: @album, rating: 0, name: "Playlist Name").save
     redirect_to user_playlists_path(current_user)
  end


  def index
     if params[:user_id]
        @playlists = User.find(params[:user_id]).playlists
           else
        @playlists = Playlist.all
    end
  end

  def show
    @playlist = Playlist.find(params[:id])
  end


  def destroy
   @playlist = Playlist.find(params[:id])
    @playlist.destroy
    redirect_to user_playlists_path(current_user.id)
  end


end
