class AddPopulationToCity < ActiveRecord::Migration
  def change
    add_column :cities, :population, :integer
    add_column :cities, :area, :float

    add_index :cities, [:state_id, :population]
    add_index :cities, [:state_id, :county_id, :population]
  end
end
