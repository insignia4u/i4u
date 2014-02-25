class Article < ActiveRecord::Base
  extend FriendlyId

  belongs_to :site
  has_many :comments
  has_and_belongs_to_many :categories

  has_attached_file :image,
        styles: {
                  big:          "277x250#",
                  thumb:        "234x230#",
                  normal:       "818x403#",
                  medium:       "650x320#",
                  small:        "268x151#",
                  cms_thumb:    "169x100#"
                }

  validates :author, :title, :subtitle, :content, :summary, :publication_date,
  :description, :site, :tag_list,presence: true

  friendly_id :title, use: [:slugged, :history]

  acts_as_taggable

  def self.most_recents
    where('publication_state = ? AND publication_date <= ?',1, Date.today)
    .order('publication_date DESC, id DESC')
    .limit(3)
  end

  def self.next_article(article)
    ids = select('id').where('publication_state = ?', 1)
                      .order('publication_date DESC, id DESC')
    index = ids.index(article) - 1
    return false if index < 0
    return find(ids[index].id) if ids[index]
    false
  end

  def self.prev_article(article)
    ids = select('id').where('publication_state = ?', 1)
                      .order('publication_date DESC, id DESC')
    index = ids.index(article) + 1
    return find(ids[index].id) if ids[index]
    false
  end

  def count_comments
    comments.count
  end
end
