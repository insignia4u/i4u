class Value < ActiveRecord::Base
  belongs_to :site

  validates :description, :title, :site, presence:true
  validates :title, uniqueness:true

  # attr_accessible :description, :subtitle, :title, :image, :site_id

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" },
                    default_url: "/images/:style/missing.png"

  delegate :name, to: :site, prefix: :site
end
