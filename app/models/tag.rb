class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :events, through: :taggings
  validates :name, presence: true, uniqueness: true

  def self.counts
    self.select("name, count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id")
  end
end
