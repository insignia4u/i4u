class Tip < ActiveRecord::Base
  extend FriendlyId

  belongs_to :site

  has_attached_file :image,
        styles: {
                  thumb:        "234x230#", 
                  normal:       "818x403#",
                  medium:       "650x320#",
                  small:        "268x151#",
                  cms_thumb:    "169x100#"
                }

  validates :title, :tip_type, :description, :content,:published_at,
   :site, presence: true

  validate :check_future_date, :only_one_tip_per_day

  before_save :set_published_time_at_beggining_of_day

  friendly_id :title, use: [:slugged, :history]

  def self.rails_tip
    where('tip_type = 0 AND published_at <= ?', Date.today).
    order('published_at DESC, created_at DESC').
    limit(1).
    first
  end

  def self.today_tip
    where('tip_type = 1 AND published_at <= ?', Date.today).
    order('published_at DESC, created_at DESC').
    limit(1).
    first
  end

private

  def check_future_date
    if published_at and published_at < Date.today
      errors.add(:published_at, 'has to be a date of today or the future.')
    end
  end

  def set_published_time_at_beggining_of_day
    self.published_at = self.published_at.at_beginning_of_day
  end

  def only_one_tip_per_day
    if published_at
      tips = Tip.where('published_at = ? AND tip_type = ?', 
                    self.published_at.at_beginning_of_day, self.tip_type)

      errors.add(:published_at, 'already a tip with this date.') if tips.any?

    end
  end

end
