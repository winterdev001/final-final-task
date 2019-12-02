class ApplicationsController < ApplicationController
  before_action :set_application, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_worker!
 
  def index
    @applications = Request.all
  end

 
  def show
  end

  def new
    @jobs = Job.all
    @job_id = params[:job_id]
    @application = Request.new
    Job.all.each do |job|
      id =@job_id.to_i    
      if job.id == id 
        @company_id = job.company.id
      end
    end
  end

  def edit
  end


  def create
    @application = Request.new(application_params)
   
      if @application.save
        redirect_to @application, notice: 'Application was successfully created.' 
      else
        render :new 
      end
  end

  def update  
      if @application.update(application_params)
        redirect_to @application, notice: 'Application was successfully updated.' 
      else
        render :edit 
      end
  end

  def destroy
    @application.destroy   
      redirect_to applications_url, notice: 'Application was successfully destroyed.'
  end

  private
    def set_application
      @application = Request.find(params[:id])
    end

    def application_params
      params.require(:request).permit(:content, :feedback, :status, :image, :worker_id, :company_id)
    end
end
