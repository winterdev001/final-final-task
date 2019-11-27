class HomesController < ApplicationController
  def index
    @jobs = Job.all.order("created_at DESC")
    # @title= Job.all.title
  end

  def show
  end

  def edit
  end

  def new
  end

  def _form
  end
end
