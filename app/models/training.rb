class Training < ActiveRecord::Base
  extend FriendlyId

  belongs_to :trainer

  attr_accessible :title, :subtitle, :summary, :price, :discount, :initial_date, :days_time,
                  :calendar, :topics, :addressed_to, :trainer_id, :payment, :disable_payment,
                  :addressed_to_title, :requirements_title, :requirements

  validates :title, :summary, :price, :initial_date, :trainer_id, presence: true

  friendly_id :title, use: [:slugged, :history]

end
