class Comment < ApplicationRecord
  has_many :posts, dependent: :destroy
  belongs_to :user
  belongs_to :park
  belongs_to :category
  mount_uploader :image, ImageUploader
end