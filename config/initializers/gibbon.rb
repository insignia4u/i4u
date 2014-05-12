MAIL_CHIMP = YAML.load_file("#{Rails.root}/config/gibbon.yml")[Rails.env].symbolize_keys!

Gibbon::API.api_key           = MAIL_CHIMP[:api_key]
Gibbon::API.timeout           = 15
Gibbon::API.throws_exceptions = false
