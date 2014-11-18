class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.belongs_to :state
      t.belongs_to :county
      t.string :name
      t.decimal :latitude, :precision => 10, :scale => 7
      t.decimal :longtitude, :precision => 10, :scale => 7
      t.string :gnis
      t.string :fips
      t.integer :msa
      t.integer :usa
      t.integer :cbsa
      t.integer :csa
      t.integer :psa
      t.integer :dma
      t.string :slug

      t.timestamps
    end
    add_index :cities, :gnis
    add_index :cities, :fips
    add_index :cities, :slug
  end
end
