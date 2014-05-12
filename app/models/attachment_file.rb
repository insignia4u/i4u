class AttachmentFile < ActiveRecord::Base
  extend FriendlyId

  validates :name, uniqueness: true

  friendly_id :name, use: [:slugged, :history]

  has_attached_file :file_i4u,
    path: "a/:normalized_basename_:style.:extension"

  validates_attachment :file_i4u, presence: true
end
