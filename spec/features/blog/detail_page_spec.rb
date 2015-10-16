require "spec_helper"

feature "[Blog] Detail Page" do
  background do
    create_default_site
  end

  scenario "presenting article's data" do
    category = create(:category, site: current_site)
    article = create_published_article(current_site, 1.day.ago.to_date)
    article.categories << category
    rails_tip = create(:rails_tip)
    today_tip = create(:today_tip)

    visit blog_article_path(article)

    expect(page).to have_content(article.title)
    expect(page).to have_content(article.author)
    expect(page).to have_content(
      article.publication_date.strftime('%-d de %B, %Y')
    )
    expect(page).to have_content(article.comments_count)
    expect(page).to have_content(article.content)
    expect(page).to have_content(category.name)
  end

  scenario "presenting article's 'next' and 'previous' links" do
    article_1 = create_published_article(current_site, 1.day.ago.to_date)
    article_2 = create_published_article(current_site, 2.day.ago.to_date)
    article_3 = create_published_article(current_site, 3.day.ago.to_date)
    rails_tip = create(:rails_tip)
    today_tip = create(:today_tip)

    visit blog_article_path(article_2)

    expect(find('a.l-previous')['href']).to eql(blog_article_path(article_1))
    expect(find('a.l-next')['href']).to eql(blog_article_path(article_3))
  end

  scenario "presenting article's comments" do
    article = create_published_article(current_site, 1.day.ago.to_date)
    comment_1 = create(:comment, article: article)
    comment_2 = create(:comment)
    rails_tip = create(:rails_tip)
    today_tip = create(:today_tip)

    visit blog_article_path(article)

    expect(page).to have_content(comment_1.text)
    expect(page).not_to have_content(comment_2.text)
  end
end
