require 'rails_helper'

describe 'When I visit a mechanics index page' do
  before :each do
    @avery = Mechanic.create!(name: "Avery Jones", years_experience: 8)
    @herbert = Mechanic.create!(name: "Herbert Fallon", years_experience: 3)
    @elon = Mechanic.create!(name: "Elon Musk", years_experience: 11)
    @sarah = Mechanic.create!(name: "Sarah Ledbetter", years_experience: 5)
  end

  it 'I see a list of all mechanics names and years of experience' do
    visit mechanics_path

    expect(current_path).to eq("/mechanics")
    expect(page).to have_content("All Mechanics")

    within ".mechanics" do
      expect(page).to have_content("Avery Jones: 8 years of experience")
      expect(page).to have_content("Herbert Fallon: 3 years of experience")
      expect(page).to have_content("Elon Musk: 11 years of experience")
      expect(page).to have_content("Sarah Ledbetter: 5 years of experience")
    end
  end

  it 'has the average years of experience for all mechanics' do
    visit mechanics_path

    expect(page).to have_content("Average Years of Experience: 6.75")
  end

  it 'has a link to each mechanic that link takes to me their show page' do
    visit mechanics_path

    expect(page).to have_link("Avery Jones")
    expect(page).to have_link("Herbert Fallon")
    expect(page).to have_link("Elon Musk")
    expect(page).to have_link("Sarah Ledbetter")

    click_link "Avery Jones"
    expect(current_path).to eq("/mechanics/#{@avery.id}")
  end
end
