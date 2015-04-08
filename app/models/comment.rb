class Comment < ActiveRecord::Base
  has_many :replies, :class_name => "Comment", dependent: :destroy

  belongs_to :article
  belongs_to :comment

  validates :article, :text, presence:true
  validates :text, length: {
    maximum: 1401,
    too_long: "%{count} characters is the maximum allowed"
  }

  after_create :notify_comment
  after_save :notify_author, if: :is_answer?

  scope :ordered, order("created_at ASC")

  def get_name_or_anony
    (name.blank?)? 'Anonymous' : name.titleize
  end

  protected

  def is_answer?
    comment && !comment.email.blank?
  end

  def notify_author
    Notifier.notify_to_comments_author(self).deliver
  end

  def notify_comment
    Notifier.comment_notification(self).deliver
  end
end
