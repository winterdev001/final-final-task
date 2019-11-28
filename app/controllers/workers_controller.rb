class WorkersController < ApplicationController

  def index
    @workers = Worker.all
  end

  def show
  end
end
