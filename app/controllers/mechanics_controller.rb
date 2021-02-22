class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @mechanics_avg_yrs_exp = Mechanic.years_experience_average
  end
end
