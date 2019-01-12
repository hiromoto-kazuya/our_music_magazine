class Article < ApplicationRecord
  validates :title,   presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { minimum: 50 }

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :comments, dependent: :destroy
  has_many :article_hashtags, dependent: :destroy
  has_many :hashtags, through: :article_hashtags
  mount_uploader :catch_image, ImageUploader
  is_impressionable counter_cache: true

  after_create do
    associate_hashtag_with_article
  end

  before_update do
    self.hashtags.clear
    associate_hashtag_with_article
  end

  def associate_hashtag_with_article
    hashtag_texts  = self.hashtag.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtag_texts.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      self.hashtags << tag
    end
  end
end
