class Training < ActiveRecord::Base
  extend FriendlyId

  belongs_to :trainer

  validates :title, :summary, :price, :initial_date, :trainer_id, presence: true

  validates :short_url, if: :short_url_present?,
    uniqueness: true,
    format: {
      with: /\A[a-zA-Z0-9\-]+\z/,
      message: 'Only letters, numbers and dashes allowed.',
      multiline: true
    }

  friendly_id :title, use: [:slugged, :history]
protected

  def short_url_present?
    short_url.present?
  end

end
