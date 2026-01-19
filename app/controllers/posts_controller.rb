class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      flash[:notice] = "Post created successfully"
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def like
    post = Post.find(params[:id])
    post.update(likes: post.likes + 1)
    redirect_back fallback_location: root_url
  end

  private

  def post_params
    params.expect(post: [ :content ])
  end
end
