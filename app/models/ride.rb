class Ride < ApplicationRecord
  has_many :mechanic_rides, dependent: :destroy
  has_many :mechanics, through: :mechanic_rides

  validates_presence_of :name
end
