class AddLatLongZoomToState < ActiveRecord::Migration
  def change
    add_column :states, :latitude, :float
    add_column :states, :longitude, :float
    add_column :states, :zoom, :integer
  end
end
