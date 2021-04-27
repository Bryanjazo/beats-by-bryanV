class TracksController < ApplicationController
  before_action :authenticate_user!, except: [:top_100]

  def index
    @tracks = Track.all
  end

  def show
    @track = Track.find(:id)
      if track.valid?
        redirect_to
      else
        render 'new'
      end
    end


  def top_100
    # byebug
    # https://open.spotify.com/playlist/2kpoUUJ5a4Cw3feTkFJhZ2
    s_tracks = RSpotify::Playlist.find("1276640268","4hOKQuZbraPDIfaGbM3lKI").tracks
    @tracks = s_tracks.map do |s_track|
     Track.new_from_spotify_track(s_track)
    end
  end

end
