class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  validates_presence_of :name, :years_experience

  def self.years_experience_average
    average(:years_experience)
  end

  def open_rides
    rides.where(open: :true)
  end
end
