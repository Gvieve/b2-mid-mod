class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @mechanics_avg_yrs_exp = Mechanic.years_experience_average
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = @mechanic.open_rides_ordered_thrill_rating_desc
  end
end
