class AddRelationshipStatusToUserFollowing < ActiveRecord::Migration[8.1]
  def change
    add_column :user_followings, :relationship_status, :integer
  end
end
