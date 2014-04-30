class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :comment

  validates :article, :text, presence:true

  def get_name_or_anony
    (name.blank?)? 'Anonymous' : name.titleize
  end
end
