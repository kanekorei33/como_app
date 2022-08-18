class Comment < ApplicationRecord
  has_many :categories, through: :comment_categories, dependent: :destroy
  has_many :comment_categories
  has_many :posts, dependent: :destroy
  belongs_to :user
  belongs_to :park
  mount_uploader :image, ImageUploader
end