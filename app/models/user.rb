class User < ApplicationRecord
  attr_writer :login

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, multiline: true

  has_many :follower_relationships, class_name: "UserFollowing", foreign_key: :following_id
  has_many :following_relationships, class_name: "UserFollowing", foreign_key: :follower_id

  has_many :followers, through: :follower_relationships, source: :following
  has_many :followings, through: :following_relationships, source: :follower

  has_many :posts, foreign_key: :author_id
  has_many :comments

  has_one :profile

  scope :other_users, ->(uid) { where.not("id = ?", uid) }

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where([ "lower(username) = :value OR lower(email) = :value", { value: login.downcase } ]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      conditions[:email].downcase! if conditions[:email]
      where(conditions.to_h).first
    end
  end
end
