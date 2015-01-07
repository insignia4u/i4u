class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :comment

  validates :article, :text, presence:true

  after_create :notify_comment

  scope :ordered, order("created_at ASC")

  def get_name_or_anony
    (name.blank?)? 'Anonymous' : name.titleize
  end

  protected

  def notify_comment
    Notifier.comment_notification(self).deliver
  end
end
