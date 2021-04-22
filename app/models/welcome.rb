class Welcome < ApplicationRecord
  def self.new_from_spotify_track(spotify_track)
    Track.new(
      id: = spotify_track.id
      spotify_id: spotify_track.id,
      name: spotify_track.name,
      artist: spotify_track.artists[0].name,
      image: spotify_track.album.images[0]["url"],
      duration: spotify_track.duration_ms,
      popularity: spotify_track.popularity,
      preview: spotify_track.preview_url
    )
  end

  def self.create_from_spotify_track(spotify_track)
    track = self.new_from_spotify_track(spotify_track)
    track.save
    track
  end
end
