class Post < ApplicationRecord
  has_many :likes
  has_many :likers, through: :likes

  has_many :comments
  belongs_to :author, class_name: "User"
  validates :content, presence: true
end
