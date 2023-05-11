require 'rails_helper'

RSpec.describe "/breweries (Brewery Index page)", type: :feature do
  # User Story 1
  describe "as a visitor, when I visit the brewery index page" do
    before :each do
      @omf = Brewery.create!(name: "OMF", draft_lines: 8, serves_food: false)
      @ratio = Brewery.create!(name: "Ration", draft_lines: 10, serves_food: false)
    end
    it 'displays the name of each Brewery' do
      
      visit "/breweries"
      save_and_open_page
      expect(page).to have_content(@omf.name)
      expect(page).to have_content(@ratio.name)
    end
  end
end