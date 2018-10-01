class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :introduce_message, :icon_image])
  end

  def set_params_for_searching_articles_and_users
    @q = Article.search(params[:q])
    @articles = @q.result
    unless params[:q] == nil
      $searching_word = params[:q][:title_or_content_or_hashtag_cont]
      @users = User.search_with_user
      @articles += @users
    end
  end
end
