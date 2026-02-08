class Profile < ApplicationRecord
  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [ 100, 100 ]
    attachable.variant :pin, resize_to_limit: [ 32, 32 ]
  end
  belongs_to :user

  validates :location, presence: true
  validates :date_of_birth, presence: true
  validates :pfp, presence: true

  before_validation :set_pfp

  private
  def set_pfp
    hash = Digest::MD5.hexdigest("example@example.com")
    self.pfp = "https://secure.gravatar.com/avatar/#{hash}.png?s=24"
  end
end
