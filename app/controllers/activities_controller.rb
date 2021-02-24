class ActivitiesController < ApplicationController
  before_action :set_activity, only: [ :show ]

  def index 
    @activities = Activity.all
    @activities = Activity.where(category_id: params[:query][:category]) if params[:query].present?
  end

  def show
  
  end

  def new
    #check_authorized
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = current_user
    if @activity.save!
      redirect_to @activity, notice: "Your activity has been saved."
    else
      render :new
    end
  end


private
  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:name, :location, :description, :date, :category_id)
  end
end
