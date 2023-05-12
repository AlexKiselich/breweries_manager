require 'rails_helper'

RSpec.describe '/beers' do
  #User Story 3
  describe "When I visit the Beers index page" do
    before :each do
      @omf = Brewery.create!(name: "OMF", draft_lines: 8, serves_food: false)
      @inner_light = Beer.create!(name: "Inner Light", beer_type: "Pale Ale", abv: 6.1, on_draft: true, untapped_rating: 4, brewery_id: @omf.id)
      @super_blue = Beer.create!(name: "Super Blue", beer_type: "Blueberry Sour", abv: 7.6, on_draft: true, untapped_rating: 4, brewery_id: @omf.id)

    end
    it 'displays the Beers and their attributes' do
      visit '/beers'

      save_and_open_page

      expect(page).to have_content(@inner_light.name)
      expect(page).to have_content(@inner_light.beer_type)
      expect(page).to have_content(@inner_light.abv)
      expect(page).to have_content(@inner_light.on_draft)
      expect(page).to have_content(@inner_light.untapped_rating)
    end
  end
end