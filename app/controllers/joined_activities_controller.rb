class JoinedActivitiesController < ApplicationController
  def new
    @joined_acitivty = JoinedActivity.new
  end

  def create
    @joined_acitivty = JoinedActivity.new(joined_activity_params)

    if @joined_acitivty.save
      redirect_to activity_path(@activity), notice: "you have joined this activity"
    else
      render :new
    end
  end

  def joined_activity_params
    params.require(:joined_acitivty).permit(:current_user, :activity_id)
  end

end
