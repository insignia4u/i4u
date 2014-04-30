class Category < ActiveRecord::Base
  extend FriendlyId

  has_and_belongs_to_many :articles
  belongs_to :site

  validates :name, presence:true

  friendly_id :name, use: [:slugged, :history]

  def published_articles
    articles.published
  end
end
