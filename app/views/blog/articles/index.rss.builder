xml.instruct! :xml, version: "1.0"
xml.rss version: "2.0" do
  xml.channel do
    xml.title "Insignia Blog"
    xml.description "Post"
    xml.link blog_articles_url

    rss_feed.each do |article|
      xml.item do
        xml.title article.title
        xml.description article.content
        xml.pubDate article.publication_date.to_s(:rfc822)
        xml.link blog_article_url(article)
        xml.guid blog_article_url(article)
      end
    end
  end
end
