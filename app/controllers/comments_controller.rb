class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to article_path(@article), notice: '投稿に失敗しました' }
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:article_id,:user_id, :content)
  end
end
