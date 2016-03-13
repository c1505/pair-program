class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events, :foreign_key => 'host_id'
  has_many :reservations, :foreign_key => 'guest_id', class_name: "Event"

  def availability_to_array
    availability.split(",")
  end
end
