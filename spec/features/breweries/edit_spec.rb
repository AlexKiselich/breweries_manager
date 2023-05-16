require 'rails_helper'

RSpec.describe "When I visit '/breweries/:id/edit'" do
before :each do
  @ratio = Brewery.create!(name: "Ratio", draft_lines: 10, serves_food: false, created_at: 1.day.ago)
end
  describe "I see a form to edit with the Brewery's attributes" do
    it "displays a form and allows me to fill it out" do
      visit "/breweries/#{@ratio.id}/edit"

      expect(page).to have_field("Name")
      expect(page).to have_unchecked_field("true")
      expect(page).to have_unchecked_field("false")
      expect(page).to have_field("Draft lines")
    end

    it "allows me to update brewery and then I am redirected to the Brewery's ID page with the updated info" do
      visit "/breweries/#{@ratio.id}/edit"

      fill_in("Name", with: "Ratio")
      choose("true")
      fill_in("Draft lines", with: 13)
      click_button "Update #{@ratio.name}"
      expect(current_path).to eq("/breweries/#{@ratio.id}")
    end
  end
end