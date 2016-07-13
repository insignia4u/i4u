class Training < ActiveRecord::Base
  extend FriendlyId

  belongs_to :trainer

  attr_accessible :title, :subtitle, :summary, :price, :discount, :initial_date, :days_time,
                  :calendar, :topics, :addressed_to, :trainer_id, :payment, :disable_payment,
                  :addressed_to_title, :requirements_title, :requirements, :short_url

  validates :title, :summary, :price, :initial_date, :trainer_id, presence: true

  validates :short_url, if: :short_url_present?, 
    uniqueness: true,
    format: { 
      with: /\A[a-zA-Z0-9\-]+\z/, 
      message: 'Only letters, numbers and dashes allowed.'
    }

  friendly_id :title, use: [:slugged, :history]
protected

  def short_url_present?
    short_url.present?
  end

end
