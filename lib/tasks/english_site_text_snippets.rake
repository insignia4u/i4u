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
      site.text_snippets.create!(name: "technology-list-header", title: "Technologies")
      site.text_snippets.create!(name: "tool-list-header", title: "Tools")
      site.text_snippets.create!(name: "to-separator-project-duration", title: "to")
      site.text_snippets.create!(name: "duration-project-header", title: "Development date")

      puts "*** > Complete!"


      puts "\n*** > People Snippets"
      site.text_snippets.create!(name: "staff", title: "staff")
      site.text_snippets.create!(name: "our-mission", title: "Our mission", 
        body: "The players all played at once without waiting for turns, quarrelling" \
        " all the while, and fighting for the hedgehogs; and in a very short" \
        " time the Queen was in a furious passion, and went stamping about, and" \
        " shouting 'Off with his head!' or 'Off with her head!'" \
        " about once in a  minute.")

      site.text_snippets.create!(name: "our-vision", title: "Our vision",
        body: "The players all played at once without waiting for turns, quarrelling" \
        " all the while, and fighting for the hedgehogs; and in a very short" \
        " time the Queen was in a furious passion, and went stamping about, and" \
        " shouting 'Off with his head!' or 'Off with her head!'" \
        " about once in a  minute.")
      site.text_snippets.create!(name: "our-values", title: "Our values", 
        body: "The players all played at once without waiting for turns, quarrelling" \
        " all the while, and fighting for the hedgehogs; and in a very short" \
        " time the Queen was in a furious passion, and went stamping about, and" \
        " shouting 'Off with his head!' or 'Off with her head!'" \
        " about once in a  minute.")

      site.text_snippets.create!(name:'who-we-are', title: 'Who we are',
        body: "The players all played at once without waiting for turns," \
        "quarrelling all the while, and fighting for the hedgehogs; and in " \
        "a very short time the Queen was in a furious passion, " \
        "and went stamping about, and shouting 'Off with his head!' or " \
        "'Off with her head!' about once in a minute.\n" \
        "Alice began to feel very uneasy: to be sure, she " \
        "had not as yet had any dispute with the Queen, but she knew that " \
        "it might happen any minute, 'and then,' thought she, 'what would " \
        "become of me? They're dreadfully fond of beheading people here; " \
        "the great wonder is, that there's any one left alive!'\n" \
        "She was looking about for some way of escape, and wondering " \
        "whether she could get away without being seen, when she noticed " \
        "a curious appearance in the air: it puzzled her very much at first, " \
        "but, after watching it a minute or two, she made it out to be a " \
        "grin, and she said to herself 'It's the Cheshire Cat: now I shall " \
        "have somebody to talk to.'",
        image: File.open(File.join(Rails.root, 'app/assets/images/staff', 'nosotros.JPG')))


        site.text_snippets.create!(name:'our-quality-policy', title: 'Our quality policy',
        body: "The players all played at once without waiting for turns," \
        "quarrelling all the while, and fighting for the hedgehogs; and in " \
        "a very short time the Queen was in a furious passion, " \
        "and went stamping about, and shouting 'Off with his head!' or " \
        "'Off with her head!' about once in a minute.\n" \
        "Alice began to feel very uneasy: to be sure, she " \
        "had not as yet had any dispute with the Queen, but she knew that " \
        "it might happen any minute, 'and then,' thought she, 'what would " \
        "become of me?")

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
      site.text_snippets.create!(name: 'main-content-service', title: 'Highly Interactive Website Development',
        body: "h6. \"What's that?\" cried a boatman, and \"Shut up, you fool!\" \n" \
        "Said a man near me to a yelping dog.  Then the sound came again, " \
        "this time from the direction of Chertsey, a muffled thud--the sound of a gun.\n" \
        "The fighting was beginning.  Almost immediately unseen batteries " \
        "across the river to our right, unseen because of |the trees, took up "\
        "the chorus, firing heavily one after the other.  A woman screamed." \
        " Everyone stood arrested by |the sudden stir of battle, near us and " \
        "yet invisible to us.  Nothing was to be seen save flat meadows, " \
        "cows |feeding unconcernedly for the most part, and silvery pollard " \
        "willows motionless in the warm sunlight.\n"\
        "h6.\"The sojers'll stop 'em,\" said a woman beside  me, doubtfully. " \
        "A haziness rose over the treetops.\n" \
        "\"What's that?\" cried a boatman, and \"Shut up, you fool!\" " \
        "said a man near me to a yelping dog.  Then the sound came again, " \
        "this time from the direction of Chertsey, a muffled thud--the sound of a gun.\n" \
        "The fighting was beginning.  Almost immediately unseen batteries " \
        "across the river to our right, unseen because of the trees, took up " \
        "the chorus, firing heavily one after the other.  A woman screamed. " \
        "Everyone stood arrested by the sudden stir of battle, near us and " \
        "yet invisible to us.  Nothing was to be seen save flat meadows, cows " \
        "feeding unconcernedly for the most part, and silvery pollard willows " \
        "motionless in the warm sunlight.\n" \
        "\"The sojers'll stop 'em, said a woman beside me, doubtfully. " \
        "A haziness rose over the treetops."
        )

      site.text_snippets.create!(name: 'first-side-bar-content-services-page', title: 'How do we do?',
        body: " \"What's that?\" cried a boatman, and \"Shut up, you fool!\" " \
        "said a man near me to a yelping dog.  Then the sound came again, " \
        "this time from the direction of Chertsey, a muffled thud--the sound of a gun.\n" \
        "The fighting was beginning.  Almost immediately unseen batteries " \
        "across the river to our right, unseen because of |the trees, took up "\
        "the chorus, firing heavily one after the other.  A woman screamed." \
        " Everyone stood arrested by |the sudden stir of battle, near us and " \
        "yet invisible to us.  Nothing was to be seen save flat meadows, " \
        "cows |feeding unconcernedly for the most part, and silvery pollard " \
        "willows motionless in the warm sunlight.\n" \
        "\"The sojers'll stop 'em,\" said a woman beside  me, doubtfully. " \
        "A haziness rose over the treetops.")

      site.text_snippets.create!(name: 'second-side-bar-content-services-page', title: 'Our capabilities',
        body: "\"What's that?\" cried a boatman, and \"Shut up, you fool!\" " \
        "said a man near me to a yelping dog.  Then the sound came again, " \
        "this time from the direction of Chertsey, a muffled thud--the sound of a gun.\n" \
        "The fighting was beginning.  Almost immediately unseen batteries " \
        "across the river to our right, unseen because of the trees, took up " \
        "the chorus, firing heavily one after the other.  A woman screamed. " \
        "Everyone stood arrested by the sudden stir of battle, near us and " \
        "yet invisible to us.  Nothing was to be seen save flat meadows, cows " \
        "feeding unconcernedly for the most part, and silvery pollard willows " \
        "motionless in the warm sunlight.\n" \
        "\"The sojers'll stop 'em, said a woman beside me, doubtfully. " \
        "A haziness rose over the treetops.")
      
      # site.text_snippets.create!(name: '', title: '')
      
      puts "*** > Complete!"

      puts "\n\nDone!"
    end
  end
end
