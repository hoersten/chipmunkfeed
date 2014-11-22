class CreateDescriptions < ActiveRecord::Migration
  def change
    create_table :descriptions do |t|
      t.belongs_to :state
      t.belongs_to :county
      t.belongs_to :city
      t.text :description
      t.string :tag
      t.boolean :active
      t.string :type

      t.timestamps
    end
  end
end
