class HomeController < ApplicationController
  def index
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
      @profile = Profile.find_by(user_id: session[:user_id])
    end
  end

  def about
  end

  def abouter
  end
end
