class ContentsController < ApplicationController
  def index
    @jobs = Job.where(:title =>'Content creation')
  end
end
