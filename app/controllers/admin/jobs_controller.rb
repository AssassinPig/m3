class Admin::JobsController < Admin::ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  def index
    @jobs = Job.all
  end

  def show
  end

  def new
    @job = Job.new
  end

  def edit
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to admin_job_path(@job)
    else
      render action:'new' 
    end
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    redirect_to admin_job_path(@job)
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to admin_jobs_path
  end

  private
  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :content)
  end
end
