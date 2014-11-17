class AddSlugToState < ActiveRecord::Migration
  def change
    add_column :states, :slug, :string
    add_index :states, :slug
  end
end
