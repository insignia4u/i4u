class Values < ActiveRecord::Base
  belongs_to :site
  attr_accessible :description, :subtitle, :title, :image, :site_id
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" },
                    default_url: "/images/:style/missing.png"

  validates :description, :title, :site, presence:true
  validates :title, uniqueness:true

  delegate :site, to: :site, prefix: :site
end
