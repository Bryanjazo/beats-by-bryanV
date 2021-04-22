class WelcomeController < ApplicationController




  def home
      @s_tracks = RSpotify::Playlist.browse_featured.first.tracks
      @albums = @s_tracks.map do |s_track|
        Track.new_from_spotify_track(s_track)
      end
  end

  def about; end

  def contact; end


end
