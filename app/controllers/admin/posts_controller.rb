class Admin::PostsController < Admin::BaseController
  before_filter :load_resources, :only => %w(new create edit update)

  menu_item :posts

  def index
    @posts = Post.all
    respond_with @posts
  end

  def show
    @post = Post.find(params[:id])
    respond_with @post do |format|
      format.html { render :layout => "application" }
    end
  end

  def new
    @post = Post.new
    respond_with @post
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params[:post])

    flash[:notice] = 'Post was successfully created.' if @post.save
    respond_with @post, :location => admin_posts_path
  end

  def update
    @post = Post.find(params[:id])
    flash[:notice] = 'Post was successfully updated.' if @post.update_attributes(params[:post])
    respond_with @post, :location => edit_admin_post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_with @post, :location => admin_posts_path
  end

  def images
    @images = paginated_images
  end

protected

  def load_resources
    @authors = User.all
    @categories = Category.all
    @images = paginated_images
  end

  def paginated_images
    Image.paginate(:page => params[:page], :per_page => 4)    
  end

end