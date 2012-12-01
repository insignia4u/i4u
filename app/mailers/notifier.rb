class Notifier < ActionMailer::Base

  def contact_message(message)
    @@smtp_settings = load_settings(:to_receive)

    @message = message

    if message.file
      attachments['uploaded'] = {content: message.file.read }
    end

    mail(from: message.email, subject: "Contact from website: #{message.subject}")
  end

  def successfull_subscription(subscriber)
    @@smtp_settings = load_settings(:to_send)

    puts "=" * 50
    puts @@smtp_settings
    puts "=" * 50

    @subscriber = subscriber
    mail(from: @@smtp_settings[:user_name], to: subscriber, subject: "Successfull subscription")
  end

  protected
    def load_settings(name)
      return load_enviroments_setting(name) if %w{development test}.include? Rails.env

      config = YAML.load_file("#{Rails.root}/config/action_mailer.yml")[name.to_s]
      return {
        address:        config["address"],
        port:           config["port"],
        domain:         config["domain"],
        authentication: config["authentication"],
        user_name:      config["user_name"],
        password:       config["password"]
      }
    end

    def load_enviroments_setting(name)
      name = name.to_s.upcase

    puts "=" * 50
    puts ENV["#{name}_ADDRESS"]
    puts "=" * 50

      return {
        address:        ENV["#{name}_ADDRESS"],
        port:           ENV["#{name}_PORT"],
        domain:         ENV["#{name}_DOMAIN"],
        authentication: ENV["#{name}_AUTHENTITACION"],
        user_name:      ENV["#{name}_USER_NAME"],
        password:       ENV["#{name}_PASSWORD"]
      }
    end
end