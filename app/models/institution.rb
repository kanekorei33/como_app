class Institution < ApplicationRecord
  has_many :parks, through: :park_institutions, source: :park
  has_many :park_institutions
  mount_uploader :image, ImageUploader
end

