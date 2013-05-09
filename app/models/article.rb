class Article < ActiveRecord::Base
  extend FriendlyId

  belongs_to :site

  validates :title, :subtitle, :content, :summary, :publication_date,:site,
    presence: true

  friendly_id :title, use: [:slugged, :history]

end
