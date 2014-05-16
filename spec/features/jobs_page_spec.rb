require "spec_helper"

feature "Jobs Page" do
  let(:pdf_path) {
    File.join [Rails.root(), 'spec', 'support', 'fake attachments', 'pdf']
  }

  background do
    create_default_site
  end

  scenario "presenting three latest published events" do
    event_1 = create(:published_event, site: current_site)
    event_2 = create(:published_event, site: current_site)
    event_3 = create(:published_event, site: current_site)
    event_4 = create(:published_event, site: current_site)

    visit "/jobs"

    expect(page).to have_content(event_1.title)
    expect(page).to have_content(event_2.title)
    expect(page).to have_content(event_3.title)
    expect(page).not_to have_content(event_4.title)
  end

  scenario "presenting current site values" do
    value_1 = create(:value, site: current_site)
    value_2 = create(:value)

    visit "/jobs"

    expect(page).to have_content(value_1.title)
    expect(page).not_to have_content(value_2.title)
  end

  scenario "posting an application with valid data" do
    visit "/jobs"

    fill_in "message[name]",  with: "John Doe"
    fill_in "message[email]", with: "john@doe.com"
    fill_in "message[phone]", with: "+1 555 55 5555"
    fill_in "message[body]",  with: "Hi there!"

    attach_file "message[file]", "#{pdf_path}/RubyCheat.pdf"

    click_button "Send"

    expect(last_email.to).to include("info@insignia4u.com")
    expect(last_email.subject).to eql("Job Applications: John Doe")
  end

  scenario "posting an application with invalid data" do
    visit "/jobs"

    click_button "Send"

    expect(last_email).to be_nil
  end
end
