class JoinedActivitiesController < ApplicationController

  def new
    @joined_activity = JoinedActivity.new
  end

  def create

    if current_user[:id].nil?
      redirect_to activities_path, notice: "Please log in to join an activity"
    else
      @joined_activity = JoinedActivity.new
      @joined_activity.activity_id = params[:activity_id]
      @joined_activity.user_id = current_user[:id]
      @joined_activity.status = "pending"
      @joined_activity.save

      redirect_to activities_path, notice: "Your request was sent"
    end
  end
end

