require 'rails_helper'

RSpec.describe "/beers/:id" do
  # User Story 4
  before :each do
    @omf = Brewery.create!(name: "OMF", draft_lines: 8, serves_food: false)
    @inner_light = Beer.create!(name: "Inner Light", beer_type: "Pale Ale", abv: 6.1, on_draft: true, untapped_rating: 4, brewery_id: @omf.id)
    @super_blue = Beer.create!(name: "Super Blue", beer_type: "Blueberry Sour", abv: 7.6, on_draft: false, untapped_rating: 4, brewery_id: @omf.id)

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
    it 'has a link to the beers index and takes me there' do
      visit "/beers/#{@inner_light.id}"

      expect(page).to have_link("All Beers", href: "/beers") 
      click_link "All Beers"

      expect(current_path).to eq("/beers")
    end
    it 'has a link to update beers and takes me to that edit page' do
      visit "/beers/#{@inner_light.id}"
      expect(page).to have_link("Update Beer")

      click_link "Update Beer"

      expect(current_path).to eq("/beers/#{@inner_light.id}/edit")
    end
    it 'displays a link to Delete beer' do
      visit "/beers/#{@inner_light.id}"

      expect(page).to have_content("#{@inner_light.name}")
      expect(page).to have_button("Delete #{@inner_light.name}")

      click_button "Delete #{@inner_light.name}"

      expect(current_path).to eq("/beers")
      
      expect(page).to_not have_content("#{@inner_light.name}")
    end
  end
end