class ArchitectsController < ApplicationController
  def index
    @jobs = Job.where(:title =>'Engineering')
  end
end
