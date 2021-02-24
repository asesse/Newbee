class JoinedActivitiesController < ApplicationController

  before_action :check_authorized, only: [:edit, :update]
  before_action :set_joined_activity, only: [:edit, :update]

  def new
    @joined_activity = JoinedActivity.new
  end

  def create
    @joined_activity = JoinedActivity.new(joined_activity_params)
    @joined_activity.user = current_user

    if @joined_activity.save
      redirect_to activity_path(@activity), notice: "You have joined this activity"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @joined_activity.update(joined_activity_params)
    redirect_to activity_path(@activity)
  end

  private

  def joined_activity_params
    params.require(:joined_activity).permit(:current_user, :activity_id, :status)
  end

  def set_joined_activity
    @joined_activity = JoinedActivity.find(params[:id])
  end

end
