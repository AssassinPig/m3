class AboutContentsController < ApplicationController
  def index
    @about_contents = AboutContent.all.limit(2)
  end

  def show
    @about_content = AboutContent.find(params[:id])
  end
end
