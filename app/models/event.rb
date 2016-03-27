class Event < ActiveRecord::Base
  belongs_to :host, :class_name => "User"
  belongs_to :guest, :class_name => "User"
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings

  validates :earliest_start, presence: true
  validates :latest_start, presence: true
  validates :repo_link, presence: true, if: :exercism?
  validates :title, presence: true, if: :exercism?
  validates :host, presence: true


  CATEGORIES = ["Ruby", "Rails", "Sinatra", "Javascript"]

  EVENT_TYPE = ["Learn", "Exercism"]

  accepts_nested_attributes_for :host

  def exercism?
    event_type == "Exercism"
  end

  def self.exercism
    Event.where(event_type: "Exercism")
  end

  def self.learn
    Event.where(event_type: "Learn")
  end

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end
  
end
