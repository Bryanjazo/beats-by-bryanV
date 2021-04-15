class ArtistsController < ApplicationController
  before_action :authenticate_user!

  def search
  end

  def index
    if !params[:artist_name].empty?
      @artists = RSpotify::Artist.search(params[:artist_name])
    else
      redirect_to root_path
    end
  end

  def show
    @artist = RSpotify::Artist.find(params[:id])
    respond_to do |f|
      f.html {render :show}
      f.json {render json: @artist.albums}
    end
  end

end
