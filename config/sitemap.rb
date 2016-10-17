SitemapGenerator::Sitemap.default_host = "http://insignia4u.com"
SitemapGenerator::Sitemap.create_index = false
SitemapGenerator::Sitemap.public_path = 'tmp/sitemaps/'
SitemapGenerator::Sitemap.create do

  add people_path
  add services_path
  add '/contact'
  add '/jobs'
  add projects_path
  add blog_tips_path('rails_tips')
  add blog_tips_path('today_tip')
  add blog_path_path

  Training.find_each do |training|
    add training_path(training)
  end

  LandingPage.find_each do |landing|
    add landing_path(landing.folder, landing.slug)
  end

  Article.find_each do |article|
    add blog_article_path(article), lastmod: article.updated_at
  end

  Category.find_each do |category|
    add blog_category_path(category), lastmod: category.updated_at
  end
end