class ActivitiesController < ApplicationController

  def index 
    @activities = Activity.all
  end
  def show
    @activity = Activity.find(params[:id])
  end


  def new
    #check_authorized
    @activity = Activity.new
  end

end
