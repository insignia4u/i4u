class Project
  module Attachments
    extend ActiveSupport::Concern

    included do
      has_attached_file :image,
        :styles => { :big       => "277x250",
                     :thumb     => "234x230",
                     :normal    => "818x403",
                     :medium    => "650x320",
                     :small     => "268x151",
                     :cms_thumb => "110x100" },

        :convert_options => { :big       => "-crop 277x250+0+0",
                              :thumb     => "-crop 234x230+0+0",
                              :normal    => "-crop 818x403+0+0",
                              :medium    => "-crop 650x320+0+0", 
                              :small     => "-crop 268x151+0+0",
                              :cms_thumb => "-crop 110x100+0+0"
        }

      has_attached_file :featured_image,
        styles: { big: "940x555#", cms_thumb: "169x100#" }


      validates_attachment :image, presence: true,
        content_type: { content_type: ['image/jpeg', 'image/png'] }
      validates_attachment :featured_image,
        content_type: { content_type: ['image/jpeg', 'image/png'] }

      validates :featured_image, attachment_presence: true,
        :if => :highlighted
    end
  end
end
