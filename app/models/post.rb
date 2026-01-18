class Post < ApplicationRecord
  belongs_to :author, class_name: "User"
  validates :content, presence: true

  before_create :set_default_likes


  private

  def set_default_likes
    self.likes = 0
  end
end
