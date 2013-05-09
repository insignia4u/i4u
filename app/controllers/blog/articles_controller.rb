class Blog::ArticlesController < ApplicationController

  def index
    @articles = Article.order('created_at DESC').limit(3)
  end

  def show
  end

end
