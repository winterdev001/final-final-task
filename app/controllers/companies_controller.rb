class CompaniesController < ApplicationController
  def index
    @companies = Company.all
    @jobs = Job.all
    @requests= Request.all
    @feedbacks = Feedback.all
    @transactions = Transaction.all
  end

  def show
    
  end
end
