class Project
  module Attachments
    extend ActiveSupport::Concern

    included do
      has_attached_file :image,
        styles: {
                  big:          "277x250#", 
                  thumb:        "234x230#", 
                  normal:       "818x403",
                  medium:       "650x320",
                  small:        "480x236",
                  highlighted:  "397x213",
                  cms_thumb:    "110x100#"
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
