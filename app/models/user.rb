class User < ActiveRecord::Base
  ROLES = %i(admin moderator user)

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :boards, dependent: :destroy
<<<<<<< HEAD
=======

  validates :email, presence: true,
                    length: { minimum: 3, maximum: 254},
                    uniqueness: true
                    #format: { with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

  validates :login, length: { in: 0..25  },
                    uniqueness: true

  validates :full_name, length: { in: 1..50 }

  #validates :role, inclusion: { in: ROLES }

  validates :zip, length: { in: 1..10 }
>>>>>>> dev

  geocoded_by :full_street_address
  after_validation :geocode

  def full_street_address
    [zip, address, city, state, country].compact.join(', ')
  end
end
