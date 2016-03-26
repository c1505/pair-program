class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :events, :foreign_key => 'host_id'
  has_many :reservations, :foreign_key => 'guest_id', class_name: "Event"
  has_many :guests, through: :events 
  has_many :hosts, through: :reservations 
  has_many :comments 


  validates :name, presence: true, on: :update
  validates :availability, format: { with: /,/, message: "must be comma separated ex. M 5AM-12PM, T 4PM-7PM"}, on: :update

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name   # assuming the user model has a name
    # user.image = auth.info.image # assuming the user model has an image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def availability_to_array
    if availability
      availability.split(",")
    else
      ["availability not set"]
    end
  end

  def first_name
    name.split(" ").first 
  end
  
end
