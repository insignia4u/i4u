class Blog::ArticlesController < Blog::BaseController

  def index
    @articles = Article.published.latest_first.page(params[:page]).per(3)
  end

  def show
    @article = Article.find(params[:id])
    @next = Article.next_article(@article)
    @prev = Article.prev_article(@article)
  end

  private
    def tag
      params[:tag]
    end

end
