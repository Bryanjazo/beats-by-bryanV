class PlaylistTracksController < ApplicationController
  before_action :authenticate_user!
  def index
    @playlist_tracks = PlaylistTrack.all
  end

  def create
    track = Track.find(:spotify_id)

    if !track
      s_track = Rspotify::Track.find(params[:spotify_id])
      track = Track.create_from_spotify_track(s_track)
  end

  @playlist_tracks = PlaylistTrack.create(:playlist_id: playlists_track_params[:playlist_id], track_id: track.id)
end

def update
  @playlist_track = PlaylistTrack.find(params[:id])
  @playlist_track.update(playlists_track_params)
end

def destroy
  @playlist_track = PlaylistTrack.find(params[:id])
  @playlist_track.destroy
end





def playlists_track_params
  params.permit(:track_id, :playlist_id)
end
