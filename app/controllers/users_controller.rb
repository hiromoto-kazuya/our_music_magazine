class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_params_for_searching_articles_and_users

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

end
