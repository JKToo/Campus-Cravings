 require "uri"
 require "net/http"
class HomeController < ApplicationController
  include Pagy::Backend

  def index
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
      @profile = Profile.find_by(user_id: session[:user_id])
      @feedpostings = Posting.where(school_id: Current.profile.school_id).page(params[:page]).per(8)

    # @posting = Posting.find_by(profile_id: Current.profile.id)
    #


    else
      redirect_to sign_in_path
    end
  end

  def about
  end

  def abouter
  end
end
