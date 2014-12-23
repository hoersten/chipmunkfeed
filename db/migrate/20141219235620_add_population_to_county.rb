class AddPopulationToCounty < ActiveRecord::Migration
  def change
    add_column :counties, :population, :integer
    add_column :counties, :area, :float

    add_index :counties, [:state_id, :population]
  end
end
