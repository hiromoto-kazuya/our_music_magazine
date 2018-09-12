class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:id])
    @favorites = Favorite.where(user_id: params[:id]).order(created_at: :desc)
  end

  def create
    favorite = current_user.favorites.create(article_id: params[:article_id])
    redirect_to articles_url, notice: "#{favorite.article.user.name}さんのブログをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to articles_url, notice: "#{favorite.article.user.name}さんのブログをお気に入り解除しました"
  end
end