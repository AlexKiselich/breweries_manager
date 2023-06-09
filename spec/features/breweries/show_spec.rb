require 'rails_helper'

RSpec.describe "/breweries/:id" do
  # User Story 2
  describe 'as a visitor, when  I visit the brewery show page' do
    before :each do
      @omf = Brewery.create!(name: "OMF", draft_lines: 8, serves_food: false)
      @ratio = Brewery.create!(name: "Ratio", draft_lines: 10, serves_food: false)
      @inner_light = Beer.create!(name: "Inner Light", beer_type: "Pale Ale", abv: 6.1, on_draft: true, untapped_rating: 4, brewery_id: @omf.id)
      @super_blue = Beer.create!(name: "Super Blue", beer_type: "Blueberry Sour", abv: 7.6, on_draft: true, untapped_rating: 4, brewery_id: @omf.id)
      @domestica = Beer.create!(name: "Domestica", beer_type: "Golden Ale", abv: 4.9, on_draft: true, untapped_rating: 3, brewery_id: @ratio.id)
      
    end
    it "displays the brewery's attributes" do
      visit "/breweries/#{@omf.id}"
      expect(page).to have_content(@omf.name)
      expect(page).to have_content("Number of Draft Lines: #{@omf.draft_lines}")
      expect(page).to have_content("Does it serve food: #{@omf.serves_food}")
    end

    it 'displays the count of beers in each brewery' do
      # User story 7
      visit "/breweries/#{@omf.id}"
      expect(page).to have_content("Beer Count: 2")
    end

    it 'will display a link to breweries index and takes me there' do
      visit "/breweries/#{@omf.id}"

      expect(page).to have_link("All Breweries", href: "/breweries")
      click_link "All Breweries"

      expect(current_path).to eq("/breweries")
    end

    it "display a link to take me to '/brewery/:id/beers" do
      visit "/breweries/#{@omf.id}"

      expect(page).to have_link("OMF", href: "/breweries/#{@omf.id}/beers")

      click_link "OMF"

      expect(current_path).to eq("/breweries/#{@omf.id}/beers")
    end
    it 'displays a link to update the Brewery' do
      visit "/breweries/#{@omf.id}"
      click_link "Update #{@omf.name}"

      expect(current_path).to eq("/breweries/#{@omf.id}/edit")
    end
    it 'Displays a link to delete the Brewery' do
      visit "/breweries/#{@omf.id}"

      expect(page).to have_button("Delete #{@omf.name}")

      click_button "Delete #{@omf.name}"

      expect(current_path).to eq("/breweries")
      expect(page).to_not have_content("#{@omf.name}")
    end
  end
end