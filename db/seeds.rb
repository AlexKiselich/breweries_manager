# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

    Brewery.destroy_all
    Beer.destroy_all

    @omf = Brewery.create!(name: "OMF", draft_lines: 8, serves_food: false, created_at: 2.days.ago)
    @ratio = Brewery.create!(name: "Ratio", draft_lines: 10, serves_food: false, created_at: 1.days.ago)
    @station_26 = Brewery.create!(name: "Station 26", draft_lines: 15, serves_food: true, created_at: 3.days.ago)

    @omf.beers.create!(name: "Inner Light", beer_type: "Pale Ale", abv: 6.1, on_draft: true, untapped_rating: 4)
    @omf.beers.create!(name: "Super Blue", beer_type: "Blueberry Sour", abv: 7.6, on_draft: true, untapped_rating: 4)
    @omf.beers.create!(name: "Dream Burner", beer_type: "Cold IPA", abv: 6.5, on_draft: true, untapped_rating: 2)
    @ratio.beers.create!(name: "Domestica", beer_type: "Golden Ale", abv: 4.9, on_draft: true, untapped_rating: 3)
    @station_26.beers.create!(name: "Juicy_banger", beer_type: "West Coast IPA", abv: 7.9, on_draft: true, untapped_rating: 3)

    

