class Mechanic < ApplicationRecord
  has_many :mechanic_rides, dependent: :destroy
  has_many :rides, through: :mechanic_rides

  validates_presence_of :name, :years_experience

  def self.years_experience_average
    average(:years_experience)
  end

  def open_rides_ordered_thrill_rating_desc
    rides.where(open: :true).order(thrill_rating: :desc)
  end
end
