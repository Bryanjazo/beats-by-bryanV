class CommentsController < ApplicationController
  before_action :authenticate_user!
#unexplicit search
def create
@comment = Comment.new(comment_params)
@comment.user_id = current_user.id
if @comment.save
   redirect_to album_path(params[:album_id])
 else
    flash[:error] = "Comment's Can't Be Blank"
    redirect_to album_path(params[:album_id])
 end
end

def new
  @album = Album.find(params[:album_id])
  @comment = Comment.new
end

def index
@comments = Comment.all
end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy if current_user.playlists.include?(@comment)
    redirect_to album_path(params[:album_id])
  end


  private

  def comment_params
    params.require(:comment).permit(:content, :album_id, :user_id, :error, :name)
  end
end
