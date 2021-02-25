class JoinedActivitiesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_joined_activity, only: [:edit, :update]

  def new
    @joined_activity = JoinedActivity.new
  end

  def create

      @joined_activity = JoinedActivity.new
      @joined_activity.activity_id = params[:activity_id]
      @joined_activity.user_id = current_user[:id]
      @joined_activity.status = "Pending"
      @joined_activity.save
      redirect_to activities_path, notice: "Your request was sent"

  end

  def edit
  end

  def update
    check_authorized(@joined_activity, current_user)
    @joined_activity.update(joined_activity_params)
    redirect_to activity_path(@joined_activity.activity)
  end

  private

  def joined_activity_params
    params.require(:joined_activity).permit(:current_user, :activity_id, :status)
  end

  def set_joined_activity
    @joined_activity = JoinedActivity.find(params[:id])
  end
end
