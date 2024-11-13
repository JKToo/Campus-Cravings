class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :set_current_user

  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
      Current.profile = Profile.find_by(user_id: session[:user_id])
      # Current.school = School.find_by(id: Current.profile.school_id)

    end
  end
end
