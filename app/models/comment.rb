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
  after_save :notify_author, if: :can_sent?

  scope :ordered, -> { order("created_at ASC") }
  scope :get_parents, -> { where(comment_id: nil) }

  def get_name_or_anony
    (name.blank?)? 'Anonymous' : name.titleize
  end

  protected

  def get_parents_email
    Comment.find(self.comment_id).email
  end

  def can_sent?
    comment && !get_parents_email.blank?
  end

  def notify_author
    Notifier.notify_to_comments_author(self, get_parents_email).deliver
  end

  def notify_comment
    Notifier.comment_notification(self).deliver
  end
end
