class SiteSection < ActiveRecord::Base
  extend FriendlyId

  belongs_to :site

  validates       :site, presence: true

  friendly_id     :name, use: :slugged
end
