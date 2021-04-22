class AlbumsController < ApplicationController
  before_action :authenticate_user!


  def create
    @album = Album.new(album_params)
    @album.id = current_user.id
    if @album.save
      redirect_to user_playlists_path(current_user)
    elsif @comment.empty?
      flash.now[:alert] = "Please input your comment in."
    end
  end

  def new
    @album = Album.new
  end

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

    def show
        @album = Album.find(params[:id])
    end

    private

    def album_params
      params.require(:album).permit(:name, :release_date, :number_of_tracks, :images, :external_urls )
    end
end
