class TrainingsController < ApplicationController
  def index
    @jobs = Job.where(:title =>'Training')
  end
end
