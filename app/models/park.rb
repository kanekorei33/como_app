class Park < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :institutions, through: :park_institutions, source: :institution
  has_many :park_institutions
  has_many :playgrounds, through: :park_playgrounds, source: :playground
  has_many :park_playgrounds
  has_many :comments
  mount_uploader :main_image,ImageUploader
  mount_uploader :sub_image1,ImageUploader
  mount_uploader :sub_image2,ImageUploader
  mount_uploader :sub_image3,ImageUploader
  mount_uploader :sub_image4,ImageUploader
  mount_uploader :sub_image5,ImageUploader
  mount_uploader :sub_image6,ImageUploader
  mount_uploader :sub_image7,ImageUploader
  mount_uploader :sub_image8,ImageUploader
  mount_uploader :sub_image9,ImageUploader
  mount_uploader :sub_image10,ImageUploader
  mount_uploader :sub_image11,ImageUploader

end
