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
  :description, :site, :tag_list,presence: true

  friendly_id :title, use: [:slugged, :history]

  acts_as_taggable

  def self.most_recents
    where('publication_state = ? AND publication_date <= ?',1, Date.today)
    .order('created_at ASC')
    .limit(3)
  end
end
