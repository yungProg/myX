class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true, uniqueness: { case_sensitive: false }

  has_many :follower_relationships, class_name: "UserFollowing", foreign_key: :following_id
  has_many :following_relationships, class_name: "UserFollowing", foreign_key: :follower_id

  has_many :followers, through: :follower_relationships, source: :following
  has_many :followings, through: :following_relationships, source: :follower

  has_many :posts, foreign_key: :author_id
  has_many :comments

  has_one :profile

  scope :other_users, ->(uid) { where.not("id = ?", uid) }
end
