class Blog::ArticlesController < Blog::BaseController
  expose(:articles) { site_articles.page(params[:page]).per(3) }
  expose(:rss_feed) { current_site.articles.published.latest_first }
  expose(:article)  { current_site.articles.published.find(params[:id]) }
  expose(:pager)    { ArticlesPager.new(site_articles, article) }

  def index
    @tips = Tip.find(:all, :order => "published_at DESC")
    respond_to do |format|
      format.html
      format.rss  { render layout: false }
    end
  end

  def show; end

  def slug
    if article = Article.where(short_url: params[:slug]).first
      redirect_to blog_article_url(article), status: :moved_permanently
    else
      redirect_to blog_path_url
    end
  end

protected
  def site_articles
    current_site.articles.published.latest_first
  end
end
