class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy,:web]
  before_action :authenticate_company!, only: [:new,:show,:edit,:destroy]

  def index
    @jobs = Job.all
    @requests= Request.all
    @feedbacks = Feedback.all
    @transactions = Transaction.all
  end


  def show
  end

  def web
    @jobs = Job.where(:title =>'software development').all
  end

  def new
    @job = Job.new
  end

  def edit
  end


  def create
    @job = Job.new(job_params)

    if @job.save
        redirect_to @job, notice: 'Job was successfully created.' 
      else
        render :new 
      end
  end

  def update
      if @job.update(job_params)
        redirect_to @job, notice: 'Job was successfully updated.' 
      else
        render :edit 
      end
  end

  def destroy
    @job.destroy
      redirect_to jobs_url, notice: 'Job was successfully destroyed.' 
  end

  private

  def set_job
      @job = Job.find(params[:id])
    end


    def job_params
      params.require(:job).permit(:title, :deadline, :amount, :status, :job_type, :location, :remote, :description, :company_id)
    end
end
