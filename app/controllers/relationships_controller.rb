class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:id])
    if params[:name] == "follow_index"
      @follow_relations = @user.following
    elsif params[:name] == "follower_index"
      @follow_relations = @user.followers
    end
  end

  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
  end
end
