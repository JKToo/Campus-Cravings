class SearchController < ApplicationController
  include Pagy::Backend

  def index
    @q = Posting.ransack(params[:q])
    @q1 = Profile.ransack(params[:q])
    @postings = @q.result(distinct: true)
    @profiler = @q1.result(distinct: true)


    @pagy, @profiled = pagy_countless(@profiler, limit: 4)
    @pagy2, @posts = pagy_countless(@postings, limit: 5)

    respond_to do |format|
      format.html { render :search }
      format.turbo_stream { render :search }
    end
  end
end
