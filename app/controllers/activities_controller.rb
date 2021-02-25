class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show]

  def index
    @activities = Activity.all
    @activities = Activity.search_by_name_and_description(params[:query][:user_search]) if check_user_search
    @activities = @activities.where(category_id: params[:query][:category]) if category_search

    @activities = @activities.where(date: params[:query][:start_date]..params[:query][:end_date]) if params[:query].present?  && params[:query][:start_date].present? && params[:query][:end_date]

    @markers = @activities.geocoded.map do |position|
      {
        lat: position.latitude,
        lng: position.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { activity: position })
      }
    end
  end

  def show
    @joined_activities = @activity.joined_activities
    if user_signed_in?
      @current_user_joined_activity = current_user.joined_activities.find_by(activity_id: @activity.id)
    end
    @all_messages = @activity.messages
    @message = Message.new
  end

  def new
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

  def category_search
    params[:query].present? && params[:query][:category].present?
  end

  def check_user_search
    params[:query].present? && params[:query][:user_search].present?
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:name, :location, :description, :date, :category_id, :age, :gender, :language)
  end
end
