class UserFollowing < ApplicationRecord
  belongs_to :follower, class_name: "User", foreign_key: :following_id
  belongs_to :following, class_name: "User", foreign_key: :follower_id

  enum :relationship_status, { rejected: 0, accepted: 1, pending: 2 }
  before_create :set_default_relationship_status

  def set_default_relationship_status
    self.relationship_status = 2
  end
end
