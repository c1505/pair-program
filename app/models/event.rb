class Event < ActiveRecord::Base
  belongs_to :host, :class_name => "User"
  belongs_to :guest, :class_name => "User"
  has_many :comments

  def self.exercism
    Event.where(event_type: "Exercism")
  end
end
