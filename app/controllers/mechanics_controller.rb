class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @mechanics_avg_yrs_exp = Mechanic.years_experience_average
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    open_rides = @mechanic.open_rides
    @rides = open_rides.order(thrill_rating: :desc)
  end
end
