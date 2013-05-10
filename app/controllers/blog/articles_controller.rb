class Blog::ArticlesController < ApplicationController
  before_filter :all_tags

  def index
    @articles   = tag ? Article.tagged_with(tag) : Article.most_recents
    @rails_tip  = Tip.rails_tip
    @today_tip  = Tip.today_tip
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
