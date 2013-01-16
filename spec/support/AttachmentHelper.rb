include ActionDispatch::TestProcess

module FactoryGirl
  module AttachmentHelper
    def self.uploaded_file
      dir = File.join [Rails.root(), 'spec', 'support', 'fake attachments', 'pdf'] 
      fixture_file_upload Dir["#{dir}/*.pdf"].sample, 'application/pdf'
    end

    def self.uploaded_image
      dir = File.join [Rails.root(), 'spec', 'support', 'fake attachments', 'jpg'] 
      fixture_file_upload Dir["#{dir}/*.jpg"].first, 'image/jpg'
    end
  end
end
