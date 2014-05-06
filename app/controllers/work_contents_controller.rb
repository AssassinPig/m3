class WorkContentsController < ApplicationController
  def index
    @work_contents = WorkContent.all
  end
  def show
    @work_content = WorkContent.find(params[:id])
  end
end
