class Training < ActiveRecord::Base
  extend FriendlyId

  belongs_to :trainer

  serialize :days

  attr_accessible :title, :subtitle, :summary, :price, :discount, :initial_date, :days, :time,
                  :number_of_classes, :topics, :addressed_to, :trainer_id

  friendly_id :title, use: [:slugged, :history]
  before_validation do |model|
    model.days.reject!(&:blank?) if model.days
  end
end
