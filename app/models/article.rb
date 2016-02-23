class Article < ActiveRecord::Base
  extend FriendlyId

  belongs_to :site
  has_many :comments
  has_and_belongs_to_many :categories

  has_attached_file :image, styles: {
    big:          "277x250#",
    thumb:        "234x230#",
    normal:       "818x403#",
    medium:       "650x320#",
    small:        "268x151#",
    post_thumb:   "818",
    cms_thumb:    "169x100#"
  }

  validates :author, :title, :subtitle, :content, :summary, :publication_date,
  :description, :site, presence: true

  validates :short_url, if: :short_url_present?, 
    uniqueness: true,
    format: { 
      with: /\A[a-zA-Z0-9\-]+\z/, 
      message: 'Only letters, numbers and dashes allowed.'
    }

  friendly_id :title, use: [:slugged, :history]

  delegate :count, to: :comments, prefix: true

  scope :published,    -> { where(publication_state: 1) }
  scope :latest_first, -> { order('publication_date DESC, id DESC') }
  scope :events,       -> { where(is_event: true) }

  def self.most_recents
    published.where('publication_date <= ?', Date.today)
    .latest_first
    .limit(3)
  end

protected

  def short_url_present?
    short_url.present?
  end

end
