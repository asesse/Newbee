class ApplicationController < ActionController::Base
  def check_authorized(record, user)
    redirect_to root_path unless record.user == user
  end
end
