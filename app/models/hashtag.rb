class Hashtag < ApplicationRecord
  validates :hashname, presence: true, length: {maximum:100}
  has_many :article_hashtags, dependent: :destroy
  has_many :articles, through: :article_hashtags
end
