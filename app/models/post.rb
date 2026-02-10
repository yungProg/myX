class Post < ApplicationRecord
  has_many_attached :images
  has_many :likes
  has_many :likers, through: :likes

  has_many :comments
  belongs_to :author, class_name: "User"
  validates :content, presence: true
  validate :acceptable_images

  private

  def acceptable_images
    return unless images.attached?

    images.each do |image|
      unless image.content_type.in?(%w[image/jpeg image/png image/webp/ image/gif])
        errors.add(:images, "must be JPEG, PNG, WEBP or GIF")
      end

      if image.byte_size > 5.megabytes
        errors.add(:images, "each image should be ≤ 5MB")
      end
    end
  end
end
