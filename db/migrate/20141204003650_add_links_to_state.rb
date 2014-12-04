class AddLinksToState < ActiveRecord::Migration
  def change
    add_column :states, :wikipedia, :string
    add_column :states, :freebase, :string
    add_column :states, :twitter, :string
    add_column :states, :url, :string
  end
end
