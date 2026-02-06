class Like < ApplicationRecord
  validates :user_id, uniqueness: { scope: :post_id, message: "You have already liked this post" }
  belongs_to :liker, class_name: "User", foreign_key: :user_id
  belongs_to :post
end
