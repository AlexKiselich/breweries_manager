require 'rails_helper'

RSpec.describe '/beers' do
  #User Story 3
  describe "When I visit the Beers index page" do
    before :each do
      @omf = Brewery.create!(name: "OMF", draft_lines: 8, serves_food: false)
      @inner_light = Beer.create!(name: "Inner Light", beer_type: "Pale Ale", abv: 6.1, on_draft: true, untapped_rating: 5, brewery_id: @omf.id)
      @super_blue = Beer.create!(name: "Super Blue", beer_type: "Blueberry Sour", abv: 7.6, on_draft: false, untapped_rating: 4, brewery_id: @omf.id)
    end
    it 'displays the Beers and their attributes' do
      visit '/beers'

      expect(page).to have_content(@inner_light.name)
      expect(page).to have_content(@inner_light.beer_type)
      expect(page).to have_content(@inner_light.abv)
      expect(page).to have_content(@inner_light.on_draft)
      expect(page).to have_content(@inner_light.untapped_rating)
    end
    it 'only shows beers that are On Draft' do
      visit '/beers'
      expect(page).to have_content(@inner_light.name)
      expect(page).to have_content(@inner_light.beer_type)
      expect(page).to have_content(@inner_light.abv)
      expect(page).to have_content(@inner_light.on_draft)
      expect(page).to have_content(@inner_light.untapped_rating)
      expect(page).to_not have_content(@super_blue.name)
      expect(page).to_not have_content(@super_blue.beer_type)
      expect(page).to_not have_content(@super_blue.abv)
      expect(page).to_not have_content(@super_blue.on_draft)
      expect(page).to_not have_content(@super_blue.untapped_rating)
    end
    it "has a link to edit the beer info" do
      visit '/beers'

      expect(page).to have_link("Edit #{@inner_light.name}")

      click_on "Edit #{@inner_light.name}"

      expect(current_path).to eq("/beers/#{@inner_light.id}/edit")
    end
    it 'has a button to delete beer' do
      visit '/beers'
      expect(page).to have_button("Delete #{@inner_light.name}")
      click_button "Delete #{@inner_light.name}"
      expect(page).to_not have_content("#{@inner_light.name}")
    end
  end
end