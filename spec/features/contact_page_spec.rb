require "spec_helper"

feature "Contact Page" do
  background do
    create_default_site
  end

  scenario "sending a message with valid data" do
    visit "/contact"

    fill_in "message[name]",  with: "John Doe"
    fill_in "message[email]", with: "john@doe.com"
    fill_in "message[phone]", with: "+1 555 55 5555"
    fill_in "message[body]",  with: "Hi there!"

    click_button "Contact Us"

    expect(last_email.to).to include("info@insignia4u.com")
    expect(last_email.subject).to eql("Message: John Doe")
  end

  scenario "sending a message with invalid data" do
    visit "/contact"

    click_button "Contact Us"

    expect(last_email).to be_nil
  end
end
