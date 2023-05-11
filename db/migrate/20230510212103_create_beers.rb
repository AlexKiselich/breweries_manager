class CreateBeers < ActiveRecord::Migration[7.0]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :beer_type
      t.float :abv
      t.boolean :on_draft
      t.integer :untapped_rating
      t.references :brewery, null: false, foreign_key: true

      t.timestamps
    end
  end
end
