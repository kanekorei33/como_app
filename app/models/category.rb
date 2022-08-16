class Category < ApplicationRecord
  has_many :comments, through: :comment_categories, dependent: :destroy
  has_many :comment_categories
  accepts_nested_attributes_for :comment_categories
end
