class Post < ApplicationRecord
  belongs_to :user
  belongs_to :comment
  validates :content, presence: true
  mount_uploader :image, ImageUploader
end
