class AttachmentFile < ActiveRecord::Base
  extend FriendlyId

  has_attached_file :file_i4u,
    path: "a/:normalized_basename_:style.:extension"

  validates_attachment :file_i4u, presence: true
  validates :name, uniqueness: true

  friendly_id :name, use: [:slugged, :history]

end
