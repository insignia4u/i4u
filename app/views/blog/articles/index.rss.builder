xml.instruct! :xml, version: "1.0"
xml.rss(:version => "2.0", "xmlns:media" => 'http://search.yahoo.com/mrss/') do
  xml.channel do
    xml.title "Insignia Blog"
    xml.description "Post"
    xml.link blog_articles_url

    rss_feed.each do |article|
      xml.item do
        xml.title article.title
        xml.description article.summary
        xml.pubDate article.publication_date.to_s(:rfc822)
        xml.link blog_article_url(article)
        xml.guid blog_article_url(article)
        xml.media(:content, blog_article_url(article.image.url))
      end
    end

    xml.description "Tips"
    xml.link blog_tips_url('today_tips')
    xml.link blog_tips_url('rails_tips')

    for tip in @tips
      xml.item do
        xml.title tip.title
        xml.description tip.description
        xml.pubDate tip.published_at.to_s(:rfc822)
        xml.link blog_tips_url(tip)
        xml.guid blog_tips_url(tip)
        xml.media(:content, blog_article_url(tip.image.url))
      end
    end
  end
end
