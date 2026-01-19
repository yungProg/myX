class UserFollowingsController < ApplicationController
  def new
    # @user_following = UserFollowing.new
  end

  def create
    current_user.following_relationships.create(following_id: params[:following_id])
    redirect_back fallback_location: root_url
  end
end
