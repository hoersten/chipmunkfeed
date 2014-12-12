class AddCapitolToStatesAndCounties < ActiveRecord::Migration
  def change
    add_column :cities, :state_capital, :tinyint
    add_column :cities, :county_capital, :tinyint

    add_index :cities, [:state_capital, :state_id]
    add_index :cities, [:county_capital, :county_id]
  end
end
