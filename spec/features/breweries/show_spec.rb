require 'rails_helper'

RSpec.describe "/breweries/:id" do
  # User Story 2
  describe 'as a visitor, when  I visit the brewery show page' do
    before :each do
      @omf = Brewery.create!(name: "OMF", draft_lines: 8, serves_food: false)
      @ratio = Brewery.create!(name: "Ration", draft_lines: 10, serves_food: false)
    end
    it "displays the brewery's attributes" do
      visit "/breweries/#{@omf.id}"
      save_and_open_page
      expect(page).to have_content(@omf.name)
    end
  end
end