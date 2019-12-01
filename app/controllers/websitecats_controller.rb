class WebsitecatsController < ApplicationController
  def index
    @jobs = Job.where(:title =>'Software Developer')
  end
end
