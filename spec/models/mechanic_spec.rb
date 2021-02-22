require 'rails_helper'

describe Mechanic, model: :type do
  describe 'relationships' do
    it {should have_many :mechanic_rides}
    it {should have_many(:rides).through(:mechanic_rides)}
  end

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :years_experience}
  end

  describe 'class methods' do
    describe '::years_experience_average' do
      it 'returns average years of experience for all mechanics' do
        avery = Mechanic.create!(name: "Avery Jones", years_experience: 8)
        herbert = Mechanic.create!(name: "Herbert Fallon", years_experience: 3)
        elon = Mechanic.create!(name: "Elon Musk", years_experience: 11)
        sarah = Mechanic.create!(name: "Sarah Ledbetter", years_experience: 5)

        expect(Mechanic.years_experience_average).to eq(0.675e1)
      end
    end
  end
end
