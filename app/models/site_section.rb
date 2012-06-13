class SiteSection < ActiveRecord::Base
  extend FriendlyId

  belongs_to :site

  attr_accessible :name, :url

  validates       :site, presence: true

  friendly_id     :name, use: :slugged
end
