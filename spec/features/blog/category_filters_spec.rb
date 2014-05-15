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

    visit "/blog"

    click_link category.name

    expect(page).to have_content(article_1.title)
    expect(page).not_to have_content(article_2.title)
  end

  scenario "filtering by an unexisting category" do
    visit "/blog/categories/i-dont-exist"

    expect(current_path).to eql("/blog")
  end
end

