class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def confirm
  end

  def create
    @article = Article.create(article_params)
    if @article.save
      redirect_to "/", notice: "記事を投稿しました"
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def article_params
    params.require(:article).permit(:title,:content,:genre_id)
  end
end
