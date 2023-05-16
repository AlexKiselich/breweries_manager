require 'rails_helper'

RSpec.describe "/beers/:id" do
  # User Story 4
  before :each do
    @omf = Brewery.create!(name: "OMF", draft_lines: 8, serves_food: false)
    @inner_light = Beer.create!(name: "Inner Light", beer_type: "Pale Ale", abv: 6.1, on_draft: true, untapped_rating: 4, brewery_id: @omf.id)
  end
  describe 'When I visit the beer show page' do
    it 'can display the beer name and attributes' do
      visit "/beers/#{@inner_light.id}"

      expect(page).to have_content(@inner_light.name)
      expect(page).to have_content(@inner_light.abv)
      expect(page).to have_content(@inner_light.beer_type)
      expect(page).to have_content(@inner_light.on_draft)
      expect(page).to have_content(@inner_light.untapped_rating)
    end

    it 'has a link to the beers index and take me there' do
      visit "/beers/#{@inner_light.id}"

      expect(page).to have_link("Beers", href: "/beers") 
      click_link "Beers"

      expect(current_path).to eq("/beers")
    end
  end
end