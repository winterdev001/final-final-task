class GraphicsController < ApplicationController
  def index
    @jobs = Job.where(:title =>'UI designing')
  end
end
