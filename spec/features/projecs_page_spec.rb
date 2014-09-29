require "spec_helper"

feature "Projects Page" do
  background do
    create_default_site
  end

  context "listing page" do
    scenario "presenting highlighted projects" do
      pick    = create(:project, site: current_site, highlighted: true)

      visit "/projects"

      expect(page).to have_content(pick.name)
      expect(page).to have_content(pick.description)
    end

    scenario "presenting most recent projects" do
      project = create(:project, site: current_site)

      visit "/projects"

      expect(page).to have_content(project.name)
      expect(page).to have_content(project.summary)
    end
  end

  context "detail page" do
    scenario "presenting project info" do
      project = create(:project, site: current_site)

      visit project_path(project)

      expect(page).to have_content(project.name)
      expect(page).to have_content(project.extended_description)
      expect(page).to have_link('Visit Site', href: project.url)
    end

    scenario "presenting project tools" do
      tool_1 = create(:tool)
      tool_2 = create(:tool)
      project = create(:project, site: current_site)
      project.tools << tool_1

      visit project_path(project)

      expect(page).to have_content(tool_1.title)
      expect(page).to have_content(tool_1.description)
      expect(page).not_to have_content(tool_2.title)
      expect(page).not_to have_content(tool_2.description)
    end

    scenario "presenting project technologies" do
      technology_1 = create(:technology)
      technology_2 = create(:technology)
      project = create(:project, site: current_site)
      project.technologies << technology_1

      visit project_path(project)

      expect(page).to have_content(technology_1.title)
      expect(page).to have_content(technology_1.description)
      expect(page).not_to have_content(technology_2.title)
      expect(page).not_to have_content(technology_2.description)
    end
  end
end
