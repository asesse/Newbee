class ActivitiesController < ApplicationController
  def show
    @activity = Activity.find(params[:id])
  end


  def new
    #check_authorized
    @activity = Activity.new
  end

end
