class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "Comment posted"
      redirect_back fallback_location: Post.find(comment_params[:post_id])
    end
  end

  def comment_params
    params.expect(comment: [ :message, :post_id ])
  end
end
