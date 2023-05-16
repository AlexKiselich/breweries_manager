require 'rails_helper'

RSpec.describe "/breweries/:id/beers/new" do
  before :each do
    @omf = Brewery.create!(name: "OMF", draft_lines: 8, serves_food: false)
    
  end
  describe "When I visit breweries/:id/beers/new" do
    it 'has a form for me to fill out' do
      visit "/breweries/#{@omf.id}/beers/new"

      expect(page).to have_field("Name")
      expect(page).to have_unchecked_field("true")
      expect(page).to have_field("abv")
      expect(page).to have_field("Beer type")
      expect(page).to have_unchecked_field("false")
      expect(page).to have_field("Untapped rating")
    end
    it 'allows me to fill in the form and create a new beer, then get redircted to the Brewery Beers index page' do
      visit "/breweries/#{@omf.id}/beers/new"

      fill_in("Name", with: "Time's Arrow")
      choose("true")
      fill_in("abv", with: 7.7)
      fill_in("Beer type", with: "West Coast IPA")
      fill_in("Untapped rating", with: 4)

      click_on("Create #{@omf.name} Beer")

      expect(current_path).to eq("/breweries/#{@omf.id}/beers")
      expect(page).to have_content("Time's Arrow")
    end
  end
end