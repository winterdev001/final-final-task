class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_worker!, :only => [:new]
  # before_action :authenticate_company!
  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all
    @feedbacks = Feedback.all
  end

  def show
  end

  def new
    @request = Request.new
    @jobs = Job.all
    @job_id = params[:job_id]
   
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
    @request = Request.new(request_params)

      if @request.save
        redirect_to @request, notice: 'Request was successfully created.' 
        render :new 
      end
  end
 
  def update    
    # Job.all.each do |job|
    #   id =@job_id.to_i    
    #   if job.id == id 
    #     @company_id = job.company.id
    #   end
    # end
    @company_id = params[:company_id]

    if @request.update(request_params)      
      if current_worker
        redirect_to workers_path, notice: 'Request was successfully updated.' 
      else
        redirect_to companies_path, notice: 'Request was successfully updated.'     
      end       
    else
      render :edit         
    end
  end
  
  def destroy
    @request.destroy
      if current_worker
        redirect_to workers_path, notice: 'Request was successfully destroyed.' 
      else
        redirect_to companies_path, notice: 'Request was successfully destroyed.'      
    end
  end

  private
    def set_request
      @request = Request.find(params[:id])
    end

    def request_params
      params.require(:request).permit(:content, :feedback, :status,:attachment , :worker_id, :company_id,:job_id)
    end
end
