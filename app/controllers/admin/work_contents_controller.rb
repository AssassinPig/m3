class Admin::WorkContentsController < Admin::ApplicationController
  def new
    @work_content = WorkContent.new
  end
  
  def create
    @work_content = WorkContent.new(work_contents_params)
    if @work_content.save
      redirect_to admin_work_contents_path(@work_content)
    else
      render action:'new' 
    end
  end

  def destroy
    @work_content = WorkContent.find(params[:id])
    @work_content.destroy
    redirect_to admin_work_contents_path
  end

  def edit
    @work_content = WorkContent.find(params[:id])
  end

  def update
    @work_content = WorkContent.find(params[:id])
    @work_content.update(work_contents_params)
    redirect_to admin_work_contents_path(@work_content)
  end

  def index
    @work_contents = WorkContent.all.paginate(:page=>params[:page])
  end

  def show
    @work_content = WorkContent.find(params[:id])
  end

  def work_contents_params
    params.require(:work_content).permit(:title, :content, :work_contents, :work_pic_url, :work_logo_url)
  end
end
