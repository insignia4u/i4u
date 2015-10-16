require "spec_helper"

feature "Commenting" do
  background do
    create_default_site
  end

  scenario "posting a valid comment" do
    article = create_published_article(current_site, 1.day.ago.to_date)
    rails_tip = create(:rails_tip)
    today_tip = create(:today_tip)

    visit blog_article_path(article)

    fill_in "comment[name]",    with: "Steve Rogers"
    fill_in "comment[email]",   with: "steve@avengers.com"
    fill_in "comment[website]", with: "http://www.avengers.com"
    fill_in "comment[text]",    with: "hello!"

    expect {
      click_button "send-comment"
    }.to change { article.reload.comments.count }.by(1)

    expect(last_email.to).to include("info@insignia4u.com")
    expect(last_email.subject).to eql("New comment in #{article.title}")

    latest_comment = Comment.last
    expect(page).to have_content(latest_comment.text)
    expect(page).to have_content(latest_comment.name)
    expect(current_path).to eql(blog_article_comments_path(article))
  end

  scenario "posting an invalid comment" do
    article = create_published_article(current_site, 1.day.ago.to_date)
    rails_tip = create(:rails_tip)
    today_tip = create(:today_tip)

    visit blog_article_path(article)

    expect {
      click_button "send-comment"
    }.not_to change { article.reload.comments.count }.by(1)
  end
end
