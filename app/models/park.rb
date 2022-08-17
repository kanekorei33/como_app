class Park < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :institutions, through: :park_institutions, source: :institution
  has_many :park_institutions
  has_many :playgrounds, through: :park_playgrounds, source: :playground
  has_many :park_playgrounds
  has_many :comments
end
