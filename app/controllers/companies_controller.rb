class CompaniesController < ApplicationController
  def index
    @companies = Company.all
    @jobs = Job.all
    @requests= Request.all
    @feedbacks = Feedback.all
    @transactions = Transaction.all
    @workers = Worker.all
  end

  def show
    @company = Company.find(params[:id])
    @comments = @company.comments
    @comment = @company.comments.build
    @worker_id = params[:worker_id]
  end
end
