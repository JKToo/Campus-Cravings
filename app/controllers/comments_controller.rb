class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def create
    @comments = Comment.new(comment_params)
      if @comments.save
        redirect_to root_path, notice: "Successfully posted comment"
      end
end


  private
  def comment_params
    params.permit(:content, :posting_id, :profile_id)
  end
end
