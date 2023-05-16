require 'rails_helper'

RSpec.describe "/breweries/:brewery_id/beer_table_name" do
  describe "When I visit a Breweries beer table page" do
    before :each do
      @omf = Brewery.create!(name: "OMF", draft_lines: 8, serves_food: false)
      @inner_light = Beer.create!(name: "Inner Light", beer_type: "Pale Ale", abv: 6.1, on_draft: true, untapped_rating: 4, brewery_id: @omf.id)
      @super_blue = Beer.create!(name: "Super Blue", beer_type: "Blueberry Sour", abv: 7.6, on_draft: true, untapped_rating: 4, brewery_id: @omf.id)
    end
    it 'displays the beers that is associated with that Brewery and the attributes' do
      visit "/breweries/#{@omf.id}/beers"
      expect(page).to have_content(@omf.name)
      expect(page).to have_content("Brewery ID: #{@omf.id}")
      expect(page).to have_content(@inner_light.name)
      expect(page).to have_content(@inner_light.abv)
      expect(page).to have_content(@inner_light.on_draft)
      expect(page).to have_content(@inner_light.beer_type)
      expect(page).to have_content(@inner_light.untapped_rating)
      expect(page).to have_content(@super_blue.name)
      expect(page).to have_content(@super_blue.abv)
      expect(page).to have_content(@super_blue.on_draft)
      expect(page).to have_content(@super_blue.beer_type)
      expect(page).to have_content(@super_blue.untapped_rating)
    end
    it 'displays a link to add a new beer for this brewery' do
      visit "/breweries/#{@omf.id}/beers"
      
      expect(page).to have_link("Create #{@omf.name} Beer", href: "/breweries/#{@omf.id}/beers/new")

      click_link "Create #{@omf.name} Beer"

      expect(current_path).to eq("/breweries/#{@omf.id}/beers/new")
    end
  end
end