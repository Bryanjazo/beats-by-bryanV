class CommentsController < ApplicationController
  before_action :authenticate_user!

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
    @comment = Comment.new
  end

  def index
    @comments = Comment.all
  end


  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to album_path(params[:album_id])
  end


  private

  def comment_params
    params.permit(:content, :album_id, :user_id, :error)
  end
end
