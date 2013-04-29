#encoding: utf-8

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

      site.text_snippets.create!(name: 'introduction-header',
      title: "At <strong>Insignia</strong> we build highly interactive web \
       applications using <strong>agile methodologies</strong> and \
       <strong>cutting edge technologies</strong>."
      )

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

      puts "\n*** > Portfolio Snippets"
      site.text_snippets.create!(name: "highlighted-projects", title: "Highlighted projects")
      site.text_snippets.create!(name: "more-works-pc-version", title: "More works", 
        body: "Indeed, a jolly little clown came walking toward them, " \
        "and Dorothy could see that in spite of his pretty clothes of red and "\
        "yellow and green he was completely")

      site.text_snippets.create!(name: "more-works-mobile-version", title: "More works", 
        body: '| Version mobile...')
      site.text_snippets.create!(name: "full-list-of-works", title: "Full list of works")
      site.text_snippets.create!(name: "recent-jobs-pc-version", title: "Recent jobs")
      site.text_snippets.create!(name: "recent-jobs-mobile-version", title: "Recent jobs mobile")
      site.text_snippets.create!(name: "show-successful-case", title: "Show successful case")
      site.text_snippets.create!(name: "back-to-portfolio", title: "back to portfolio")
      site.text_snippets.create!(name: "pdf-portfolio", title: "PDF portfolio")
      site.text_snippets.create!(name: "click-here", title: "click here")
      site.text_snippets.create!(name: "to-separator-project-duration", title: "to")
      site.text_snippets.create!(name: "duration-project-header", title: "Duration")
      site.text_snippets.create!(name: "technology-project-header", title: "Technologies")
      site.text_snippets.create!(name: "tool-project-header", title: "Tools")

      puts "*** > Complete!"


      puts "\n*** > People Snippets"
      site.text_snippets.create!( name: "meet-our-staff", 
                                  title: "Meet Our Staff")

      site.text_snippets.create!( name: "our-staff", 
                                  title: "Our Staff")


      site.text_snippets.create!(name: "our-mission", title: "Our mission", 
        body: "Provide our clients with software solutions based on the " \
        " Internet, to allow them to be at the cutting edge and get a " \
        " decisive competitive advantage in the market.")

      site.text_snippets.create!(name: "our-vision", title: "Our vision",
        body: "To became a national and international model, with a " \
        " portfolio of successful projects ratifying our positioning as a " \
        " reliable and responsible company in web application development. ")

      site.text_snippets.create!(name: "our-values", title: "Our values", 
        body: "The players all played at once without waiting for turns, quarrelling" \
        " all the while, and fighting for the hedgehogs; and in a very short" \
        " time the Queen was in a furious passion, and went stamping about, and" \
        " shouting 'Off with his head!' or 'Off with her head!'" \
        " about once in a  minute.")

      site.text_snippets.create!(name:'who-we-are', title: 'Who we are',
        body: "<p>During the last 5 years, we have successfully faced the challenge" \
        " of developing highly-traffic sites, gaining experience in merging 3rd party" \
        " APIs, such as Google Maps, Facebook, Twitter, as well as dealing with " \
        " different payment gateways and cloud based hosting services. For further details," \
        " please consult our portfolio.</p>" \
        " <p>Aiming to satisfy our worldwide foreign clients needs, not only do we provide " \
        " with a world class team of developers, but also with a specialized and very efficient " \
        " project management and time tracking, to which our clients have access.</p>" \
        " <p>It is also worth mentioning that our geographical position, " \
        " hence our time zone, facilitates coordinated work with our " \
        " foreign clients, especially those from the US and Europe. Our " \
        " experience with Area 17, an interactive design agency with " \
        " headquarters in New York and Paris, stands as a clear example of "\
        " our offshore competitiveness.</p>" \
        " <p>We are always open and eager to face new challenges. We'd " \
        " love to learn more about your projects and to be part of them.</p>",)

        site.text_snippets.create!( name:'our-quality-policy', 
                                    title: 'Our quality policy',
        body: "<p>We have a strong commitment to completely fulfill the " \
        " requirements and expectations of our clients in the web app " \
        " they're requesting, using agile metodologies as a guide in our " \
        " sofftware development process. Out strategy pursues the " \
        " continuous improvement of our Quality Management System, " \
        " whose pilars are planning, execution, verification and act " \
        " according the results, in every process until finishing the " \
        " development of the app. As a work team we base our actions in " \
        " the following principles: </p>")

        site.text_snippets.create!( name:'our-quality-policy-list', 
                                    body: "<ul class=\"bullets-blue\"> "\
          " <li>Creativity and innovation, as a part of our daily " \
          " challenge to continuous improvement.</li>" \
          "<li>Awareness and responsibility, practicing an error free job " \
          " and security in the applications.</li>" \
          " <li>Friendliness in out service and agility in the processes.</li>" \
          " <li>Cooperative work and integral development of our collaborators.</li>" \
          " <li>Commitment with the client, ensuring efficiency in the management system.</li>"\
          " <li>Commitment with our collaborators, providing resources for " \
          " the effective achievement of the objectives.</li>" )

        site.text_snippets.create!( name: 'our-mission',
                                    body: '')

      puts "*** > Complete!"

      puts "\n*** > Contact form Snippets"
      site.text_snippets.create!(name: 'name-form-contact', title: 'Name<sup>*</sup>') 
      site.text_snippets.create!(name: 'email-form-contact', title: 'Email<sup>*</sup>')
      site.text_snippets.create!(name: 'message-form-contact', title: 'Coments<sup>*</sup>')
      site.text_snippets.create!(name: 'required-fields', title: '<sup>*</sup> Required fields')
      site.text_snippets.create!(name: 'subject-form-contact', title: 'Subject<sup>*</sup>')
      site.text_snippets.create!(name: 'attach-new-file', title: 'Attach file >>')
      site.text_snippets.create!(name: 'contact-form', title: 'Contact', 
        body: '"What\'s that?" cried a boatman, and "Shut up, you fool!" said a man near me to a yelping dog. Then the sound came again, this time from the direction of Chertsey, a muffled thud--the sound of a gun.')
      
      site.text_snippets.create!(name: 'btn-send-contact-form', title: 'Contact us')
      site.text_snippets.create!(name: 'contact-details', title: 'Contact details',
        body: "Lamadrid 318, Piso 4 - Dpto. A\nSan Miguel de Tucuman\nTucuman, Argentina\n" \
        "T: +54... \nM: mail...")

      puts "*** > Complete!"


      puts "\n*** > Job form Snippets"
      site.text_snippets.create!(name: 'name-job-form', title: 'Name<sup>*</sup>') 
      site.text_snippets.create!(name: 'email-job-form', title: 'Email<sup>*</sup>')
      site.text_snippets.create!(name: 'message-job-form', title: 'Coments<sup>*</sup>')
      site.text_snippets.create!(name: 'attach-cv', title: 'Attach CV >>')
      site.text_snippets.create!(name: 'job-form-content', title: 'Job', 
        body: "\"What's that?\" cried a boatman, and \"Shut up, you fool!\" said " \
        "a man near me to a yelping dog. Then the sound came again, this time" \
        "from the direction of Chertsey, a muffled thud--the sound of a gun.\n" \
        "Alice began to feel very uneasy: to be sure, she " \
        "had not as yet had any dispute with the Queen, but she knew that " \
        "it might happen any minute, 'and then,' thought she, 'what would " \
        "become of me?")

      site.text_snippets.create!(name: 'job-form-main-content', title: 'job', 
        body: "\"MAIN MAIN MAIN What's that?\" cried a boatman, and \"Shut up, " \
        "you fool!\" said a man near me to a yelping dog. Then the sound came " \
        "again, this time from the direction of Chertsey, a muffled thud--the " \
        "sound of a gun.")

      site.text_snippets.create!(name: 'btn-send-job-form', title: 'Join us')
      site.text_snippets.create!(name: 'the-road', title: 'The Road', 
        body: "\"What's that?\" cried a boatman, and \"Shut up, you fool!\" " \
        "said a man near me to a yelping dog.  Then the sound came again, " \
        "this time from the direction of Chertsey, a muffled thud--the sound of a gun." \
        "\"Quitting the pump at last, with the rest of his band, " \
        "the Lakeman went forward all panting, and sat himself down on the windlass; " \
        "his face fiery red, his eyes bloodshot, and wiping the profuse sweat from his brow. " \
        "Now what cozening fiend it was, gentlemen, that possessed Radney to " \
        "meddle with such a man in that corporeally exasperated state, " \
        "I know not; but so it happened. Intolerably striding along the deck, " \
        "the mate commanded him to get a broom and sweep down the planks, and " \
        "also a shovel, and remove some offensive matters consequent upon " \
        "allowing a pig to run at large." \
        "Fix, who had followed Mr. Fogg to the station, and saw that he " \
        "was really going to leave Bombay, was there, upon the platform.  " \
        "He had resolved to follow the supposed robber to Calcutta, and farther, " \
        "if necessary.  Passepartout did not observe the detective, who stood in an " \
        "obscure corner; but Fix heard him relate his adventures in a few words to Mr. Fogg."
)

      puts "\n Services page Snippets"

      site.text_snippets.create!(name: 'our-services-title', title: 'Our services')
      site.text_snippets.create!(name: 'our-process', title: 'Our process')

      names = %w{ planificacion codificacion revision control produccion 
                 mantenimiento }.each do |name|
        site.text_snippets.create!(name: "#{name}-text-snippet",
        title: 'highly interactive sites development',
        body: "We've got the necessary resources and the experience to take " \
        " your idea, shape it, and enhance it to produce a professional web " \
        " site based on the most advanced technologies. We’re specialized in" \
        " the agile development of highly interactive sites built on Ruby on" \
        " Rails, properly tested with Cucumber and Rspec and supported with " \
        " cutting-edge technologies.")

        site.text_snippets.create!(name: "#{name}-process-snippet",
        title: "#{name}",
        body: "Using agile methodologies and our team’s experience, we help " \
        " our clientes creating concrete and feasible projects. In this " \
        " stage we produce the necessary documentation to work as a base " \
        " for the budgeting of the projects as well as its implementation.")
      end

      site.text_snippets.create!(name: 'how-do-we-do-it', 
      title: 'How do we do it',
      body: "<ul class=\"bullets-blue\"><li>No hassle, no bureaucracy, we " \
      " create high quality code. The maintainability and quality assurance " \
      " are our primary goals in every software project.</li>" \
      "<li>We use Behavior Driven Development to deliver 100% tested " \
      " results.</li>" \
      "<li>We firmly believe in the benefits the agile methodologies can " \
      " have in a software project, that’s why we try to implement these " \
      " practices in all our projects.</li>" \
      "<li>Also we love integrating third party API’s to create 2.0 " \
      " web applications.</li>")

      site.text_snippets.create!(name: 'our-offering', 
      title: 'Our Offering',
      body: "<p>INSIGNIA’s offering is founded upon a solid, professional and " \
      " interdisciplinary team of really passionate web developers. We’re " \
      " proud to say our firm has a world class development team which is" \
      " able to face any challenge your business might need, from handling " \
      " new projects as well and maintaining existing ones to scaling " \
      " high-traffic sites into cloud-based hosting system.</p>" \
      "<p>Our interdisciplinary team allows us to cover a wide range of " \
      " projects due to our variety of skills that complement each other. " \
      " For more information about this you can take a look at " \
      " <a href=\"/people\">our Staff</a>.")

      puts "*** > Complete!"

      puts "\n\nDone!"
    end
  end
end
