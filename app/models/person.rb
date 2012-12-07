class Person < ActiveRecord::Base
  belongs_to :site
  belongs_to :title

  attr_accessible :site_id, :title_id, :bio, :first_name, :last_name, :photo,
    :site, :title, :position

  validates :site,       presence: true
  validates :title,      presence: true
  validates :bio,        presence: true, length: { maximum: 300 }
  validates :first_name, presence: true
  validates :last_name,  presence: true

  has_attached_file :photo, styles: {thumb: "73x70"}

  validates_attachment :photo, presence: true,
    content_type: { content_type: ['image/jpeg', 'image/png'] }

  after_create { self.update_column(:position, (Person.maximum(:position) || 0) + 1) }

  scope :by_position,   order(:position)
  scope :last_position, order('position DESC')
  
  def full_name
    "#{first_name} #{last_name}"
  end
end
