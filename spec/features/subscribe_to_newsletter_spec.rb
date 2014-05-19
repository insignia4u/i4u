require "spec_helper"

feature "Subscribe to Newsletter" do
  let(:proxy) { double('Gibbon proxy', list_subscribe: true) }

  background do
    create_default_site
    Gibbon.stub(:new).and_return(proxy)
  end

  scenario "submitting a valid subscription" do
    visit "/"

    fill_in "newsletter_subscriber[email]", with: "john@doe.com"

    click_button "Subscribe"

    latest_subscriber = NewsletterSubscriber.last
    expect(latest_subscriber.email).to eql("john@doe.com")
    expect(latest_subscriber).to be_on_mail_chimp_list
    expect(current_path).to eql(root_path)
  end

  scenario "submitting a subscribed email" do
    visit "/"
    fill_in "newsletter_subscriber[email]", with: "john@doe.com"
    click_button "Subscribe"

    visit "/"
    fill_in "newsletter_subscriber[email]", with: "john@doe.com"

    expect {
      click_button "Subscribe"
    }.not_to change{ NewsletterSubscriber.count }.from(1).to(2)
  end

  scenario "submitting an empty form" do
    visit "/"

    expect {
      click_button "Subscribe"
    }.not_to change{ NewsletterSubscriber.count }
  end

  scenario "submitting an invalid email account" do
    visit "/"
    fill_in "newsletter_subscriber[email]", with: "anything"
    click_button "Subscribe"

    expect {
      click_button "Subscribe"
    }.not_to change{ NewsletterSubscriber.count }
  end

  scenario "handling Mailchimp failure" do
    proxy.stub(:list_subscribe).and_return(false)
    visit "/"
    fill_in "newsletter_subscriber[email]", with: "john@doe.com"
    click_button "Subscribe"

    latest_subscriber = NewsletterSubscriber.last
    expect(latest_subscriber).not_to be_on_mail_chimp_list
  end
end
