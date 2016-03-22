class Event < ActiveRecord::Base
  belongs_to :host, :class_name => "User"
  belongs_to :guest, :class_name => "User"
  has_many :comments

  CATEGORIES = ["Ruby", "Rails", "Sinatra", "Javascript"]

  EVENT_TYPE = ["Learn", "Exercism"]

  accepts_nested_attributes_for :host

  def self.exercism
    Event.where(event_type: "Exercism")
  end

  def self.learn
    Event.where(event_type: "Learn")
  end
end
