class Blog::ArticlesController < ApplicationController
  before_filter :shared_variables

  def index
    if tag
      @articles = Article.tagged_with(tag)
    elsif category
      @articles = Category.find(category).articles
    else
      @articles = Article.most_recents
    end
    @article
  end

  def show
    @article = Article.find(params[:id])
    @next = Article.next_article(@article)
    @prev = Article.prev_article(@article)
  end

private

  def shared_variables
    @tags       = Article.tag_counts
    @rails_tip  = Tip.rails_tip
    @today_tip  = Tip.today_tip
    @month_tips = Tip.month_tips(1.month.ago)
    @comment    = Comment.new
    @categories = Category.all
  end

  def tag
    params[:tag]
  end

  def category
    params[:category]
  end

end
