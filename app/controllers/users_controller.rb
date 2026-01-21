class UsersController < ApplicationController
  def index
    @users = User.other_users(current_user.id)
    @pending_followers = current_user.followers.where("relationship_status = ?", 2)
    @followings = current_user.followings.where("relationship_status = ?", 1)
    @followers = current_user.followers.where("relationship_status = ?", 1)
  end
end
