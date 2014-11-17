class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name
      t.string :abbreviation
      t.integer :state_id
      t.string :fips
      t.string :country

      t.timestamps
    end
  end
end
