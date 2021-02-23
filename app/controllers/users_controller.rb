class UsersController < ApplicationController
  before_action :set_user, only: :show

  def show
    @joined_activities = @user.activities
  end

private

def set_user
  @user = User.find(params[:id])
end

end
