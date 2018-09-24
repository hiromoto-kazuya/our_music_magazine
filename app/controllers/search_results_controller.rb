class SearchResultsController < ApplicationController
  before_action :set_params_for_searching_articles_and_users
  impressionist :actions=> [:index]
  def index
  end
end
