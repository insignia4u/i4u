class Blog::ArticlesController < ApplicationController
  before_filter :all_tags

  def index
    if tag
      @articles = Article.tagged_with(tag)
    else
      @articles = Article.order('created_at DESC').limit(3)
    end
  end

  def show
  end

private

  def all_tags
    @tags = Article.tag_counts
  end

  def tag
    params[:tag]
  end

end
