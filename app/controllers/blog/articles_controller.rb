class Blog::ArticlesController < ApplicationController
  before_filter :shared_variables

  def index
    @articles   = tag ? Article.tagged_with(tag) : Article.most_recents
  end

  def show
    @article = Article.find(params[:id])
  end

private

  def shared_variables
    @tags       = Article.tag_counts
    @rails_tip  = Tip.rails_tip
    @today_tip  = Tip.today_tip
  end

  def tag
    params[:tag]
  end

end
