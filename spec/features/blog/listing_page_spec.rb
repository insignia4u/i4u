require "spec_helper"

feature "[Blog] Listing Page" do
  background do
    create_default_site
  end

  scenario "presenting three articles per page" do
    article_1 = create_published_article(current_site, 1.day.ago.to_date)
    article_2 = create_published_article(current_site, 2.day.ago.to_date)
    article_3 = create_published_article(current_site, 3.day.ago.to_date)
    article_4 = create_published_article(current_site, 4.day.ago.to_date)
    rails_tip = create(:rails_tip)
    today_tip = create(:today_tip)

    visit "/blog"

    expect(page).to have_content(article_1.title)
    expect(page).to have_content(article_2.title)
    expect(page).to have_content(article_3.title)
    expect(page).not_to have_content(article_4.title)

    click_link "older-entries"

    expect(page).to have_content(article_4.title)
    expect(page).not_to have_content(article_1.title)
    expect(page).not_to have_content(article_2.title)
    expect(page).not_to have_content(article_3.title)
  end

  scenario "presenting article categories" do
    category_1 = create(:category, site: current_site)
    category_2 = create(:category, site: current_site)
    article    = create_published_article(current_site, 1.day.ago.to_date)
    article.categories << category_1
    rails_tip = create(:rails_tip)
    today_tip = create(:today_tip)

    visit "/blog"

    expect(page).to have_content(category_1.name)
    expect(page).to have_content(category_2.name)
  end

  scenario "presenting 'read more' link" do
    article    = create_published_article(current_site, 1.day.ago.to_date)
    rails_tip = create(:rails_tip)
    today_tip = create(:today_tip)

    visit "/blog"

    expect(page).to have_link('Read more', href: blog_article_path(article))
  end
end
