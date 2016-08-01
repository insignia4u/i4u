class LandingPage < ActiveRecord::Base

  has_many :landing_page_items, dependent: :destroy

  accepts_nested_attributes_for :landing_page_items, allow_destroy: true

  validates :folder, :slug, :title, :heading, :description, presence: true

  validates_uniqueness_of :slug, scope: :slug

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
