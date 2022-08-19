class Institution < ApplicationRecord
  has_many :park_institutions
  has_many :parks, through: :park_institutions, source: :park
  mount_uploader :image, ImageUploader
end

