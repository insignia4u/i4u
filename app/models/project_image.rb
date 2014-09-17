class ProjectImage < ActiveRecord::Base

  belongs_to :project

  has_attached_file :image,
    :styles => { :big       => "277x250",
                 :thumb     => "234x230",
                 :normal    => "818x403",
                 :medium    => "650x320",
                 :small     => "268x151",
                 :cms_thumb => "169x100" },
    :convert_options => { :medium => "-crop 650x320+0+0" }

  validates_attachment :image, presence: true,
        content_type: { content_type: ['image/jpeg', 'image/png'] }

end
