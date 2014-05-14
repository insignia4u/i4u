require "spec_helper"

feature "Homepage" do
  background do
    create_default_site
  end

  scenario "presenting three latest featured content" do
    featured_1 = create(:featured_content, site: current_site)
    featured_2 = create(:featured_content, site: current_site)
    featured_3 = create(:featured_content, site: current_site)
    featured_4 = create(:featured_content, site: current_site)

    visit "/"

    expect(page).to have_content(featured_1.body)
    expect(page).to have_content(featured_2.body)
    expect(page).to have_content(featured_3.body)
    expect(page).not_to have_content(featured_4.body)
  end

  scenario "presenting three latest successful projects" do
    project_1 = create(:project, site: current_site, highlighted: true)
    project_2 = create(:project, site: current_site, highlighted: true)
    project_3 = create(:project, site: current_site, highlighted: true)
    project_4 = create(:project, site: current_site, highlighted: true)

    visit "/"

    expect(page).to have_content(project_1.name)
    expect(page).to have_content(project_2.name)
    expect(page).to have_content(project_3.name)
    expect(page).not_to have_content(project_4.name)
  end

  scenario "presenting technologies" do
    visit "/"

    expect(page).to have_content("Ruby on Rails")
    expect(page).to have_content(
      "Front-end development: HTML, CSS and Javascript"
    )
    expect(page).to have_content("Kohana (PHP)")
    expect(page).to have_content(
      "Mobile applications development for iOS and Android platforms"
    )
  end

  scenario "presenting tools" do
    visit "/"

    expect(page).to have_content("Behaviour Driven Development")
    expect(page).to have_content("Agile methodologies")
    expect(page).to have_content("Version control system: GIT, SVN and others")
    expect(page).to have_content("Pair programming")
  end

  scenario "presenting three latest news" do
    article_1 = create_published_article(current_site, 1.day.ago.to_date)
    article_2 = create_published_article(current_site, 2.day.ago.to_date)
    article_3 = create_published_article(current_site, 3.day.ago.to_date)
    article_4 = create_published_article(current_site, 4.day.ago.to_date)

    visit "/"

    expect(page).to have_content(article_1.title)
    expect(page).to have_content(article_2.title)
    expect(page).to have_content(article_3.title)
    expect(page).not_to have_content(article_4.title)
  end
end
