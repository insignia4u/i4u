require "spec_helper"

feature "Staff Page" do
  background do
    create_default_site
  end

  scenario "filling up 'who we are' container" do
    ts = current_site.text_snippets.
      create(name: 'who-we-are', title: "Who we are", body: "who we are text")

    visit "/team"

    expect(page).to have_content(ts.title)
    expect(page).to have_content(ts.body)
  end

  scenario "filling up 'our quality policy' container" do
    policy = current_site.text_snippets.
      create(name: 'our-quality-policy', title: "Our Quality Policy", body: "policy")
    items  = current_site.text_snippets.
      create(name: 'our-quality-policy-list', title: "quality list", body: "quality list")

    visit "/team"

    expect(page).to have_content(policy.title)
    expect(page).to have_content(policy.body)
    expect(page).to have_content(items.body)
  end

  scenario "filling up 'our mission' container" do
    ts = current_site.text_snippets.
      create(name: 'our-mission', title: "Our Mission", body: "mission text")

    visit "/team"

    expect(page).to have_content(ts.title)
    expect(page).to have_content(ts.body)
  end

  scenario "filling up 'our vision' container" do
    ts = current_site.text_snippets.
      create(name: 'our-vision', title: "Our vision", body: "vision text")

    visit "/team"

    expect(page).to have_content(ts.title)
    expect(page).to have_content(ts.body)
  end

  scenario "presenting team members" do
    person_1 = create(:person, site: current_site)
    person_2 = create(:person, site: current_site)

    visit "/team"

    expect(page).to have_content(person_1.full_name)
    expect(page).to have_content(person_1.title)
    expect(page).to have_content(person_1.bio)
    expect(page).to have_content(person_2.full_name)
    expect(page).to have_content(person_2.title)
    expect(page).to have_content(person_2.bio)
  end
end
