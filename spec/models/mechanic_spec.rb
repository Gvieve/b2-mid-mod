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

  describe 'instance methods' do
    describe '#open_rides_ordered_thrill_rating_desc' do
      it 'returns rides for that mechanic where open is true' do
        avery = Mechanic.create!(name: "Avery Jones", years_experience: 8)
        herbert = Mechanic.create!(name: "Herbert Fallon", years_experience: 3)
        hurler = avery.rides.create!(name: "The Hurler", thrill_rating: 6, open: true)
        tumbler = avery.rides.create!(name: "The Tumbler", thrill_rating: 7, open: true)
        xcelerator = herbert.rides.create!(name: "The Xcelerator", thrill_rating: 9, open: true)
        doom = herbert.rides.create!(name: "Tower of Doom", thrill_rating: 8, open: false)

        expect(avery.open_rides_ordered_thrill_rating_desc).to eq([tumbler, hurler])
        expect(herbert.open_rides_ordered_thrill_rating_desc).to eq([xcelerator])
      end
    end
  end
end
