class UsersController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_searched_params

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  private
  # def set_searched_params
  #   @searched_user = User.search(params[:q])
  #   @users = @searched_user.result
  # end
end
