# Load config/paperclip.yml settings
if paperclip_cfg = YAML.load_file(Rails.root.join('config', 'paperclip.yml'))[Rails.env]
  paperclip_cfg.symbolize_keys!
  command_path = paperclip_cfg.delete(:command_path)

  # Replace Attachment defaults with configuration ones
  Paperclip::Attachment.default_options.merge!(paperclip_cfg)

  # S3 credentials
  Paperclip::Attachment.default_options.merge!(
    :s3_headers => { 'Expires' => 5.years.from_now.httpdate }
  )
  if paperclip_cfg[:storage] == 's3'
    Paperclip::Attachment.default_options.merge!(
      :s3_credentials => {
        :bucket => ENV['AWS_BUCKET'],
        :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
        :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
      }
    )
  end


  # Adjust ImageMagick path to work with Passenger
  if command_path
    Paperclip.options[:command_path] = command_path
  end

  Paperclip.interpolates(:normalized_basename) do |attachment, style|
   attachment.original_filename.gsub(File.extname(attachment.original_filename), "").gsub(/[^A-Za-z0-9_-]/, '_')
  end
end
