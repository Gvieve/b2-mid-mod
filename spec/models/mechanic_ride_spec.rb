require 'rails_helper'

describe MechanicRide, model: :type do
  describe 'relationships' do
    it {should belong_to :mechanics}
    it {should belong_to :rides}
  end
end
