class AddPopulationToState < ActiveRecord::Migration
  def change
    add_column :states, :population, :integer
    add_column :states, :area, :float
  end
end
