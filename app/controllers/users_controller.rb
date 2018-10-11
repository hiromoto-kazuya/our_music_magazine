class UsersController < ApplicationController
  before_action :set_params_for_searching_articles_and_users

  def show
    @user = User.find(params[:id])
  end

end
