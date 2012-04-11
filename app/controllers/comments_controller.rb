class CommentsController < ApplicationController

  def index
    @comments = Post.find(params[:post_id]).comments
    respond_with @comments
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])

    unless @comment.save
      flash[:alert] = "Fail to receive your comment."
    end
    
    redirect_to @post
  end

end
