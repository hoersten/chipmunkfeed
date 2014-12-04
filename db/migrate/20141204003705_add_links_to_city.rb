class AddLinksToCity < ActiveRecord::Migration
  def change
    add_column :cities, :wikipedia, :string
    add_column :cities, :freebase, :string
    add_column :cities, :twitter, :string
    add_column :cities, :url, :string
  end
end
