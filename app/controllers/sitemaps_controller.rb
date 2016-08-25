class SitemapsController < ApplicationController
  def sitemap
    redirect_to "https://s3.amazonaws.com/#{ ENV['AWS_BUCKET_I4U_SITE_2012'] }/sitemaps/sitemap.xml.gz", status: 301
  end
end