class Admin::NewsContentsController < Admin::ApplicationController
  def new
    @news_content = NewsContent.new
  end
  
  def create
    @news_content = NewsContent.new(news_content_params)
    if @news_content.save
      redirect_to admin_news_content_path(@news_content)
    else
      render action:'new' 
    end
  end

  def destroy
    @news_content = NewsContent.find(params[:id])
    @news_content.destroy
    redirect_to admin_news_contents_path
  end

  def edit
    @news_content = NewsContent.find(params[:id])
  end

  def update
    @news_content = NewsContent.find(params[:id])
    @news_content.update(news_content_params)
    redirect_to admin_news_content_path(@news_content)
  end

  def index
    @news_contents = NewsContent.all.paginate(:page=>params[:page])
  end

  def show
    @news_content = NewsContent.find(params[:id])
  end

  def news_content_params
    params.require(:news_content).permit(:title, :summary, :content, :news_content, :news_pic_url)
  end
end
