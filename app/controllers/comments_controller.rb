class CommentsController < ApplicationController
  

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
       redirect_to album_path(params[:album_id])
     else
       @comment.errors.full_messages
     end
  end

  def index
    @comments = Comment.all
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    if @comment.save
      render  user_playlists_path(current_user)
    elsif @comment.empty?
      flash.now[:alert] = "Please input your comment in."
    end
end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to album_path(params[:album_id])
  end


  private

  def comment_params
    params.permit(:content, :album_id, :user_id)
  end
end
