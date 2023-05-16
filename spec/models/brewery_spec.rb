require 'rails_helper'

RSpec.describe Brewery, type: :model do
  describe "relationships" do
    it { should have_many :beers }
  end
    before :each do
      @omf = Brewery.create!(name: "OMF", draft_lines: 8, serves_food: false, created_at: 2.days.ago)
      @ratio = Brewery.create!(name: "Ratio", draft_lines: 10, serves_food: false, created_at: 1.days.ago)
      @station_26 = Brewery.create!(name: "Station 26", draft_lines: 15, serves_food: true, created_at: 3.days.ago)
      @inner_light = Beer.create!(name: "Inner Light", beer_type: "Pale Ale", abv: 6.1, on_draft: true, untapped_rating: 4, brewery_id: @omf.id)
      @super_blue = Beer.create!(name: "Super Blue", beer_type: "Blueberry Sour", abv: 7.6, on_draft: true, untapped_rating: 4, brewery_id: @omf.id)
      @dream_burner = Beer.create!(name: "Dream Burner", beer_type: "Cold IPA", abv: 6.5, on_draft: true, untapped_rating: 2, brewery_id: @omf.id)
      
    end

  describe '#sort_by_most_recent' do
    it 'sorts the breweries by most recently created' do
      expect(Brewery.sort_by_most_recent).to eq([@ratio, @omf, @station_26])
    end
  end

  describe '#count' do
    it 'shows the number of beers that brewery has' do
      expect(@omf.count).to eq(3)
    end
  end

  describe "#sort_alphabetically" do
    it 'sorts the beers alphabetically' do
      expect(@omf.sort_alphabetically).to eq([@dream_burner, @inner_light, @super_blue])
      
    end
  end
end

