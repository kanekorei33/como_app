class Playground < ApplicationRecord
  has_many :parks, through: :park_playgrounds, source: :park
  has_many :park_playgrounds
  mount_uploader :image, ImageUploader
end
