class Tip < ActiveRecord::Base
  extend FriendlyId

  RAILS_TIP = 0
  TODAY_TIP = 1

  scope :latest_first, -> { order('published_at DESC, created_at DESC') }
  scope :rails_tips, -> { where(tip_type: Tip::RAILS_TIP) }
  scope :today_tips, -> { where(tip_type: Tip::TODAY_TIP) }

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

  validate :check_future_date, :on => :create
  validate :only_one_tip_per_day

  before_save :set_published_time_at_beggining_of_day

  friendly_id :title, use: [:slugged, :history]

  def self.rails_tip
    rails_tips.where('published_at <= ?', Date.today)
      .latest_first
      .limit(1)
      .first
  end

  def self.by_type(type)
    return where("tip_type = ?", type).latest_first if type
    where('published_at <= ?', Date.today).latest_first
  end

  def self.today_tip
    today_tips.where('published_at <= ?', Date.today)
      .latest_first
      .limit(1)
      .first
  end


  def self.month_tips(date)
    where("published_at >= ? and published_at <= ?", date.beginning_of_month, date.end_of_month).
    order('published_at DESC, created_at DESC')
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
