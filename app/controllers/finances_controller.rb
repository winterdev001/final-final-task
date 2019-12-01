class FinancesController < ApplicationController
  def index
    @jobs = Job.where(:title =>'Accounting')
  end
end
