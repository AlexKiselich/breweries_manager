require "rails_helper"

RSpec.describe "when I visit '/beers/:id/edit" do
  before :each do
    @omf = Brewery.create!(name: "OMF", draft_lines: 8, serves_food: false)
    @inner_light = Beer.create!(name: "Inner Light", beer_type: "Pale Ale", abv: 6.1, on_draft: true, untapped_rating: 4, brewery_id: @omf.id)
  end
  describe "I see a form to edit the current beer" do
    it 'diplays a form' do
      visit "/beers/#{@inner_light.id}/edit"
      expect(page).to have_field("Name")
      expect(page).to have_field("Beer type")
      expect(page).to have_unchecked_field("true")
      expect(page).to have_unchecked_field("false")
      expect(page).to have_field("abv")
      expect(page).to have_field("Untapped rating")
    end
    it 'allows the visitor to fill in the form and then get redirected to the beer show page' do
      visit "/beers/#{@inner_light.id}/edit"
      
      fill_in("Name", with: "Inner Light")
      fill_in("Beer type", with: "Sour ale")
      fill_in("abv", with: 6.0)
      fill_in("Untapped rating", with: 3)
      choose("false")

      click_button "Update #{@inner_light.name}"
      expect(current_path).to eq("/beers/#{@inner_light.id}")

      expect(page).to have_content("Sour ale")
    end
  end
end