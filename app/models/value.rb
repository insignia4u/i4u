class Value < ActiveRecord::Base
  belongs_to :site

  has_attached_file :image,
    styles: { medium: "300x300>", thumb: "100x100>" },
    default_url: "/images/:style/missing.png"

  validates :description, :title, :site, presence:true
  validates :title, uniqueness:true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  delegate :name, to: :site, prefix: :site
end
