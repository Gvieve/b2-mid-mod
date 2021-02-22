require 'rails_helper'

describe Ride, model: :type do
  describe 'relationships' do
    it {should have_many :mechanic_rides}
    it {should have_many(:mechanics).through(:mechanic_rides)}
  end
end
