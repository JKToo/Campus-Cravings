class PostingsController < ApplicationController
  def index
    if params[:tag]
      @postings = Posting.tagged_with(params[:tag])
    else
      @postings = Posting.all
    end
    @postings = @postings.page(params[:page])
  end

  def show
  end

  def school_postings
    @postings = Posting.includes(Current.profile.school_id).all
    @postings = @postings.page(params[:page])
  end

  def school_postings_images
    @postings = Posting.all
  end

  def new
    @postings = Posting.new
  end

  def create
    @postings = Posting.new(posting_params)


    respond_to do |format|
      if @postings.save
        # redirect_to home_about_path, notice: "Post Successfully created"
        format.html { redirect_to home_about_path, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @postings }
      else
        format.html { render :new, notice: "Error" }
        format.json { render json: home_about_path.errors, status: :unprocessable_entity }
      end
    end
  end


  private
  def posting_params
    params.require(:posting).permit(:place, :description, :rating, :location, :school_id, :profile_id, images: [])
  end
end
