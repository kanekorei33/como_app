class Comment < ApplicationRecord
  has_many :categories, through: :comment_categories, dependent: :destroy
  has_many :comment_categories
  belongs_to :user
  belongs_to :park
end