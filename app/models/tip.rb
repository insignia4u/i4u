class Tip < ActiveRecord::Base
  extend FriendlyId

  has_attached_file :image,
        styles: {
                  thumb:        "234x230#", 
                  normal:       "818x403#",
                  medium:       "650x320#",
                  small:        "268x151#",
                  cms_thumb:    "169x100#"
                }

  validates :title, :type, :description, :content, presence: true

  friendly_id :title, use: [:slugged, :history]
end
