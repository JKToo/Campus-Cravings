class SearchController < ApplicationController
  def index
    @q = Posting.ransack(params[:q])
    @q1 = Profile.ransack(params[:q])
    @postings = @q.result(distinct: true)
    @profiles = @q1.result(distinct: true)
  end
end
