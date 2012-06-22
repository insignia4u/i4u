class TextSnippet < ActiveRecord::Base
  extend FriendlyId

  belongs_to :site

  attr_accessible :body, :name, :title, :site_id

  validates :name, presence: true
  validates :body, presence: true

  friendly_id :name, use: [:slugged, :history]
end
