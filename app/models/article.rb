class Article < ApplicationRecord
  validates :title,   presence: true
  validates :content, presence: true

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  mount_uploader :catch_image, ImageUploader
end
