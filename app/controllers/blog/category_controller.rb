class Blog::CategoryController < Blog::BaseController
  before_filter :find_category

  def index
    @articles = (@category)? @category.published_articles : Article.most_recents
    render "blog/articles/index"
  end

  private
  def category
    params[:category]
  end

  def find_category
    @category = Category.find(category)
  end
end
