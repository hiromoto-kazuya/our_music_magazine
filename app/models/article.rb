class Article < ApplicationRecord
  validates :title,   presence: true, length: { maximum: 50 }
  validates :content, presence: true

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :comments, dependent: :destroy
  has_many :article_hashtags, dependent: :destroy
  has_many :hashtags, through: :article_hashtags
  mount_uploader :catch_image, ImageUploader
  is_impressionable counter_cache: true

  after_create do
    article = Article.find_by(id: self.id)
    hashtag_text  = self.hashtag.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtag_text.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      article.hashtags << tag
    end
  end

  before_update do
    article = Article.find_by(id: self.id)
    article.hashtags.clear
    hashtag_text = self.hashtag.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtag_text.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      article.hashtags << tag
    end
  end
end
