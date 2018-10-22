class StaticPagesController < ApplicationController
  def about
    render layout: 'top'
  end
end
