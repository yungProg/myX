class UserFollowingsController < ApplicationController
  def new
    # @user_following = UserFollowing.new
  end

  def create
    current_user.following_relationships.create(following_id: params[:following_id])
    redirect_back fallback_location: root_url
  end

  def destroy
    follower_id = current_user.id
    following_id = params[:id]
    relationship = UserFollowing.find_by(follower_id: follower_id, following_id: following_id)
    relationship.destroy
    redirect_back fallback_location: root_url
  end

  def update
    follower_id = params[:id]
    following_id = current_user.id
    relationship = UserFollowing.find_by(follower_id: follower_id, following_id: following_id)
    relationship.update(relationship_status: 1)
    redirect_back fallback_location: root_url
  end
end
