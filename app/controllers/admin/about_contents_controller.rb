class Admin::AboutContentsController < Admin::ApplicationController
  def new
    @about_content = AboutContent.new
  end
  
  def create
    @about_content = AboutContent.new(about_content_params)
    if @about_content.save
      redirect_to admin_about_content_path(@about_content)
    else
      render action:'new' 
    end
  end

  def destroy
    @about_content = AboutContent.find(params[:id])
    @about_content.destroy
    redirect_to admin_about_contents_path
  end

  def edit
    @about_content = AboutContent.find(params[:id])
  end

  def update
    @about_content = AboutContent.find(params[:id])
    @about_content.update(about_content_params)
    redirect_to admin_about_content_path(@about_content)
  end

  def index
    @about_contents = AboutContent.all.paginate(:page=>params[:page])
  end

  def show
    @about_content = AboutContent.find(params[:id])
  end

  def about_content_params
    params.require(:about_content).permit(:title, :summary, :content, :about_content)
  end
end
