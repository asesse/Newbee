class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    @joined_activities = @user.activities
    @created_activities = @user.created_activities
  end

private

def set_user
  @user = User.find(params[:id])
end

end
