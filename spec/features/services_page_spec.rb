require "spec_helper"

feature "Services Page" do
  background do
    create_default_site
  end

  context "presenting services description" do
    scenario "planning" do
      ts = current_site.text_snippets.
        create(name: 'planificacion-text-snippet',
          title: "planificacion", body: "planificacion text")

      visit "/services"

      expect(page).to have_content(ts.title)
      expect(page).to have_content(ts.body)
    end

    scenario "coding" do
      ts = current_site.text_snippets.
        create(name: 'codificacion-text-snippet',
          title: "codificacion", body: "codificacion text")

      visit "/services"

      expect(page).to have_content(ts.title)
      expect(page).to have_content(ts.body)
    end

    scenario "review" do
      ts = current_site.text_snippets.
        create(name: 'revision-text-snippet',
          title: "revision", body: "revision text")

      visit "/services"

      expect(page).to have_content(ts.title)
      expect(page).to have_content(ts.body)
    end

    scenario "control" do
      ts = current_site.text_snippets.
        create(name: 'control-text-snippet',
          title: "control", body: "control text")

      visit "/services"

      expect(page).to have_content(ts.title)
      expect(page).to have_content(ts.body)
    end

    scenario "production" do
      ts = current_site.text_snippets.
        create(name: 'produccion-text-snippet',
          title: "produccion", body: "produccion text")

      visit "/services"

      expect(page).to have_content(ts.title)
      expect(page).to have_content(ts.body)
    end

    scenario "retainer" do
      ts = current_site.text_snippets.
        create(name: 'mantenimiento-text-snippet',
          title: "mantenimiento", body: "mantenimiento text")

      visit "/services"

      expect(page).to have_content(ts.title)
      expect(page).to have_content(ts.body)
    end
  end

  scenario "filling up 'how do we do it' container" do
    ts = current_site.text_snippets.
      create(name: 'how-do-we-do-it',
        title: "how do we do it", body: "snippet text")

    visit "/services"

    expect(page).to have_content(ts.title)
    expect(page).to have_content(ts.body)
  end

  scenario "filling up 'our offering' container" do
    ts = current_site.text_snippets.
      create(name: 'our-offering',
        title: "our offering", body: "snippet text")

    visit "/services"

    expect(page).to have_content(ts.title)
    expect(page).to have_content(ts.body)
  end

  scenario "filling up 'our proccess' container" do
    visit '/services'

    expect(page).to have_content("planificacion-process-snippet--2")
    expect(page).to have_content("codificacion-process-snippet--2")
    expect(page).to have_content("revision-process-snippet--2")
    expect(page).to have_content("control-process-snippet--2")
    expect(page).to have_content("produccion-process-snippet--2")
    expect(page).to have_content("mantenimiento-process-snippet--2")
  end
end
