class Category < ActiveRecord::Base
  extend FriendlyId

  belongs_to :site
  has_and_belongs_to_many :articles

  validates :name, presence:true

  friendly_id :name, use: [:slugged, :history]

  def published_articles
    articles.published
  end
end
