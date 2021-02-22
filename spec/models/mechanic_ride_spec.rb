require 'rails_helper'

describe MechanicRide, model: :type do
  describe 'relationships' do
    it {should belong_to :mechanic}
    it {should belong_to :ride}
  end
end
