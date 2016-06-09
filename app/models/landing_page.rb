class LandingPage < ActiveRecord::Base

  has_many :landing_page_items, dependent: :destroy

  attr_accessible :folder, :slug, :title, :heading, :description, :landing_page_items_attributes
  accepts_nested_attributes_for :landing_page_items, allow_destroy: true

  validates :folder, :slug, :title, :heading, :description, presence: true

  before_save :normalize_url_fields

  def path
    "/#{folder}/#{slug}"
  end

protected

  def normalize_url_fields
    self.folder = folder.parameterize
    self.slug   = slug.parameterize
  end
end
