require 'rails_helper'

describe 'When I visit a mechanics show page' do
  before :each do
    Ride.destroy_all
    Mechanic.destroy_all
    @avery = Mechanic.create!(name: "Avery Jones", years_experience: 8)
    @herbert = Mechanic.create!(name: "Herbert Fallon", years_experience: 3)
    @elon = Mechanic.create!(name: "Elon Musk", years_experience: 11)
    @sarah = Mechanic.create!(name: "Sarah Ledbetter", years_experience: 5)
    @hurler = @avery.rides.create!(name: "The Hurler", thrill_rating: 6, open: true)
    @tumbler = @avery.rides.create!(name: "The Tumbler", thrill_rating: 7, open: true)
    @xcelerator = @elon.rides.create!(name: "The Xcelerator", thrill_rating: 9, open: true)
    @herbert.rides << @xcelerator
    @doom = @herbert.rides.create!(name: "Tower of Doom", thrill_rating: 8, open: false)
    @dragon = @sarah.rides.create!(name: "The Dragon", thrill_rating: 4, open: true)
  end

  it 'I see a their name, years of experience, and all the rides they are working on' do
    visit mechanic_path(@avery)

    expect(current_path).to eq("/mechanics/#{@avery.id}")
    expect(page).to have_content("Mechanic: Avery Jones")
    expect(page).to have_content("Years of Experience: 8")
    expect(page).to have_content("Current rides they're working on:")

    within ".rides" do
      expect(page).to have_content("The Hurler")
      expect(page).to have_content("The Tumbler")
      expect(page).not_to have_content("The Xcelerator")
      expect(@tumbler.name).to appear_before(@hurler.name)
    end
  end

  it 'and I do not see rides that are not currently open' do
    visit mechanic_path(@herbert)

    expect(current_path).to eq("/mechanics/#{@herbert.id}")
    expect(page).to have_content("Mechanic: Herbert Fallon")

    within ".rides" do
      expect(page).to have_content("The Xcelerator")
      expect(page).not_to have_content("Tower of Doom")
    end
  end

  it 'has a form to add a ride to this mechanic' do
    visit mechanic_path(@herbert)

    within ".add-ride" do
      expect(page).to have_content("Add a ride to workload:")
      fill_in "Ride Id", with: "#{@tumbler.id}"
      click_button "Add Ride"
      expect(current_path).to eq("/mechanics/#{@herbert.id}")
      expect(page).to have_content("The Tumbler")
      expect(@xcelerator.name).to appear_before(@tumbler.name)
    end
  end
end
