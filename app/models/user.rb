class User < ActiveRecord::Base
  ROLES = %i(admin moderator user)

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :boards

  geocoded_by :full_street_address
  after_validation :geocode

  def full_street_address
    [address, city, state, country].compact.join(', ')
  end
end
