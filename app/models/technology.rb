class Technology < ActiveRecord::Base
  attr_accessible :name, :position

  validates :name, presence: true

  scope :top, ->(l) { limit(l) }
  scope :by_position, order('position')
end
