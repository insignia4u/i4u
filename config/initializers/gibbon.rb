MAIL_CHIMP = YAML.load_file("#{Rails.root}/config/gibbon.yml")[Rails.env].symbolize_keys!

Gibbon.api_key           = MAIL_CHIMP[:api_key]
Gibbon.timeout           = 15
Gibbon.throws_exceptions = false
