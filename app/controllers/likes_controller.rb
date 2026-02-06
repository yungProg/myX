class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post
  def create
    @like = @post.likes.build(liker: current_user)
    @like.save
    render partial: "posts/shared/liked", locals: { post: @post }
  end

  def destroy
    @like = @post.likes.find_by(liker: current_user)
    puts @like
    @like.destroy
    render partial: "posts/shared/unliked", locals: { post: @post }
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
