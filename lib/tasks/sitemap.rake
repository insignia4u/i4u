require 'aws-sdk'
namespace :sitemap do
  desc 'Upload the sitemap files to S3'
  task upload_to_s3: :environment do
    s3 = Aws::S3::Resource.new(
      credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY']),
      region: 'us-east-1'
    )

    bucket = s3.bucket(ENV['AWS_BUCKET_I4U_SITE_2012'])
    Dir.entries(File.join(Rails.root, "tmp", "sitemaps")).each do |file_name|
      next if ['.', '..'].include? file_name
      path = "sitemaps/#{file_name}"
      file = File.join(Rails.root, "tmp", "sitemaps", file_name)

      begin
        obj = bucket.object(path)
        obj.upload_file(file, {acl: 'public-read'})
      rescue Exception => e
        raise e
      end
      puts "Saved #{file_name} to S3"
    end
  end
end