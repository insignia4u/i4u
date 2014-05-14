class Blog::ArticlesController < Blog::BaseController
  expose(:articles) {
    current_site.articles.published.latest_first.page(params[:page]).per(3)
  }
  expose(:rss_feed) { current_site.articles.published.latest_first }

  expose(:article)  { current_site.articles.published.find(params[:id]) }

  expose(:next_article) { Article.next_article(article) }
  expose(:prev_article) { Article.prev_article(article) }

  def index
    respond_to do |format|
      format.html
      format.rss  { render layout: false }
    end
  end

  def show; end
end
