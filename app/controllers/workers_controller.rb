class WorkersController < ApplicationController

  def index
    @workers = Worker.all
    @requests = Request.all.order('created_at DESC')
    @feedbacks = Feedback.all
  end

  def show
    @worker = Worker.find(params[:id])
    # @comments = @company.comments
    # @comment = @company.comments.build
  end
end
