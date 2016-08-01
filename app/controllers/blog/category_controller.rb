class Blog::CategoryController < Blog::BaseController
  before_filter :check_a_valid_category_has_been_requested

  expose(:articles) {
    current_category.published_articles.page(params[:page]).per(3)
  }

  def index
    render "blog/articles/index"
  end

private
  def current_category
    @category ||= begin
      current_site.categories.friendly.find(params[:category])
    rescue ActiveRecord::RecordNotFound
      nil
    end
  end

  def check_a_valid_category_has_been_requested
    redirect_to '/blog' unless current_category
  end
end
