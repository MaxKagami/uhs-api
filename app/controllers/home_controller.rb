class HomeController < ApplicationController
  def index
    @news_posts = NewsPost.all
    render json: @news_posts
  end
end