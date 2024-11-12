class HomeController < ApplicationController
  def index
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
      @profile = Profile.find_by(user_id: session[:user_id])
      @posting = Posting.find_by(profile_id: Current.profile.id)
    end
  end

  def about
  end

  def abouter
  end
end
