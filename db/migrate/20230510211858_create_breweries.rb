class CreateBreweries < ActiveRecord::Migration[7.0]
  def change
    create_table :breweries do |t|
      t.string :name
      t.integer :draft_lines
      t.boolean :serves_food

      t.timestamps
    end
  end
end
