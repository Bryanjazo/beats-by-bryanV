class AlbumsController < ApplicationController

  before_action :authenticate_user!, except: [:show]

  def index

        if params[:artist]
            @album = Album.all.collect do |album|
                if album.artist.name.downcase.include?(params[:artist].downcase)
                    album
                end
            end.compact
        else
            @album = Album.all
        end
        if @album.empty?
         flash.now[:alert] = "Sorry, there are no matches for that artist."
     end
 end

  def new
    @album = Album.new
  end


    def show
      if @album_id = params[:album_id]
        @album = RSpotify::Album.search(params[:album_id]).first
      else
         @album = Album.find(params[:id])
       end
    end

    private

    def album_params
      params.require(:album).permit(:name, :release_date, :number_of_tracks, :images, :external_urls )
    end
end
