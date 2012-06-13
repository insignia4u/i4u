class Site < ActiveRecord::Base
  attr_accessible :name, :abbreviation

  validates :name,         presence: true
  validates :abbreviation, presence: true, uniqueness: true

  has_many :site_sections
  has_many :projects

  scope :live,   where( live: true )
  scope :hidden, where( live: false )

  def live!
    self.live = true
    save!
  end

  def hide!
    self.live = false
    save!
  end

  def available?
    live?
  end

  def publication_state
    available? ? "Live" : "Hidden"
  end
end
