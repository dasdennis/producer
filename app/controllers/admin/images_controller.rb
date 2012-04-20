class Admin::ImagesController < Admin::BaseController

  menu_item :images

  def index
    @images = Image.paginate(:page => params[:page], :per_page => 2)
    respond_with @images
  end

  def new
    @image = Image.new
    respond_with @image
  end

  def edit
    @image = Image.find(params[:id])
  end

  def show
    @image = Image.find(params[:id])
    respond_with @image
  end

  def create
    @image = Image.new(params[:image])
    flash[:notice] = 'Image was successfully created.' if @image.save
    respond_with @image, :location => [:admin, @image]
  end

  def update
    @image = Image.find(params[:id])
    flash[:notice] = 'Image was successfully updated.' if @image.update_attributes(params[:image])
    respond_with @image, :location => [:admin, @image]
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    respond_with @image, :location => admin_images_path
  end

end