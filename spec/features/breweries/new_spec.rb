require 'rails_helper'

RSpec.describe "/breweries/new" do
  describe "When I visit '/breweries/new"
  it 'allows me to fill out the form to create a new brewery' do
    visit "/breweries/new"
    expect(page).to have_field("Name")
    expect(page).to have_unchecked_field("true")
    expect(page).to have_field("Draft lines")
  end

  it 'can create a Brewery' do
    visit "/breweries/new"
    
    fill_in("Name", with: "Denver Beer Company")
    choose("false")
    fill_in("Draft lines", with: "18")
    save_and_open_page
    
    click_on("Create Brewery")
    
    expect(current_path).to eq("/breweries")
    expect(page).to have_content("Denver Beer Company")
  end
end