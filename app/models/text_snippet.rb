class TextSnippet < ActiveRecord::Base
  extend FriendlyId

  belongs_to :site

  attr_accessible :body, :name, :title, :site_id, :image

  has_attached_file :image, :styles => { :big => "627x404#", :thumb => "100x100#" }

  validates :name, presence: true
  validates :site_id, presence: true

  friendly_id :name, use: [:slugged, :history]

  def summary
    (body || '')[0...140]
  end
end
