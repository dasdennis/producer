class PostsController < ApplicationController

  before_filter :categories

  def index
    @posts = Post.scoped
    @posts = @category.posts if @category.present?    
    @posts = @posts.search(params[:search]) if params[:search].present?
    @posts = @posts.published
  
    respond_with @posts do |format|
      format.atom
    end
  end

  def show
    @post = Post.find(params[:id])
    respond_with @post
  end

protected

  def categories
    @category = Category.find(params[:category_id]) if params[:category_id].present?
    @categories = Category.all
  end

end