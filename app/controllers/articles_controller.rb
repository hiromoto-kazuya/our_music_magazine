class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :confirm, :create, :edit, :update, :destroy]
  before_action :authenticate_article_owner, only:[:edit,:update,:destroy]
  before_action :set_params_for_searching_articles_and_users, only: [:index, :new, :confirm, :edit, :show, :hashtag]

  def index
    @new_articles = Article.all.order(created_at: :desc).limit(3)
    @favorite_articles = Article.find(Favorite.group(:article_id).order("count_all desc").count.keys[0..5])
    render layout: 'top'
  end

  def new
    if params[:back]
      @article = Article.new(article_params)
    else
      @article = Article.new
    end
  end

  def confirm
    @article = current_user.articles.build(article_params)
    render :new if @article.invalid?
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to articles_path, notice: "記事を投稿しました"
    else
      render 'new'
    end
  end

  def show
    @article = find_article
    impressionist(@article, nil, unique: [:session_hash])
    @favorite = current_user.favorites.find_by(article_id: @article.id) if user_signed_in?
    @comments = @article.comments
    @comment = @article.comments.build
  end

  def edit
    @article = find_article
  end

  def update
    @article = find_article
    if @article.update(article_params)
      redirect_to article_path, notice: "記事を編集しました"
    else
      render 'edit'
    end
  end

  def destroy
    @article = find_article
    @article.destroy
    redirect_to articles_path, notice: "記事を削除しました"
  end

  def hashtag
    @user = current_user
    @tag = Hashtag.find_by(hashname: params[:name])
    @articles = @tag.articles.order(created_at: :desc)
  end

  private

  def article_params
    params.require(:article).permit(:title,:hashtag, :content, :genre_id, :catch_image, :catch_image_cache)
  end

  def find_article
    Article.find(params[:id])
  end

  def article_owner?
    current_user.articles.find_by(id: params[:id]) ? true : false
  end

  def authenticate_article_owner
    redirect_to articles_path, notice: "権限がありません" unless article_owner?
  end

end
