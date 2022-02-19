class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new (comment_params)
    @comment.post_id = @post.id
    @comment.save
    # redirect_to request.referer 非同期通信
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    # redirect_to post_path(params[:post_id]) 非同期通信
  end


  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
