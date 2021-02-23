class JoinedActivitiesController < ApplicationController

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

  def joined_activity_params
    params.require(:joined_activity).permit(:current_user, :activity_id)
  end

end
