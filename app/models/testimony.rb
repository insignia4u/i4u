class Testimony < ActiveRecord::Base
  validates :body, :video_id, presence: true
  before_validation :set_published_at

  def self.published
    where(published: true).order('published_at DESC').first
  end

  private

  def set_published_at
    self.published_at = DateTime.now if published and new_record?
  end
end
