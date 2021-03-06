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

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # GET /requests/new
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

  # GET /requests/1/edit
  def edit
    
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # def company_feedback
  #   @request = Request.all
  #   @requests = params[:request_id]
  #   @request = Request.find(params[:request_id])
  #   if @request.update(request_params)
  #     format.html { redirect_to @job, notice: 'Reply sent  successfully .' }
  #     format.json { render :show, status: :ok, location: @request }
  #   else
  #     format.html { render :edit }
  #     format.json { render json: @request.errors, status: :unprocessable_entity }
  #   end

  # end

  # PATCH/PUT /requests/1;/
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:content, :feedback, :status,:attachment , :worker_id, :company_id,:job_id)
    end
end
