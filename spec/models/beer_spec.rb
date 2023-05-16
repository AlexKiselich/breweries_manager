require 'rails_helper'

RSpec.describe Beer, type: :model do
  before :each do
    @omf = Brewery.create!(name: "OMF", draft_lines: 8, serves_food: false)
    @inner_light = Beer.create!(name: "Inner Light", beer_type: "Pale Ale", abv: 6.1, on_draft: true, untapped_rating: 4, brewery_id: @omf.id)
    @super_blue = Beer.create!(name: "Super Blue", beer_type: "Blueberry Sour", abv: 7.6, on_draft: false, untapped_rating: 4, brewery_id: @omf.id)
    @times_arrow =Beer.create!(name: "Super Blue", beer_type: "Blueberry Sour", abv: 7.7, on_draft: true, untapped_rating: 3, brewery_id: @omf.id)
  end
  describe "relationships" do
    it { should belong_to :brewery }
  end
  
  describe "#only_true" do
    it 'only shows beers that are on draft' do
      expect(Beer.only_true).to eq([@inner_light, @times_arrow])
    end
  end
end