class User < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
            uniqueness: true
  validates :password, length: { minimum: 6 }
  validates :nickname, uniqueness: true
  before_validation { email.downcase! }

  has_secure_password
  
  has_many :favorites, dependent: :destroy
  has_many :favorite_parks, through: :favorites, source: :park
  has_many :comments
  mount_uploader :image, ImageUploader
end
