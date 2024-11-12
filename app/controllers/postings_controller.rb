class PostingsController < ApplicationController
  def index
    @postings = Posting.all
  end

  def new
    @postings = Posting.new
  end

  def create
    @postings = Posting.new(posting_params)

    if @postings.save
      redirect_to home_about_path, notice: "Post Successfully created"

    else
      render :new, notice: "Error"
    end
  end


  private
  def posting_params
    params.require(:posting).permit(:place, :description, :rating, :location, :school_id, :profile_id)
  end
end
