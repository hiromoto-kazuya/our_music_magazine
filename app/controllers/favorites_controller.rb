class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:id])
    @favorites = Favorite.where(user_id: params[:id]).order(created_at: :desc)
  end

  def create
    favorite = current_user.favorites.create(article_id: params[:article_id])  
    respond_to do |format|
      format.js { render :template => "favorites/favorite",locals: { favorite: favorite, article: favorite.article } }
    end
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    respond_to do |format|
      format.js { render :template => "favorites/favorite",locals: { favorite: favorite, article: favorite.article } }
    end
  end
end
