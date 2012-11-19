namespace(:sites) do
  namespace(:en) do
    desc "Load Text Snippets for English Site"
    task :load_text_snippets => :environment do
      site = Site.find_by_abbreviation('EN')
      TextSnippet.destroy_all(site_id: site.id)

      puts "*** > Main Navigation Titles"
      site.text_snippets.create!(name: "us",       title: "About us")
      site.text_snippets.create!(name: "services", title: "Services")
      site.text_snippets.create!(name: "projects", title: "Portfolio")
      site.text_snippets.create!(name: "contact",  title: "Contact")
      site.text_snippets.create!(name: "job",      title: "Join us")
      puts "*** > Complete!"

      puts "\n*** > Footer Titles"
      site.text_snippets.create!(name: "subscribe",       title: "Newsletter")
      site.text_snippets.create!(name: "subscribe-text",
        title: "Subscribe to our Newsletter")
      site.text_snippets.create!(name: "subscribe-send",  title: "Subscribe me")
      site.text_snippets.create!(name: "more about us",   title: "More About Insignia")
      puts "*** > Complete!"

      puts "\n*** > Homepage Modules Titles"
      site.text_snippets.create!(
        name: "successful projects", title: "Successful Projects"
      )

      site.text_snippets.create!(name: "technologies", title: "Technologies")

      site.text_snippets.create!(
        name: "tools", title: "Tools and Methodologies"
      )

      site.text_snippets.create!(name: "latest news", title: "From the Blog")
      puts "*** > Complete!"

      puts "\n*** > Site Snippets"
      site.text_snippets.create!(
        name: "contact-module", title: "Contact Us",
        body: "Complete this info!"
      )
      puts "*** > Complete!"

      puts "\n*** > Project item Snippets"
      site.text_snippets.create!(name: "more-info", title: "More info")
      puts "*** > Complete!"

      puts "\n*** > Index Portfolio Snippets"
      site.text_snippets.create!(name: "highlighted-projects", title: "Highlighted projects")
      site.text_snippets.create!(name: "more-works", title: "More works", 
        body: '| Indeed, a jolly little clown came walking toward them, and Dorothy could see that in spite of his pretty clothes of red and yellow and green he was completely')
      site.text_snippets.create!(name: "full-list-of-works", title: "Full list of works")
      site.text_snippets.create!(name: "last_jobs", title: "Last jobs")
      site.text_snippets.create!(name: "more-info", title: "More info")
      site.text_snippets.create!(name: "more-info", title: "More info")
      puts "*** > Complete!"

      puts "\n\nDone!"
    end
  end
end
