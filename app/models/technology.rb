class Technology < ActiveRecord::Base

  validates :title, presence: true

  scope :top, ->(l) { limit(l) }
  scope :by_position, order(:position)

  after_create { self.update_column(:position, (Technology.maximum(:position) || 0) + 1) }

end
