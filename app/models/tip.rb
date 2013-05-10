class Tip < ActiveRecord::Base
  extend FriendlyId

  belongs_to :site

  has_attached_file :image,
        styles: {
                  thumb:        "234x230#", 
                  normal:       "818x403#",
                  medium:       "650x320#",
                  small:        "268x151#",
                  cms_thumb:    "169x100#"
                }

  validates :title, :tip_type, :description, :content, :site, presence: true

  friendly_id :title, use: [:slugged, :history]

  def self.rails_tip
    where('tip_type = 0').order('created_at DESC').limit(1).first
  end

  def self.today_tip
    where('tip_type = 1').order('created_at DESC').limit(1).first
  end

end
