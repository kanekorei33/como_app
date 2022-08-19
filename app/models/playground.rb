class Playground < ApplicationRecord
  has_many :park_playgrounds
  has_many :parks, through: :park_playgrounds, source: :park
  mount_uploader :image, ImageUploader
end
