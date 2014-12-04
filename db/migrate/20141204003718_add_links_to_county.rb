class AddLinksToCounty < ActiveRecord::Migration
  def change
    add_column :counties, :wikipedia, :string
    add_column :counties, :freebase, :string
    add_column :counties, :twitter, :string
    add_column :counties, :url, :string
  end
end
