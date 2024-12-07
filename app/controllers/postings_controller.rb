class PostingsController < ApplicationController
  include Pagy::Backend
  allow_browser versions: :modern
  before_action :set_current_user

  def index
    if session[:user_id]
      @postings_main = Posting.all
      @pagy, @postings = pagy_countless(Posting.where(school_id: Current.profile.school_id), limit: 3)


      respond_to do |format|
        format.html { render :index }
        format.turbo_stream { render :index }
      end

    else
        redirect_to sign_in_path
    end
  end

  def explore
    @temp = Posting.order("created_at DESC").limit(Posting.count)
      @pagy, @allPostings = pagy_countless(@temp, limit: 5)


      respond_to do |format|
        format.html { render :explore }
        format.turbo_stream { render :explore }
      end
  end

  def edit
    @posting = Posting.find(params[:id])
  end

  def show
    @postings = Posting.find(params[:id])
  end

  def update
    @posting = Posting.find(params[:id])

      if @posting.update(posting_edit_params)
        redirect_to about_path
      else

        redirect_to sign_in_path
      end
  end

  def about
    @pagy, @profile_postings = pagy_countless(Posting.where(profile_id: Current.profile.id), limit: 3)
    respond_to do |format|
      format.html { render :about }
      format.turbo_stream { render :about }
    end
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
        format.html { redirect_to profile_path, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @postings }
      else
        format.html { render :new, notice: "Error" }
        format.json { render json: home_about_path.errors, status: :unprocessable_entity }
      end
    end
  end


  private
  def set_posting
    @posting = Posting.find(params[:id])
  end

  def posting_params
    params.require(:posting).permit(:place, :description, :rating, :location, :school_id, :profile_id, images: [])
  end

  def posting_edit_params
    params.require(:posting).permit(:place, :description, :rating, :location, :school_id, :profile_id)
  end
end
