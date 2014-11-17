class CreateCounties < ActiveRecord::Migration
  def change
    create_table :counties do |t|
      t.belongs_to :state
      t.string :name
      t.string :county_type
      t.integer :county_id
      t.string :fips
      t.string :slug

      t.timestamps
    end
    add_index :counties, :fips
    add_index :counties, :slug
  end
end
