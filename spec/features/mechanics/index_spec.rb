require 'rails_helper'

describe 'When I visit a mechanics index page' do
  before :each do
    avery = Mechanic.create!(name: "Avery Jones", years_experience: 8)
    herbert = Mechanic.create!(name: "Herbert Fallon", years_experience: 3)
    elon = Mechanic.create!(name: "Elon Musk", years_experience: 11)
    sarah = Mechanic.create!(name: "Sarah Ledbetter", years_experience: 5)
  end

  it 'I see a list of all mechanics names and years of experience' do
    visit mechanics_path

    expect(page).to have_content("All Mechanics")
    expect(page).to have_content("Avery Jones: 8 years of experience")
    expect(page).to have_content("Herbert Fallon: 3 years of experience")
    expect(page).to have_content("Elon Musk: 11 years of experience")
    expect(page).to have_content("Sarah Ledbetter: 5 years of experience")
  end
end
