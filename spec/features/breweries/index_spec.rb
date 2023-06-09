require 'rails_helper'

RSpec.describe "/breweries (Brewery Index page)", type: :feature do
  # User Story 1
  describe "as a visitor, when I visit the brewery index page" do
    before :each do
      @omf = Brewery.create!(name: "OMF", draft_lines: 8, serves_food: false, created_at: 3.day.ago)
      @ratio = Brewery.create!(name: "Ratio", draft_lines: 10, serves_food: false, created_at: 1.day.ago)
    end
    it 'displays the name of each Brewery' do
      visit "/breweries"

      expect(page).to have_content(@omf.name)
      expect(page).to have_content(@ratio.name)
    end
    it 'displays the breweries names ordered by most recently created first and see when it was created at' do
      visit "/breweries"

      expect(page).to have_content(@omf.name)
      expect(page).to have_content("Created at: #{@omf.created_at}")
      expect(page).to have_content(@ratio.name)
      expect(page).to have_content("Created at: #{@ratio.created_at}")
      expect(@ratio.name).to appear_before(@omf.name)
    end
    it "displays a link to create a new Brewery" do
        visit "/breweries"

        expect(page).to have_link("Create Brewery", href: "/breweries/new")
        click_link "Create Brewery"

        expect(current_path).to eq("/breweries/new")
    end
    it 'displays a link to edit the Brewery' do
      visit "/breweries"
      
      click_link "Edit #{@omf.name}"

      expect(current_path).to eq("/breweries/#{@omf.id}/edit")
    end
    it 'I see a button to delete each brewery and can click it and not see that brewery anymore' do
      visit "/breweries"
      
      expect(page).to have_button("Delete #{@ratio.name}")
      expect(page).to have_content("#{@ratio.name}")

      click_button "Delete #{@ratio.name}"

      expect(page).to_not have_content("#{@ratio.name}")
    end
  end
end