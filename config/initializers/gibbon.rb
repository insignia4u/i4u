MAIL_CHIMP = YAML.load_file("#{Rails.root}/config/gibbon.yml")[Rails.env].symbolize_keys!

Gibbon::Request.api_key           = MAIL_CHIMP[:api_key]
Gibbon::Request.timeout           = 15
Gibbon::Request.throws_exceptions = false
