class NewsContentsController < ApplicationController
  def index
    @news_contents = NewsContent.all 
  end
  def show
    @news_content = NewsContent.find(params[:id])
  end
end
