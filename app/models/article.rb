class Article < ActiveRecord::Base
  extend FriendlyId

  belongs_to :site

  has_attached_file :image,
        styles: {
                  big:          "277x250#", 
                  thumb:        "234x230#", 
                  normal:       "818x403#",
                  medium:       "650x320#",
                  small:        "268x151#",
                  cms_thumb:    "169x100#"
                }

  validates :author, :title, :subtitle, :content, :summary, :publication_date,
  :description, :site, presence: true

  friendly_id :title, use: [:slugged, :history]

  def self.most_recents
    order('created_at DESC').limit(3)
  end

end
