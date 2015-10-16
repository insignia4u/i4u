require "spec_helper"

feature "[Blog] Catogory Filters" do
  background do
    create_default_site
  end

  scenario "filtering by an existing category" do
    category = create(:category, site: current_site)
    article_1 = create_published_article(current_site, 1.day.ago.to_date)
    article_1.categories << category
    article_2 = create_published_article(current_site, 2.day.ago.to_date)
    rails_tip = create(:rails_tip)
    today_tip = create(:today_tip)

    visit "/blog"

    first(:link, category.name).click

    expect(page).to have_content(article_1.title)
    expect(page).not_to have_content(article_2.title)
  end

  scenario "filtering by an unexisting category" do
    rails_tip = create(:rails_tip)
    today_tip = create(:today_tip)
    visit "/blog/categories/i-dont-exist"

    expect(current_path).to eql("/blog")
  end
end

