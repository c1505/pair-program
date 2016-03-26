class Event < ActiveRecord::Base
  belongs_to :host, :class_name => "User"
  belongs_to :guest, :class_name => "User"
  has_many :comments

  validates :earliest_start, presence: true
  validates :latest_start, presence: true
  validates :repo_link, presence: true, if: :exercism?
  validates :title, presence: true, if: :exercism?


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
end
