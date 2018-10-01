class SearchResultsController < ApplicationController
  before_action :set_params_for_searching_articles_and_users
  impressionist :actions=> [:index]
  def index
  end

  def new_articles
    @articles = Article.all.order(created_at: :desc)
  end

  def favorite_articles
    @articles = Article.find(Favorite.group(:article_id).order("count_all desc").count.keys[0..9])
  end

  def many_pvs_articles
    @articles = Article.all.order(impressions_count: :desc).limit(10)
  end

  def following_articles
    @articles = Article.where(user_id: current_user.following)
  end
end
