class ArticlesController < ApplicationController
  before_action :set_article, only:[:show,:edit,:update,:destroy,]
  before_action :authenticate_user!, only: [:new, :confirm, :create, :edit, :update, :destroy]

  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def new
    if params[:back]
      @article = Article.new(article_params)
    else
      @article = Article.new
    end
  end

  def confirm
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    render :new if @article.invalid?
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to articles_path, notice: "記事を投稿しました"
    else
      render 'new'
    end
  end

  def show
    if user_signed_in?
      @favorite = current_user.favorites.find_by(article_id: @article.id)
    end
    @comments = @article.comments
    @comment = @article.comments.build
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to article_path, notice: "記事を編集しました"
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: "記事を削除しました"
  end

  def hashtag
    @user = current_user
    @tag = Hashtag.find_by(hashname: params[:name])
    @articles = @tag.articles
  end

  private
  def article_params
    params.require(:article).permit(:title,:hashtag, :content, :genre_id, :catch_image, :catch_image_cache)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
