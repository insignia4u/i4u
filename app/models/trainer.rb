class Trainer < ActiveRecord::Base
  has_many :trainings

  validates :name, :title, :profile, presence: true

  has_attached_file :image, styles: {
    big:          "277x250#",
    thumb:        "234x230#",
    normal:       "818x403#",
    medium:       "650x320#",
    small:        "268x151#",
    post_thumb:   "818",
    cms_thumb:    "169x100#"
  }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates :image, attachment_presence: true

end
